#lang racket

(require racket/gui)
(require racket/draw)
(require ascii-canvas)

;; create the frame
(define frame
  (new frame%
       [label "Racket Roguelike"]
       [style '(no-resize-border)]
       [width 640]
       [height 480]))

(send frame show #t)

(define msg (new message%
                 [parent frame]
                 [label "No events so far..."]))

;; fixme: might be nicer with a hash table?
(define my-canvas%
  (class canvas%

    (define null-handler (lambda (ev) (void)))
    (define on-char-handler  null-handler)
    (define on-event-handler null-handler)
    
    (define/public (set-on-char-handler  fn) (set! on-char-handler  fn))
    (define/public (set-on-event-handler fn) (set! on-event-handler fn))
    
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)  (on-char-handler event))
    (define/override (on-event event) (on-event-handler event))
    
    (super-new)))

(define (test-on-char-handler ke)
  (send msg set-label "Canvas keyboard"))
(define (test-on-event-handler ev)
  (send msg set-label "Canvas mouse"))

; Make a canvas that handles events in the frame
(define my-canvas (new my-canvas% [parent frame]))
(send my-canvas set-on-char-handler  test-on-char-handler)
(send my-canvas set-on-event-handler test-on-event-handler)



