#lang racket

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random) range))))

(define (estimate-integral p x1 y1 x2 y2 trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (p x y)))
  (define rect-square
    (* (- x2 x1) (- y2 y1)))
  (* rect-square (monte-carlo trials experiment)))

; Тест
(define (estimate-pi trials)
  (define (in-circle x y)
    (<= (+ (* x x) (* y y)) 1))
  (estimate-integral in-circle -1.0 -1.0 1.0 1.0 trials))

(estimate-pi 100000.0)
  


  



