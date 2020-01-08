; Auto-generated. Do not edit!


(cl:in-package CV-msg)


;//! \htmlinclude single.msg.html

(cl:defclass <single> (roslisp-msg-protocol:ros-message)
  ((height
    :reader height
    :initarg :height
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (align
    :reader align
    :initarg :align
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (area
    :reader area
    :initarg :area
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass single (<single>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <single>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'single)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name CV-msg:<single> is deprecated: use CV-msg:single instead.")))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <single>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader CV-msg:height-val is deprecated.  Use CV-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'align-val :lambda-list '(m))
(cl:defmethod align-val ((m <single>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader CV-msg:align-val is deprecated.  Use CV-msg:align instead.")
  (align m))

(cl:ensure-generic-function 'area-val :lambda-list '(m))
(cl:defmethod area-val ((m <single>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader CV-msg:area-val is deprecated.  Use CV-msg:area instead.")
  (area m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <single>) ostream)
  "Serializes a message object of type '<single>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'height))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'align))))
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
   (cl:slot-value msg 'align))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'area))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <single>) istream)
  "Deserializes a message object of type '<single>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'height) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'height)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'align) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'align)))
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
  (cl:setf (cl:slot-value msg 'area) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'area)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<single>)))
  "Returns string type for a message object of type '<single>"
  "CV/single")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'single)))
  "Returns string type for a message object of type 'single"
  "CV/single")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<single>)))
  "Returns md5sum for a message object of type '<single>"
  "f1b42f61dd256ab5fb256ea59e23417b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'single)))
  "Returns md5sum for a message object of type 'single"
  "f1b42f61dd256ab5fb256ea59e23417b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<single>)))
  "Returns full string definition for message of type '<single>"
  (cl:format cl:nil "float32[] height~%int32[] align~%float32[] area~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'single)))
  "Returns full string definition for message of type 'single"
  (cl:format cl:nil "float32[] height~%int32[] align~%float32[] area~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <single>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'height) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'align) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'area) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <single>))
  "Converts a ROS message object to a list"
  (cl:list 'single
    (cl:cons ':height (height msg))
    (cl:cons ':align (align msg))
    (cl:cons ':area (area msg))
))
