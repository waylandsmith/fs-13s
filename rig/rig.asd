;;;; 2013-02-05 16:02:09

(requires :asdf)
(defpackage #:rig-asd
  (:use :cl :asdf))

(in-package :rig-asd)

(defsystem rig
  :name "rig"
  :version "0.1"
  :components ((:file "defpackage")
               (:file "main" :depends-on ("defpackage"))
               (:file "careers")
               (:file "foo"))
  :depends-on ())
