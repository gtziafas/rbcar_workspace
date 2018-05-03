; Auto-generated. Do not edit!


(cl:in-package robotnik_msgs-msg)


;//! \htmlinclude RobotnikMotorsStatus.msg.html

(cl:defclass <RobotnikMotorsStatus> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (can_id
    :reader can_id
    :initarg :can_id
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (motor_status
    :reader motor_status
    :initarg :motor_status
    :type (cl:vector robotnik_msgs-msg:MotorStatus)
   :initform (cl:make-array 0 :element-type 'robotnik_msgs-msg:MotorStatus :initial-element (cl:make-instance 'robotnik_msgs-msg:MotorStatus))))
)

(cl:defclass RobotnikMotorsStatus (<RobotnikMotorsStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotnikMotorsStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotnikMotorsStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotnik_msgs-msg:<RobotnikMotorsStatus> is deprecated: use robotnik_msgs-msg:RobotnikMotorsStatus instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <RobotnikMotorsStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_msgs-msg:name-val is deprecated.  Use robotnik_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'can_id-val :lambda-list '(m))
(cl:defmethod can_id-val ((m <RobotnikMotorsStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_msgs-msg:can_id-val is deprecated.  Use robotnik_msgs-msg:can_id instead.")
  (can_id m))

(cl:ensure-generic-function 'motor_status-val :lambda-list '(m))
(cl:defmethod motor_status-val ((m <RobotnikMotorsStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_msgs-msg:motor_status-val is deprecated.  Use robotnik_msgs-msg:motor_status instead.")
  (motor_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotnikMotorsStatus>) ostream)
  "Serializes a message object of type '<RobotnikMotorsStatus>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'can_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'can_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motor_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motor_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotnikMotorsStatus>) istream)
  "Deserializes a message object of type '<RobotnikMotorsStatus>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'name) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'name)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'can_id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'can_id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motor_status) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motor_status)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robotnik_msgs-msg:MotorStatus))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotnikMotorsStatus>)))
  "Returns string type for a message object of type '<RobotnikMotorsStatus>"
  "robotnik_msgs/RobotnikMotorsStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotnikMotorsStatus)))
  "Returns string type for a message object of type 'RobotnikMotorsStatus"
  "robotnik_msgs/RobotnikMotorsStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotnikMotorsStatus>)))
  "Returns md5sum for a message object of type '<RobotnikMotorsStatus>"
  "5a73b28e567bd7a8d57f65ffc9524541")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotnikMotorsStatus)))
  "Returns md5sum for a message object of type 'RobotnikMotorsStatus"
  "5a73b28e567bd7a8d57f65ffc9524541")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotnikMotorsStatus>)))
  "Returns full string definition for message of type '<RobotnikMotorsStatus>"
  (cl:format cl:nil "# Name of each motor drive~%string[] name~%# CAN ID of each motor drive~%int32[] can_id~%# Status of the motor drive~%robotnik_msgs/MotorStatus[] motor_status~%~%~%================================================================================~%MSG: robotnik_msgs/MotorStatus~%string state~%string status~%string communicationstatus~%string statusword~%string driveflags~%string[] activestatusword~%string[] activedriveflags~%int32 digitaloutputs~%int32 digitalinputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotnikMotorsStatus)))
  "Returns full string definition for message of type 'RobotnikMotorsStatus"
  (cl:format cl:nil "# Name of each motor drive~%string[] name~%# CAN ID of each motor drive~%int32[] can_id~%# Status of the motor drive~%robotnik_msgs/MotorStatus[] motor_status~%~%~%================================================================================~%MSG: robotnik_msgs/MotorStatus~%string state~%string status~%string communicationstatus~%string statusword~%string driveflags~%string[] activestatusword~%string[] activedriveflags~%int32 digitaloutputs~%int32 digitalinputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotnikMotorsStatus>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'name) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'can_id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_status) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotnikMotorsStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotnikMotorsStatus
    (cl:cons ':name (name msg))
    (cl:cons ':can_id (can_id msg))
    (cl:cons ':motor_status (motor_status msg))
))
