;; Auto-generated. Do not edit!


(when (boundp 'robotnik_msgs::MotorStatus)
  (if (not (find-package "ROBOTNIK_MSGS"))
    (make-package "ROBOTNIK_MSGS"))
  (shadow 'MotorStatus (find-package "ROBOTNIK_MSGS")))
(unless (find-package "ROBOTNIK_MSGS::MOTORSTATUS")
  (make-package "ROBOTNIK_MSGS::MOTORSTATUS"))

(in-package "ROS")
;;//! \htmlinclude MotorStatus.msg.html


(defclass robotnik_msgs::MotorStatus
  :super ros::object
  :slots (_state _status _communicationstatus _statusword _driveflags _activestatusword _activedriveflags _digitaloutputs _digitalinputs ))

(defmethod robotnik_msgs::MotorStatus
  (:init
   (&key
    ((:state __state) "")
    ((:status __status) "")
    ((:communicationstatus __communicationstatus) "")
    ((:statusword __statusword) "")
    ((:driveflags __driveflags) "")
    ((:activestatusword __activestatusword) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:activedriveflags __activedriveflags) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:digitaloutputs __digitaloutputs) 0)
    ((:digitalinputs __digitalinputs) 0)
    )
   (send-super :init)
   (setq _state (string __state))
   (setq _status (string __status))
   (setq _communicationstatus (string __communicationstatus))
   (setq _statusword (string __statusword))
   (setq _driveflags (string __driveflags))
   (setq _activestatusword __activestatusword)
   (setq _activedriveflags __activedriveflags)
   (setq _digitaloutputs (round __digitaloutputs))
   (setq _digitalinputs (round __digitalinputs))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:communicationstatus
   (&optional __communicationstatus)
   (if __communicationstatus (setq _communicationstatus __communicationstatus)) _communicationstatus)
  (:statusword
   (&optional __statusword)
   (if __statusword (setq _statusword __statusword)) _statusword)
  (:driveflags
   (&optional __driveflags)
   (if __driveflags (setq _driveflags __driveflags)) _driveflags)
  (:activestatusword
   (&optional __activestatusword)
   (if __activestatusword (setq _activestatusword __activestatusword)) _activestatusword)
  (:activedriveflags
   (&optional __activedriveflags)
   (if __activedriveflags (setq _activedriveflags __activedriveflags)) _activedriveflags)
  (:digitaloutputs
   (&optional __digitaloutputs)
   (if __digitaloutputs (setq _digitaloutputs __digitaloutputs)) _digitaloutputs)
  (:digitalinputs
   (&optional __digitalinputs)
   (if __digitalinputs (setq _digitalinputs __digitalinputs)) _digitalinputs)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ;; string _status
    4 (length _status)
    ;; string _communicationstatus
    4 (length _communicationstatus)
    ;; string _statusword
    4 (length _statusword)
    ;; string _driveflags
    4 (length _driveflags)
    ;; string[] _activestatusword
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _activestatusword)) 4
    ;; string[] _activedriveflags
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _activedriveflags)) 4
    ;; int32 _digitaloutputs
    4
    ;; int32 _digitalinputs
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;; string _communicationstatus
       (write-long (length _communicationstatus) s) (princ _communicationstatus s)
     ;; string _statusword
       (write-long (length _statusword) s) (princ _statusword s)
     ;; string _driveflags
       (write-long (length _driveflags) s) (princ _driveflags s)
     ;; string[] _activestatusword
     (write-long (length _activestatusword) s)
     (dolist (elem _activestatusword)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _activedriveflags
     (write-long (length _activedriveflags) s)
     (dolist (elem _activedriveflags)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int32 _digitaloutputs
       (write-long _digitaloutputs s)
     ;; int32 _digitalinputs
       (write-long _digitalinputs s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _communicationstatus
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _communicationstatus (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _statusword
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _statusword (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _driveflags
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _driveflags (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _activestatusword
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _activestatusword (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _activestatusword i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _activedriveflags
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _activedriveflags (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _activedriveflags i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int32 _digitaloutputs
     (setq _digitaloutputs (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _digitalinputs
     (setq _digitalinputs (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robotnik_msgs::MotorStatus :md5sum-) "042f5a8e9eaebc599a6782b2ff4252e5")
(setf (get robotnik_msgs::MotorStatus :datatype-) "robotnik_msgs/MotorStatus")
(setf (get robotnik_msgs::MotorStatus :definition-)
      "string state
string status
string communicationstatus
string statusword
string driveflags
string[] activestatusword
string[] activedriveflags
int32 digitaloutputs
int32 digitalinputs

")



(provide :robotnik_msgs/MotorStatus "042f5a8e9eaebc599a6782b2ff4252e5")


