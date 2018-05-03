; Auto-generated. Do not edit!


(cl:in-package robotnik_msgs-msg)


;//! \htmlinclude BatteryStatus.msg.html

(cl:defclass <BatteryStatus> (roslisp-msg-protocol:ros-message)
  ((voltage
    :reader voltage
    :initarg :voltage
    :type cl:float
    :initform 0.0)
   (level
    :reader level
    :initarg :level
    :type cl:float
    :initform 0.0)
   (time_remaining
    :reader time_remaining
    :initarg :time_remaining
    :type cl:integer
    :initform 0))
)

(cl:defclass BatteryStatus (<BatteryStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotnik_msgs-msg:<BatteryStatus> is deprecated: use robotnik_msgs-msg:BatteryStatus instead.")))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <BatteryStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_msgs-msg:voltage-val is deprecated.  Use robotnik_msgs-msg:voltage instead.")
  (voltage m))

(cl:ensure-generic-function 'level-val :lambda-list '(m))
(cl:defmethod level-val ((m <BatteryStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_msgs-msg:level-val is deprecated.  Use robotnik_msgs-msg:level instead.")
  (level m))

(cl:ensure-generic-function 'time_remaining-val :lambda-list '(m))
(cl:defmethod time_remaining-val ((m <BatteryStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_msgs-msg:time_remaining-val is deprecated.  Use robotnik_msgs-msg:time_remaining instead.")
  (time_remaining m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryStatus>) ostream)
  "Serializes a message object of type '<BatteryStatus>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_remaining)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_remaining)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_remaining)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_remaining)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryStatus>) istream)
  "Deserializes a message object of type '<BatteryStatus>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'level) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_remaining)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_remaining)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_remaining)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_remaining)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryStatus>)))
  "Returns string type for a message object of type '<BatteryStatus>"
  "robotnik_msgs/BatteryStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryStatus)))
  "Returns string type for a message object of type 'BatteryStatus"
  "robotnik_msgs/BatteryStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryStatus>)))
  "Returns md5sum for a message object of type '<BatteryStatus>"
  "86d6d9c22e09e64d16ee579abc60e177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryStatus)))
  "Returns md5sum for a message object of type 'BatteryStatus"
  "86d6d9c22e09e64d16ee579abc60e177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryStatus>)))
  "Returns full string definition for message of type '<BatteryStatus>"
  (cl:format cl:nil "float32 voltage			# in volts~%float32 level			# in %~%uint32 time_remaining		# in minutes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryStatus)))
  "Returns full string definition for message of type 'BatteryStatus"
  (cl:format cl:nil "float32 voltage			# in volts~%float32 level			# in %~%uint32 time_remaining		# in minutes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryStatus>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryStatus
    (cl:cons ':voltage (voltage msg))
    (cl:cons ':level (level msg))
    (cl:cons ':time_remaining (time_remaining msg))
))
