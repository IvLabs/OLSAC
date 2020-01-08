;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::command)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'command (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::COMMAND")
  (make-package "BEGINNER_TUTORIALS::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude command.msg.html


(defclass beginner_tutorials::command
  :super ros::object
  :slots (_data ))

(defmethod beginner_tutorials::command
  (:init
   (&key
    ((:data __data) (instance beginner_tutorials::vel :init))
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
    ;; beginner_tutorials/vel _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; beginner_tutorials/vel _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; beginner_tutorials/vel _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get beginner_tutorials::command :md5sum-) "b7a7abf7bc63cf7839ab418526056ac3")
(setf (get beginner_tutorials::command :datatype-) "beginner_tutorials/command")
(setf (get beginner_tutorials::command :definition-)
      "vel data

================================================================================
MSG: beginner_tutorials/vel
int32 ref_left
int32 ref_right 

")



(provide :beginner_tutorials/command "b7a7abf7bc63cf7839ab418526056ac3")


