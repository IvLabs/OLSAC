; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude location.msg.html

(cl:defclass <location> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type beginner_tutorials-msg:pose
    :initform (cl:make-instance 'beginner_tutorials-msg:pose)))
)

(cl:defclass location (<location>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <location>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'location)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<location> is deprecated: use beginner_tutorials-msg:location instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <location>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:data-val is deprecated.  Use beginner_tutorials-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <location>) ostream)
  "Serializes a message object of type '<location>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <location>) istream)
  "Deserializes a message object of type '<location>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<location>)))
  "Returns string type for a message object of type '<location>"
  "beginner_tutorials/location")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'location)))
  "Returns string type for a message object of type 'location"
  "beginner_tutorials/location")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<location>)))
  "Returns md5sum for a message object of type '<location>"
  "07f9b1d7d02ec65642cb58d50c4281bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'location)))
  "Returns md5sum for a message object of type 'location"
  "07f9b1d7d02ec65642cb58d50c4281bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<location>)))
  "Returns full string definition for message of type '<location>"
  (cl:format cl:nil "pose data~%~%================================================================================~%MSG: beginner_tutorials/pose~%float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'location)))
  "Returns full string definition for message of type 'location"
  (cl:format cl:nil "pose data~%~%================================================================================~%MSG: beginner_tutorials/pose~%float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <location>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <location>))
  "Converts a ROS message object to a list"
  (cl:list 'location
    (cl:cons ':data (data msg))
))
