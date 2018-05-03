;; Auto-generated. Do not edit!


(when (boundp 'robotnik_msgs::RobotnikMotorsStatus)
  (if (not (find-package "ROBOTNIK_MSGS"))
    (make-package "ROBOTNIK_MSGS"))
  (shadow 'RobotnikMotorsStatus (find-package "ROBOTNIK_MSGS")))
(unless (find-package "ROBOTNIK_MSGS::ROBOTNIKMOTORSSTATUS")
  (make-package "ROBOTNIK_MSGS::ROBOTNIKMOTORSSTATUS"))

(in-package "ROS")
;;//! \htmlinclude RobotnikMotorsStatus.msg.html


(defclass robotnik_msgs::RobotnikMotorsStatus
  :super ros::object
  :slots (_name _can_id _motor_status ))

(defmethod robotnik_msgs::RobotnikMotorsStatus
  (:init
   (&key
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:can_id __can_id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:motor_status __motor_status) (let (r) (dotimes (i 0) (push (instance robotnik_msgs::MotorStatus :init) r)) r))
    )
   (send-super :init)
   (setq _name __name)
   (setq _can_id __can_id)
   (setq _motor_status __motor_status)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:can_id
   (&optional __can_id)
   (if __can_id (setq _can_id __can_id)) _can_id)
  (:motor_status
   (&rest __motor_status)
   (if (keywordp (car __motor_status))
       (send* _motor_status __motor_status)
     (progn
       (if __motor_status (setq _motor_status (car __motor_status)))
       _motor_status)))
  (:serialization-length
   ()
   (+
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ;; int32[] _can_id
    (* 4    (length _can_id)) 4
    ;; robotnik_msgs/MotorStatus[] _motor_status
    (apply #'+ (send-all _motor_status :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int32[] _can_id
     (write-long (length _can_id) s)
     (dotimes (i (length _can_id))
       (write-long (elt _can_id i) s)
       )
     ;; robotnik_msgs/MotorStatus[] _motor_status
     (write-long (length _motor_status) s)
     (dolist (elem _motor_status)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int32[] _can_id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _can_id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _can_id i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; robotnik_msgs/MotorStatus[] _motor_status
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _motor_status (let (r) (dotimes (i n) (push (instance robotnik_msgs::MotorStatus :init) r)) r))
     (dolist (elem- _motor_status)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get robotnik_msgs::RobotnikMotorsStatus :md5sum-) "5a73b28e567bd7a8d57f65ffc9524541")
(setf (get robotnik_msgs::RobotnikMotorsStatus :datatype-) "robotnik_msgs/RobotnikMotorsStatus")
(setf (get robotnik_msgs::RobotnikMotorsStatus :definition-)
      "# Name of each motor drive
string[] name
# CAN ID of each motor drive
int32[] can_id
# Status of the motor drive
robotnik_msgs/MotorStatus[] motor_status


================================================================================
MSG: robotnik_msgs/MotorStatus
string state
string status
string communicationstatus
string statusword
string driveflags
string[] activestatusword
string[] activedriveflags
int32 digitaloutputs
int32 digitalinputs

")



(provide :robotnik_msgs/RobotnikMotorsStatus "5a73b28e567bd7a8d57f65ffc9524541")


