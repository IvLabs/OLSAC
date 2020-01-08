;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::dist2)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'dist2 (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::DIST2")
  (make-package "BEGINNER_TUTORIALS::DIST2"))

(in-package "ROS")
;;//! \htmlinclude dist2.msg.html


(defclass beginner_tutorials::dist2
  :super ros::object
  :slots (_data ))

(defmethod beginner_tutorials::dist2
  (:init
   (&key
    ((:data __data) (instance beginner_tutorials::dist1 :init))
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
    ;; beginner_tutorials/dist1 _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/dist1 _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/dist1 _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get beginner_tutorials::dist2 :md5sum-) "5b473841e30c98b858bbebd2aca970b8")
(setf (get beginner_tutorials::dist2 :datatype-) "beginner_tutorials/dist2")
(setf (get beginner_tutorials::dist2 :definition-)
      "dist1 data

================================================================================
MSG: beginner_tutorials/dist1
float32 distance
int32 dir

")



(provide :beginner_tutorials/dist2 "5b473841e30c98b858bbebd2aca970b8")


