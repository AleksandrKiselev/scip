#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Недостаточно денег на счете"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((not (eq? p password)) (error "Неверный пароль"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT" m))))
  dispatch)

;test
(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 45)

((acc 'secret-password 'deposit) 100)

((acc 'wrong-password 'withdraw) 60)

 