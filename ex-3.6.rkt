#lang racket

(define (rand-update x)
  (let ((a 26) (b 27) (m 127))
    (modulo (+ (* a x) b) m)))

(define random-init 0)

(define rand
  (let ((x random-init))
    (lambda (message)
      (cond ((eq? message 'reset)
             (lambda (new-init) (set! x new-init)))
            ((eq? message 'generate)
             (begin (set! x (rand-update x)) x))))))

;Test
(rand 'generate)
(rand 'generate)
(rand 'generate)

((rand 'reset) random-init)
(rand 'generate)
(rand 'generate)
(rand 'generate)

((rand 'reset) 1)
(rand 'generate)
(rand 'generate)
(rand 'generate)

((rand 'reset) 1)
(rand 'generate)
(rand 'generate)
(rand 'generate)

