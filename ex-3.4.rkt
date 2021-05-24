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
  (define wrong-pass-count 7)
  (define (wrong-pass amount)
    (set! wrong-pass-count (- wrong-pass-count 1))
    "Неверный пароль")
  (define (call-the-cops amount)
    "Вызвать копов!")
  (define (dispatch p m)
    (cond ((not (eq? p password))
           (if (> wrong-pass-count 0)
               wrong-pass
               call-the-cops))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT" m))))
  dispatch)

;test
(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 45)

((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)
((acc 'wrong-password 'withdraw) 60)

 