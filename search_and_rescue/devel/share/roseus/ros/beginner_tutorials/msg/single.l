;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::single)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'single (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::SINGLE")
  (make-package "BEGINNER_TUTORIALS::SINGLE"))

(in-package "ROS")
;;//! \htmlinclude single.msg.html


(defclass beginner_tutorials::single
  :super ros::object
  :slots (_height _align _area ))

(defmethod beginner_tutorials::single
  (:init
   (&key
    ((:height __height) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:align __align) (make-array 0 :initial-element 0 :element-type :integer))
    ((:area __area) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _height __height)
   (setq _align __align)
   (setq _area __area)
   self)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:align
   (&optional __align)
   (if __align (setq _align __align)) _align)
  (:area
   (&optional __area)
   (if __area (setq _area __area)) _area)
  (:serialization-length
   ()
   (+
    ;; float32[] _height
    (* 4    (length _height)) 4
    ;; int32[] _align
    (* 4    (length _align)) 4
    ;; float32[] _area
    (* 4    (length _area)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _height
     (write-long (length _height) s)
     (dotimes (i (length _height))
       (sys::poke (elt _height i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _align
     (write-long (length _align) s)
     (dotimes (i (length _align))
       (write-long (elt _align i) s)
       )
     ;; float32[] _area
     (write-long (length _area) s)
     (dotimes (i (length _area))
       (sys::poke (elt _area i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _height
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _height (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _height i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _align
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _align (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _align i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _area
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _area (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _area i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get beginner_tutorials::single :md5sum-) "f1b42f61dd256ab5fb256ea59e23417b")
(setf (get beginner_tutorials::single :datatype-) "beginner_tutorials/single")
(setf (get beginner_tutorials::single :definition-)
      "float32[] height
int32[] align
float32[] area

")



(provide :beginner_tutorials/single "f1b42f61dd256ab5fb256ea59e23417b")


