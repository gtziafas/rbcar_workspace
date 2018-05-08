#!/usr/bin/python
#author: Georgios Tziafas

import sys
import rospy
import cv2
import math
import tf2_ros
import tf2_geometry_msgs
import numpy as np
import message_filters as mf
from std_msgs.msg import String
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
from cv_bridge import CvBridge, CvBridgeError

class line_follower:

  def __init__(self):
    self.image_pub = rospy.Publisher("line_follower/goal_image", Image, queue_size=20)
    self.pose_pub  = rospy.Publisher("line_follower/goal_pose", PoseStamped, queue_size=20)

    self.bridge = CvBridge()
    self.rgb_sub   = mf.Subscriber("/rgb_topic", Image)
    self.depth_sub = mf.Subscriber("/depth_topic", Image)
    self.odom_sub  = mf.Subscriber("/odom", Odometry)

    self.tf_buffer = tf2_ros.Buffer(rospy.Duration(1200.0)) #tf buffer length
    self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

    self.ats = mf.ApproximateTimeSynchronizer([self.depth_sub, self.rgb_sub, self.odom_sub], 10, 0.1)
    self.ats.registerCallback(self.callback, self.tf_buffer, self.tf_listener)

  def extract_goal_from_line(self, img):
    rows, cols, channels = img.shape
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

    ret, thresh = cv2.threshold(gray,100,255,0)
    thresh[0:rows/4,:]=0 #dump the off-road horizon
    _,contours,hier = cv2.findContours(thresh,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
    contours = sorted(contours, key=cv2.contourArea, reverse=True)
    contours = contours[0:2] #keep only the 2 road lines as contours
    (x,y) = (0,0)
    for i in contours:
      epsilon = 0.05*cv2.arcLength(i,False)
      approx = cv2.approxPolyDP(i,epsilon,True)
      cv2.drawContours(img,[approx],0,(0,0,255),2)
      #print(cv2.contourArea(i))
      y = y + int(0.5 * tuple(i[i[:,:,1].argmin()][0])[1])
      x = x + int(0.5 * tuple(i[i[:,:,1].argmin()][0])[0])
      xr = tuple(i[i[:,:,0].argmax()][0])[0]
      
    if not contours:
      return (0,0,0)
      
    if len(contours)==1 or cv2.contourArea(contours[0])<400 or cv2.contourArea(contours[0])>3699:
      return (0,0,90)

    cv2.circle(img,(x,y),5,(255,0,0),-1) #draw goal point and line connecting to base
    cv2.circle(img,(int(cols/2),rows-1),5,(255,0,0),-1)
    cv2.line(img, (x,y), (int(cols/2),rows-1), (255,0,0), 2)
    omega = math.atan2( (rows-1-y), (x-int(cols/2))  )
    cv2.putText(img,'GOAL',(x+4,y+4),cv2.FONT_HERSHEY_SIMPLEX,0.8,(255,255,255),2,cv2.LINE_AA)

    angle = math.degrees(omega) - 90
    return (x,y,angle)

  def take_turn(self, odom):
    goal_pose = PoseStamped()
    goal_pose.header.frame_id = "odom"
    goal_pose.header.stamp = rospy.Time.now()

    if abs(odom.pose.pose.orientation.w)>0.95 and abs(odom.pose.pose.orientation.z)<0.2:  #turn to -Y
      goal_pose.pose.orientation.z = -0.7071
      goal_pose.pose.orientation.w = 0.7071
      goal_pose.pose.position.x = 33.5 #odom.pose.pose.position.x - distance * math.sin(math.radians(angle))
      goal_pose.pose.position.y = odom.pose.pose.position.y - 2.5 #* math.cos(math.radians(angle))
    elif abs(odom.pose.pose.orientation.z)>0.95  and abs(odom.pose.pose.orientation.w)<0.2: #turn to Y
      goal_pose.pose.orientation.z = 0.7071
      goal_pose.pose.orientation.w = 0.7071
      goal_pose.pose.position.x = 4 #odom.pose.pose.position.x - distance * math.sin(math.radians(angle))
      goal_pose.pose.position.y = odom.pose.pose.position.y + 1 #* math.cos(math.radians(angle))
    elif odom.pose.pose.orientation.z * odom.pose.pose.orientation.w<0: #turn to -X
      goal_pose.pose.orientation.z = 1
      goal_pose.pose.orientation.w = -0.1
      goal_pose.pose.position.x = odom.pose.pose.position.x - 2.5#* math.cos(math.radians(angle))
      goal_pose.pose.position.y = -28 #odom.pose.pose.position.y + distance * math.sin(math.radians(angle))

    return goal_pose

  def convert_goal_point_to_pose(self, odom, distance, angle):
    goal_pose = PoseStamped()
    goal_pose.header.frame_id = "odom"
    goal_pose.header.stamp = rospy.Time.now()

    #decide vehicle direction and goal pose using odometry's orientation
    if abs(odom.pose.pose.orientation.w)>0.95 and abs(odom.pose.pose.orientation.z)<0.2:  #through X axis
      goal_pose.pose.orientation.z = 0
      goal_pose.pose.orientation.w = 1
      goal_pose.pose.position.x = odom.pose.pose.position.x + distance #* math.cos(math.radians(angle)) 
      goal_pose.pose.position.y = 0 #odom.pose.pose.position.y + math.sin(math.radians(angle)) * distance
    elif abs(odom.pose.pose.orientation.z)>0.95  and abs(odom.pose.pose.orientation.w)<0.2: #through -X axis
      goal_pose.pose.orientation.z = 1
      goal_pose.pose.orientation.w = -0.05
      goal_pose.pose.position.x = odom.pose.pose.position.x - distance #* math.cos(math.radians(angle))
      goal_pose.pose.position.y = -28 #odom.pose.pose.position.y + distance * math.sin(math.radians(angle))
    elif odom.pose.pose.orientation.z * odom.pose.pose.orientation.w>0: #through Y axis
      goal_pose.pose.orientation.z = 0.7071
      goal_pose.pose.orientation.w = 0.7071
      goal_pose.pose.position.x = 4 #odom.pose.pose.position.x - distance * math.sin(math.radians(angle))
      goal_pose.pose.position.y = odom.pose.pose.position.y + distance #* math.cos(math.radians(angle))
    else: #through -Y axis
      goal_pose.pose.orientation.z = -0.7071
      goal_pose.pose.orientation.w = 0.7071
      goal_pose.pose.position.x = 33.5 #odom.pose.pose.position.x - distance * math.sin(math.radians(angle))
      goal_pose.pose.position.y = odom.pose.pose.position.y - distance #* math.cos(math.radians(angle))

    return goal_pose

  def callback(self, depth, rgb, odom, tf_buf, tf_list):
    #cv_bridge
    try:
      img = self.bridge.imgmsg_to_cv2(rgb, "bgr8")
    except CvBridgeError as e:
      print(e)

    try:
      depth = self.bridge.imgmsg_to_cv2(depth, "passthrough")
    except CvBridgeError as e:
      print(e)

    #detect road line and extract goal point
    (x,y,angle) = self.extract_goal_from_line(img)
    
    if angle==90:
      pose = self.take_turn(odom)
    elif depth[y,x]>0:
      pose = self.convert_goal_point_to_pose(odom, depth[y,x], angle)
    else:
      pose = self.convert_goal_point_to_pose(odom, 0, 0)
    
    #transform goal pose to map frame
    transform = tf_buf.lookup_transform(pose.header.frame_id,"map",rospy.Time(0),rospy.Duration(0.1))
    pose_transformed = tf2_geometry_msgs.do_transform_pose(pose, transform)

    #publish goal pose and image
    rate = rospy.Rate(30) #20Hz
    try:
      self.pose_pub.publish(pose_transformed)
    except rospy.ROSInterruptException:
      rospy.loginfo("Error in publishing Goal Pose.")

    try:
       self.image_pub.publish(self.bridge.cv2_to_imgmsg(img, "bgr8"))
    except CvBridgeError as e:
      print(e)

    rate.sleep()  

def main(args):
  rospy.init_node('line_follower', anonymous=True)
  lf = line_follower()
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
