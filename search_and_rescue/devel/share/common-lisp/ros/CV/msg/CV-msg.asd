
(cl:in-package :asdf)

(defsystem "CV-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Array" :depends-on ("_package_Array"))
    (:file "_package_Array" :depends-on ("_package"))
    (:file "info" :depends-on ("_package_info"))
    (:file "_package_info" :depends-on ("_package"))
    (:file "single" :depends-on ("_package_single"))
    (:file "_package_single" :depends-on ("_package"))
  ))