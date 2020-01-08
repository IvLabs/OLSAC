;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::wp)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'wp (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::WP")
  (make-package "BEGINNER_TUTORIALS::WP"))

(in-package "ROS")
;;//! \htmlinclude wp.msg.html


(defclass beginner_tutorials::wp
  :super ros::object
  :slots (_way_pt ))

(defmethod beginner_tutorials::wp
  (:init
   (&key
    ((:way_pt __way_pt) (let (r) (dotimes (i 0) (push (instance beginner_tutorials::pose :init) r)) r))
    )
   (send-super :init)
   (setq _way_pt __way_pt)
   self)
  (:way_pt
   (&rest __way_pt)
   (if (keywordp (car __way_pt))
       (send* _way_pt __way_pt)
     (progn
       (if __way_pt (setq _way_pt (car __way_pt)))
       _way_pt)))
  (:serialization-length
   ()
   (+
    ;; beginner_tutorials/pose[] _way_pt
    (apply #'+ (send-all _way_pt :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/pose[] _way_pt
     (write-long (length _way_pt) s)
     (dolist (elem _way_pt)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/pose[] _way_pt
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _way_pt (let (r) (dotimes (i n) (push (instance beginner_tutorials::pose :init) r)) r))
     (dolist (elem- _way_pt)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get beginner_tutorials::wp :md5sum-) "0607f801753c707bef4c2c689caa3fea")
(setf (get beginner_tutorials::wp :datatype-) "beginner_tutorials/wp")
(setf (get beginner_tutorials::wp :definition-)
      "pose[] way_pt

================================================================================
MSG: beginner_tutorials/pose
float32 x
float32 y
float32 theta

")



(provide :beginner_tutorials/wp "0607f801753c707bef4c2c689caa3fea")


