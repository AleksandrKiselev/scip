#lang racket

(define (make-accumulator init-val)
  (lambda (val)
    (begin
      (set! init-val (+ init-val val))
      init-val)))

;test
(define A1 (make-accumulator 5))
(define A2 (make-accumulator 10))

(A1 10)
(A1 10)

(A2 3)
(A2 3)