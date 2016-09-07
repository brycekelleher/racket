#lang racket

(require 2htdp/image)

(define BASE-SIZE 10)
(define T1 (triangle BASE-SIZE "solid" "red"))
(define S1 (square BASE-SIZE "solid" "red"))

(define (tri-fractal s)
  (cond [(<= s BASE-SIZE) T1]
        [else
         (local [(define ss (/ s 2))]
           (above (tri-fractal ss)
                  (beside (tri-fractal ss)
                          (tri-fractal ss))))]))

(define (sq-fractal s)
  (cond [(<= s BASE-SIZE) S1]
        [else
         (local [(define ss (/ s 3))]
           (above (beside (sq-fractal ss) (sq-fractal ss) (sq-fractal ss))
                  (beside (sq-fractal ss) (square ss "solid" "white") (sq-fractal ss))
                  (beside (sq-fractal ss) (sq-fractal ss) (sq-fractal ss))))]))
         