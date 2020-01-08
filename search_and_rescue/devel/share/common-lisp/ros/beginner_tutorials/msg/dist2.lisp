; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude dist2.msg.html

(cl:defclass <dist2> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type beginner_tutorials-msg:dist1
    :initform (cl:make-instance 'beginner_tutorials-msg:dist1)))
)

(cl:defclass dist2 (<dist2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dist2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dist2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<dist2> is deprecated: use beginner_tutorials-msg:dist2 instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <dist2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:data-val is deprecated.  Use beginner_tutorials-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dist2>) ostream)
  "Serializes a message object of type '<dist2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dist2>) istream)
  "Deserializes a message object of type '<dist2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dist2>)))
  "Returns string type for a message object of type '<dist2>"
  "beginner_tutorials/dist2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dist2)))
  "Returns string type for a message object of type 'dist2"
  "beginner_tutorials/dist2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dist2>)))
  "Returns md5sum for a message object of type '<dist2>"
  "5b473841e30c98b858bbebd2aca970b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dist2)))
  "Returns md5sum for a message object of type 'dist2"
  "5b473841e30c98b858bbebd2aca970b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dist2>)))
  "Returns full string definition for message of type '<dist2>"
  (cl:format cl:nil "dist1 data~%~%================================================================================~%MSG: beginner_tutorials/dist1~%float32 distance~%int32 dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dist2)))
  "Returns full string definition for message of type 'dist2"
  (cl:format cl:nil "dist1 data~%~%================================================================================~%MSG: beginner_tutorials/dist1~%float32 distance~%int32 dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dist2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dist2>))
  "Converts a ROS message object to a list"
  (cl:list 'dist2
    (cl:cons ':data (data msg))
))
