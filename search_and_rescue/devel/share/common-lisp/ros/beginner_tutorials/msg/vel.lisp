; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude vel.msg.html

(cl:defclass <vel> (roslisp-msg-protocol:ros-message)
  ((ref_left
    :reader ref_left
    :initarg :ref_left
    :type cl:integer
    :initform 0)
   (ref_right
    :reader ref_right
    :initarg :ref_right
    :type cl:integer
    :initform 0))
)

(cl:defclass vel (<vel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<vel> is deprecated: use beginner_tutorials-msg:vel instead.")))

(cl:ensure-generic-function 'ref_left-val :lambda-list '(m))
(cl:defmethod ref_left-val ((m <vel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:ref_left-val is deprecated.  Use beginner_tutorials-msg:ref_left instead.")
  (ref_left m))

(cl:ensure-generic-function 'ref_right-val :lambda-list '(m))
(cl:defmethod ref_right-val ((m <vel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:ref_right-val is deprecated.  Use beginner_tutorials-msg:ref_right instead.")
  (ref_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vel>) ostream)
  "Serializes a message object of type '<vel>"
  (cl:let* ((signed (cl:slot-value msg 'ref_left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ref_right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vel>) istream)
  "Deserializes a message object of type '<vel>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ref_left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ref_right) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vel>)))
  "Returns string type for a message object of type '<vel>"
  "beginner_tutorials/vel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vel)))
  "Returns string type for a message object of type 'vel"
  "beginner_tutorials/vel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vel>)))
  "Returns md5sum for a message object of type '<vel>"
  "3607ebf3a337eebee6a6822feb14efcc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vel)))
  "Returns md5sum for a message object of type 'vel"
  "3607ebf3a337eebee6a6822feb14efcc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vel>)))
  "Returns full string definition for message of type '<vel>"
  (cl:format cl:nil "int32 ref_left~%int32 ref_right ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vel)))
  "Returns full string definition for message of type 'vel"
  (cl:format cl:nil "int32 ref_left~%int32 ref_right ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vel>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vel>))
  "Converts a ROS message object to a list"
  (cl:list 'vel
    (cl:cons ':ref_left (ref_left msg))
    (cl:cons ':ref_right (ref_right msg))
))
