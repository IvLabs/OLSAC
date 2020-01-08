; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude dist1.msg.html

(cl:defclass <dist1> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (dir
    :reader dir
    :initarg :dir
    :type cl:integer
    :initform 0))
)

(cl:defclass dist1 (<dist1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dist1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dist1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<dist1> is deprecated: use beginner_tutorials-msg:dist1 instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <dist1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:distance-val is deprecated.  Use beginner_tutorials-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'dir-val :lambda-list '(m))
(cl:defmethod dir-val ((m <dist1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:dir-val is deprecated.  Use beginner_tutorials-msg:dir instead.")
  (dir m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dist1>) ostream)
  "Serializes a message object of type '<dist1>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'dir)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dist1>) istream)
  "Deserializes a message object of type '<dist1>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dir) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dist1>)))
  "Returns string type for a message object of type '<dist1>"
  "beginner_tutorials/dist1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dist1)))
  "Returns string type for a message object of type 'dist1"
  "beginner_tutorials/dist1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dist1>)))
  "Returns md5sum for a message object of type '<dist1>"
  "3dac152354d5fd858b508316101f37c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dist1)))
  "Returns md5sum for a message object of type 'dist1"
  "3dac152354d5fd858b508316101f37c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dist1>)))
  "Returns full string definition for message of type '<dist1>"
  (cl:format cl:nil "float32 distance~%int32 dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dist1)))
  "Returns full string definition for message of type 'dist1"
  (cl:format cl:nil "float32 distance~%int32 dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dist1>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dist1>))
  "Converts a ROS message object to a list"
  (cl:list 'dist1
    (cl:cons ':distance (distance msg))
    (cl:cons ':dir (dir msg))
))
