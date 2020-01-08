; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude wp.msg.html

(cl:defclass <wp> (roslisp-msg-protocol:ros-message)
  ((way_pt
    :reader way_pt
    :initarg :way_pt
    :type (cl:vector beginner_tutorials-msg:pose)
   :initform (cl:make-array 0 :element-type 'beginner_tutorials-msg:pose :initial-element (cl:make-instance 'beginner_tutorials-msg:pose))))
)

(cl:defclass wp (<wp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<wp> is deprecated: use beginner_tutorials-msg:wp instead.")))

(cl:ensure-generic-function 'way_pt-val :lambda-list '(m))
(cl:defmethod way_pt-val ((m <wp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:way_pt-val is deprecated.  Use beginner_tutorials-msg:way_pt instead.")
  (way_pt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wp>) ostream)
  "Serializes a message object of type '<wp>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'way_pt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'way_pt))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wp>) istream)
  "Deserializes a message object of type '<wp>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'way_pt) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'way_pt)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'beginner_tutorials-msg:pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wp>)))
  "Returns string type for a message object of type '<wp>"
  "beginner_tutorials/wp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wp)))
  "Returns string type for a message object of type 'wp"
  "beginner_tutorials/wp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wp>)))
  "Returns md5sum for a message object of type '<wp>"
  "0607f801753c707bef4c2c689caa3fea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wp)))
  "Returns md5sum for a message object of type 'wp"
  "0607f801753c707bef4c2c689caa3fea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wp>)))
  "Returns full string definition for message of type '<wp>"
  (cl:format cl:nil "pose[] way_pt~%~%================================================================================~%MSG: beginner_tutorials/pose~%float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wp)))
  "Returns full string definition for message of type 'wp"
  (cl:format cl:nil "pose[] way_pt~%~%================================================================================~%MSG: beginner_tutorials/pose~%float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wp>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'way_pt) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wp>))
  "Converts a ROS message object to a list"
  (cl:list 'wp
    (cl:cons ':way_pt (way_pt msg))
))
