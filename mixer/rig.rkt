#lang racket

; a simple RIG in Racket

(define (die sides)
  "rolls a die"
  (+ 1 (random sides)))

(define (good-or-evil #:morals morals)
  "an example function accepting keyword arguments"
  (print morals))

(define (rig)
  "the main function"
  (print "hi Rig"))