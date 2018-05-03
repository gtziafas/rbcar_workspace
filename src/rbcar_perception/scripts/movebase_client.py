#!/usr/bin/env python

import rospy
import actionlib
import message_filters as mf
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry

class movebase_client():

    def __init__(self):
        global flag 
        flag = False
        self.lf_goal = mf.Subscriber("/line_follower/goal_pose", PoseStamped)
        self.odom = mf.Subscriber("/odom", Odometry)
        self.prev_goal = MoveBaseGoal()

        self.ats = mf.ApproximateTimeSynchronizer([self.lf_goal, self.odom], 10, 0.1)
        self.ats.registerCallback(self.callback_in)#, self.client)
        try:
            rospy.spin()
        except KeyboardInterrupt:
            print("Shutting down")

    def callback_in(self, data, odom):
        global flag

        #dump goals that are already set or goals while the car is moving
        if abs(odom.twist.twist.linear.x)>0.01 or abs(odom.twist.twist.linear.y)>0.01 and flag:
            return
        elif abs(odom.pose.pose.position.x - data.pose.position.x)<1 and abs(odom.pose.pose.position.y - data.pose.position.y)<1:
            return
        elif abs(data.pose.position.x-self.prev_goal.target_pose.pose.position.x)<0.3 and abs(data.pose.position.y-self.prev_goal.target_pose.pose.position.y)<0.3:
             return

        client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
        client.wait_for_server()
        flag = True
        rospy.loginfo("Line Follower Goal Set. Sending Pose to Move Base")
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()

        goal.target_pose.pose.position = data.pose.position
        goal.target_pose.pose.orientation = data.pose.orientation
        self.prev_goal = goal
        client.send_goal(goal)
        
        wait = client.wait_for_result()
        if not wait:
            rospy.logerr("Action server not available!")
            rospy.signal_shutdown("Action server not available!")
        else:
            return client.get_result()

def movebase_client_service():
    try:
        rospy.init_node('movebase_client_py')
        result = movebase_client()
        if result:
            rospy.loginfo("Goal execution done!")
    except rospy.ROSInterruptException:
        rospy.loginfo("Navigation test finished.")

if __name__ == '__main__':
    movebase_client_service()
