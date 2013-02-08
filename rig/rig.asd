;;;; 2013-02-05 16:02:09

(defpackage #:rig-asd
  (:use :cl :asdf))

(in-package :rig-asd)

(defsystem rig
  :name "rig"
  :version "0.1"
  :components ((:file "defpackage")
               (:file "main" :depends-on ("defpackage")))
  :depends-on ())
