;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname digital) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Wire
(define (make-wire)
  (local [(define value                0)
          (define action-proc-list empty)
          
          (define (call-actions list)
            (map (lambda (x) (x))
                 action-proc-list))
          
          (define (set-signal-proc! v)
            (if (not (= value v))
                (begin (set! value v)
                       (call-actions action-proc-list))
                'ok))
          
          (define (add-action-proc! a)
            (begin (set! action-proc-list (cons a action-proc-list))
                   'ok))]
    
    (lambda (m)
      (cond [(eq? m 'get-value) value]
            [(eq? m 'set-value) set-signal-proc!]
            [(eq? m 'add-action) add-action-proc!]
            [else (error "wire: invalid operation")]))))

(define (get-value w)
  (w 'get-value))
(define (set-value! w v)
  ((w 'set-value) v))
(define (add-action! w a)
  ((w 'add-action) a))

(define w (make-wire))
(check-expect (get-value  w)      0)
(check-expect (set-value! w 10) 'ok)
(check-expect (get-value  w)     10)

;; Wire probes
(define (probe name wire)
  (add-action! wire
               (lambda ()
                 (begin (display name)
                        (display " ")
                        (display (get-value wire))
                        (newline)))))

(define (not-gate a x)
  (local
    [(define (logical-not a)
       (cond [(= a 0) 1]
             [(= a 1) 0]
             [else (error "logical-not: invalid signal")]))
     (define (inverter-logic)
       (local [(define new-value (logical-not (a 'get-value)))]
         ((x 'set-value) new-value)))]
    (begin
      ((a 'add-action) inverter-logic)
      'ok)))

(define wirea (make-wire))
(define wirex (make-wire))
(probe 'wirea wirea)
(probe 'wirex wirex)
(define not-test (not-gate wirea wirex))
((wirea 'set-value) 1)
((wirea 'set-value) 0)





