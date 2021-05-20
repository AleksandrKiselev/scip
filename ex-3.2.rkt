#lang racket

(define (make-monitored f)
  (define count 0)
  (define (get-count) count)
  (define (reset-count)
    (set! count 0))
  (lambda (param)
    (cond ((eq? param 'how-many-calls?)
           (get-count))
          ((eq? param 'reset-count)
           (reset-count))
          (else
           (begin (set! count (+ count 1))
                  (f param))))))

;test
(define (f x) (* x x))

(define mf (make-monitored f))

(mf 2)
(mf 3)
(mf 4)

(mf 'how-many-calls?)
(mf 'reset-count)
(mf 'how-many-calls?)