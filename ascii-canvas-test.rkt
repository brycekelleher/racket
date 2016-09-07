#lang racket

(require racket/gui)
(require racket/draw)
(require ascii-canvas)

(define gui%
  (class object%
    (init-field w-in-chars
                h-in-chars)
    
    ;; create the frame
    (define frame
      (new frame%
           [label "Racket Roguelike"]
           [style '(no-resize-border)]))
    
    ;; create the canvas
    (define canvas
      (new ascii-canvas%
           [parent frame]
           [width-in-characters w-in-chars]
           [height-in-characters h-in-chars]))
    
    ;; test function 1
    (define/public (ascii-canvas-test-1)
      (for* ([xi (in-range 16)]
             [yi (in-range 16)])
        (define c (integer->char (+ xi (* yi 16))))
        (send canvas write c xi yi)))
    
    ;; test function 2
    (define/public (ascii-canvas-test-2)
      (for* ([xi (in-range 16)]
             [yi (in-range 16)])
        (define c (integer->char (+ xi (* yi 16))))
        (send canvas write c (+ xi 24) yi (make-color (random 256)
                                                      (random 256)
                                                      (random 256)))))
    
    ;; test function 3
    (define/public (ascii-canvas-test-3)
      (define (write-random)
      (send canvas write
            (integer->char (random 256))
            (random 40) (random 20)
            (make-color (random 256) (random 256) (random 256))
            (make-color (random 256) (random 256) (random 256))))
      (define (iter x)
        (if (= x 0)
            (write-random)
            ((lambda () (write-random) (iter (- x 1))))))
      (iter 100))
    
    (thread
     (lambda ()
       (ascii-canvas-test-3)
       (send frame refresh)))
    
    (send frame show #t)
    
    (super-new)))


(define g (new gui%
               [w-in-chars 40]
               [h-in-chars 24]))

(send g ascii-canvas-test-1)
(send g ascii-canvas-test-2)
(send g ascii-canvas-test-3)