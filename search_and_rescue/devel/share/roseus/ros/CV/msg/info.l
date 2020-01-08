;; Auto-generated. Do not edit!


(when (boundp 'CV::info)
  (if (not (find-package "CV"))
    (make-package "CV"))
  (shadow 'info (find-package "CV")))
(unless (find-package "CV::INFO")
  (make-package "CV::INFO"))

(in-package "ROS")
;;//! \htmlinclude info.msg.html


(defclass CV::info
  :super ros::object
  :slots (_array ))

(defmethod CV::info
  (:init
   (&key
    ((:array __array) (instance CV::single :init))
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
    ;; CV/single _array
    (send _array :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; CV/single _array
       (send _array :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; CV/single _array
     (send _array :deserialize buf ptr-) (incf ptr- (send _array :serialization-length))
   ;;
   self)
  )

(setf (get CV::info :md5sum-) "e2b1c54aa4c02c97f9c6f17593bc5f83")
(setf (get CV::info :datatype-) "CV/info")
(setf (get CV::info :definition-)
      "single array

================================================================================
MSG: CV/single
float32[] height
int32[] align
float32[] area

")



(provide :CV/info "e2b1c54aa4c02c97f9c6f17593bc5f83")


