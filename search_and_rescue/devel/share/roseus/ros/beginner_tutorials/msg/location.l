;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::location)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'location (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::LOCATION")
  (make-package "BEGINNER_TUTORIALS::LOCATION"))

(in-package "ROS")
;;//! \htmlinclude location.msg.html


(defclass beginner_tutorials::location
  :super ros::object
  :slots (_data ))

(defmethod beginner_tutorials::location
  (:init
   (&key
    ((:data __data) (instance beginner_tutorials::pose :init))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; beginner_tutorials/pose _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/pose _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/pose _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get beginner_tutorials::location :md5sum-) "07f9b1d7d02ec65642cb58d50c4281bf")
(setf (get beginner_tutorials::location :datatype-) "beginner_tutorials/location")
(setf (get beginner_tutorials::location :definition-)
      "pose data

================================================================================
MSG: beginner_tutorials/pose
float32 x
float32 y
float32 theta

")



(provide :beginner_tutorials/location "07f9b1d7d02ec65642cb58d50c4281bf")


