;; Auto-generated. Do not edit!


(when (boundp 'robotnik_msgs::ElevatorStatus)
  (if (not (find-package "ROBOTNIK_MSGS"))
    (make-package "ROBOTNIK_MSGS"))
  (shadow 'ElevatorStatus (find-package "ROBOTNIK_MSGS")))
(unless (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS")
  (make-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))

(in-package "ROS")
;;//! \htmlinclude ElevatorStatus.msg.html


(intern "*RAISING*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*RAISING* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*RAISING* "raising")
(intern "*LOWERING*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*LOWERING* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*LOWERING* "lowering")
(intern "*IDLE*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*IDLE* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*IDLE* "idle")
(intern "*ERROR_G_IO*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*ERROR_G_IO* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*ERROR_G_IO* "error_getting_io")
(intern "*ERROR_S_IO*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*ERROR_S_IO* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*ERROR_S_IO* "error_setting_io")
(intern "*ERROR_TIMEOUT*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*ERROR_TIMEOUT* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*ERROR_TIMEOUT* "error_timeout_in_action")
(intern "*UP*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*UP* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*UP* "up")
(intern "*DOWN*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*DOWN* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*DOWN* "down")
(intern "*UNKNOWN*" (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(shadow '*UNKNOWN* (find-package "ROBOTNIK_MSGS::ELEVATORSTATUS"))
(defconstant robotnik_msgs::ElevatorStatus::*UNKNOWN* "unknown")
(defclass robotnik_msgs::ElevatorStatus
  :super ros::object
  :slots (_state _position ))

(defmethod robotnik_msgs::ElevatorStatus
  (:init
   (&key
    ((:state __state) "")
    ((:position __position) "")
    )
   (send-super :init)
   (setq _state (string __state))
   (setq _position (string __position))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ;; string _position
    4 (length _position)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;; string _position
       (write-long (length _position) s) (princ _position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _position
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _position (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robotnik_msgs::ElevatorStatus :md5sum-) "9becbfc724554c6c51b8c09125fe90d4")
(setf (get robotnik_msgs::ElevatorStatus :datatype-) "robotnik_msgs/ElevatorStatus")
(setf (get robotnik_msgs::ElevatorStatus :definition-)
      "# state
string RAISING=raising
string LOWERING=lowering
string IDLE=idle
string ERROR_G_IO=error_getting_io
string ERROR_S_IO=error_setting_io
string ERROR_TIMEOUT=error_timeout_in_action
# position
string UP=up
string DOWN=down
string UNKNOWN=unknown
# IDLE, RAISING, LOWERING
string state
# UP, DOWN, UNKNOWN
string position

")



(provide :robotnik_msgs/ElevatorStatus "9becbfc724554c6c51b8c09125fe90d4")


