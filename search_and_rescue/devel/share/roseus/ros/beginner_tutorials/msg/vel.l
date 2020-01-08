;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::vel)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'vel (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::VEL")
  (make-package "BEGINNER_TUTORIALS::VEL"))

(in-package "ROS")
;;//! \htmlinclude vel.msg.html


(defclass beginner_tutorials::vel
  :super ros::object
  :slots (_ref_left _ref_right ))

(defmethod beginner_tutorials::vel
  (:init
   (&key
    ((:ref_left __ref_left) 0)
    ((:ref_right __ref_right) 0)
    )
   (send-super :init)
   (setq _ref_left (round __ref_left))
   (setq _ref_right (round __ref_right))
   self)
  (:ref_left
   (&optional __ref_left)
   (if __ref_left (setq _ref_left __ref_left)) _ref_left)
  (:ref_right
   (&optional __ref_right)
   (if __ref_right (setq _ref_right __ref_right)) _ref_right)
  (:serialization-length
   ()
   (+
    ;; int32 _ref_left
    4
    ;; int32 _ref_right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _ref_left
       (write-long _ref_left s)
     ;; int32 _ref_right
       (write-long _ref_right s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _ref_left
     (setq _ref_left (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ref_right
     (setq _ref_right (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get beginner_tutorials::vel :md5sum-) "3607ebf3a337eebee6a6822feb14efcc")
(setf (get beginner_tutorials::vel :datatype-) "beginner_tutorials/vel")
(setf (get beginner_tutorials::vel :definition-)
      "int32 ref_left
int32 ref_right 

")



(provide :beginner_tutorials/vel "3607ebf3a337eebee6a6822feb14efcc")


