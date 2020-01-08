;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::info)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'info (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::INFO")
  (make-package "BEGINNER_TUTORIALS::INFO"))

(in-package "ROS")
;;//! \htmlinclude info.msg.html


(defclass beginner_tutorials::info
  :super ros::object
  :slots (_array ))

(defmethod beginner_tutorials::info
  (:init
   (&key
    ((:array __array) (instance beginner_tutorials::single :init))
    )
   (send-super :init)
   (setq _array __array)
   self)
  (:array
   (&rest __array)
   (if (keywordp (car __array))
       (send* _array __array)
     (progn
       (if __array (setq _array (car __array)))
       _array)))
  (:serialization-length
   ()
   (+
    ;; beginner_tutorials/single _array
    (send _array :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/single _array
       (send _array :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/single _array
     (send _array :deserialize buf ptr-) (incf ptr- (send _array :serialization-length))
   ;;
   self)
  )

(setf (get beginner_tutorials::info :md5sum-) "e2b1c54aa4c02c97f9c6f17593bc5f83")
(setf (get beginner_tutorials::info :datatype-) "beginner_tutorials/info")
(setf (get beginner_tutorials::info :definition-)
      "

single array

================================================================================
MSG: beginner_tutorials/single
float32[] height
int32[] align
float32[] area

")



(provide :beginner_tutorials/info "e2b1c54aa4c02c97f9c6f17593bc5f83")


