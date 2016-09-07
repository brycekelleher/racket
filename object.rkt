#lang racket
(require test-engine/racket-tests)

(define (make-obj)
  (lambda (x)
    (define (print-msg1) (display "this is msg1"))
    (define (print-msg2) (display "this is msg2"))
    (cond [(eq? x 'msg1) (print-msg1)]
          [(eq? x 'msg2) (print-msg2)]
          [else (error "unknown message")])))

(check-expect (+ 1 1) 3)

(test)