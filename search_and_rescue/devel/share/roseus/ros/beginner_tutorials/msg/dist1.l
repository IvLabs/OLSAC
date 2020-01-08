;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::dist1)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'dist1 (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::DIST1")
  (make-package "BEGINNER_TUTORIALS::DIST1"))

(in-package "ROS")
;;//! \htmlinclude dist1.msg.html


(defclass beginner_tutorials::dist1
  :super ros::object
  :slots (_distance _dir ))

(defmethod beginner_tutorials::dist1
  (:init
   (&key
    ((:distance __distance) 0.0)
    ((:dir __dir) 0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   (setq _dir (round __dir))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:dir
   (&optional __dir)
   (if __dir (setq _dir __dir)) _dir)
  (:serialization-length
   ()
   (+
    ;; float32 _distance
    4
    ;; int32 _dir
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _dir
       (write-long _dir s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _dir
     (setq _dir (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get beginner_tutorials::dist1 :md5sum-) "3dac152354d5fd858b508316101f37c9")
(setf (get beginner_tutorials::dist1 :datatype-) "beginner_tutorials/dist1")
(setf (get beginner_tutorials::dist1 :definition-)
      "float32 distance
int32 dir

")



(provide :beginner_tutorials/dist1 "3dac152354d5fd858b508316101f37c9")


