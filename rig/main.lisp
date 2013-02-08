;;;; 2013-02-05 16:02:09
;;;; Behold, the power of lisp.

;(in-package :rig)

; my first stab at making my own Lisp engine

; (defparameter *al-table* 0) ; have a table for alignment

;(defparameter *al* '((Order (Lawful Neutral Chaotic))
;                     (Morals (Good Neutral Evil)))) ; I feel like there's a better data structure for this.
; maybe an array?  I'd prefer an array.

(defparameter al (make-array 9 ; this is a vector - the nine is a number of elements in a dimension, but I can add multiple values in a list for a multidimensional array
                             :initial-contents
                             '((Lawful_Evil)
                               (Lawful_Neutral)
                               (Lawful_Good)
                               (Neutral_Evil)
                               (True_Neutral)
                               (Neutral_Good)
                               (Chaotic_Evil)
                               (Chaotic_Neutral)
                               (Chaotic_Good)))) ; weird.  You can't just declare an array - you make one with a function

(defparameter *cls* (make-hash-table))

(defun pick-al () ; this should eventually take an optional argument
  (aref al (random 9)))


(defun die (sides) ; roll a die!
  (+ 1 (random sides)))

