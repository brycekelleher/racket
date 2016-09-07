;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname flower) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)(require 2htdp/image)
(require 2htdp/universe)

;; My world program  (make this more specific)

;; =================
;; Constants:
(define SCENE-W 400)
(define SCENE-H 400)

(define SCENE (empty-scene SCENE-W SCENE-H))

(define PETAL-COLOR "yellow")
(define CENTER-COLOR "red")
(define PETAL-W 10)
(define PETAL-H 30)
(define GROW-SPEED 0.05)

;; =================
;; Data definitions:

(define-struct flower (x y scale))
;; Flower is (make-flower Integer Integer Real)
;;   - x is flower x-center in screen coordinates
;;   - y is flower y-center in screen coordinates
;;   - scale is the size modifier for the flower
;; Template rules used:
;;   - compound

(define F1 (make-flower 100 100 1))

(define (fn-for-flower f)
  (... (flower-x f)
       (flower-y f)
       (flower-scale f)))

;; =================
;; Functions:

;; Flower -> Flower
;; start the world with ...
;; 
(define (main f)
  (big-bang f                          ; Flower
            (on-tick  next-flower)     ; Flower -> Flower
            (to-draw  render-flower)   ; Flower -> Flower
            (on-mouse handle-mouse)))  ; Flower Integer Integer MouseEvent -> Flower

;; Flower -> Flower
;; consumes the current flower state, grows the size of the flower and produces the next flower state
(check-expect (next-flower (make-flower 100 100 1))
              (make-flower 100 100 (+ 1 GROW-SPEED)))
;; stub
;(define (next-flower f) F1)

(define (next-flower f)
  (cond [(> (flower-scale f) 3) f]
        [else 
         (make-flower (flower-x f)
                      (flower-y f)
                      (+ (flower-scale f) GROW-SPEED))]))


;; Flower -> Image
;; consumes the current flower state and produces an image interpretation of the flower state
(check-expect (render-flower (make-flower 100 100 1))
              (place-image (overlay (rotate   0 (ellipse 10 30 "solid" "yellow"))
                                    (rotate  45 (ellipse 10 30 "solid" "yellow"))
                                    (rotate  90 (ellipse 10 30 "solid" "yellow"))
                                    (rotate 135 (ellipse 10 30 "solid" "yellow"))
                                    (rotate 180 (ellipse 10 30 "solid" "yellow")))
                           100
                           100
                           SCENE))
(check-expect (render-flower (make-flower 100 100 2))
              (place-image (overlay (rotate   0 (ellipse 20 60 "solid" "yellow"))
                                    (rotate  45 (ellipse 20 60 "solid" "yellow"))
                                    (rotate  90 (ellipse 20 60 "solid" "yellow"))
                                    (rotate 135 (ellipse 20 60 "solid" "yellow"))
                                    (rotate 180 (ellipse 20 60 "solid" "yellow")))
                           100
                           100
                           SCENE))

;; stub
;(define (render-flower f) empty-image)
(define (render-flower f)
  (place-image (overlay (rotate   0 (ellipse (* (flower-scale f) 10) (* (flower-scale f) 30) "solid" "yellow"))
                        (rotate  45 (ellipse (* (flower-scale f) 10) (* (flower-scale f) 30) "solid" "yellow"))
                        (rotate  90 (ellipse (* (flower-scale f) 10) (* (flower-scale f) 30) "solid" "yellow"))
                        (rotate 135 (ellipse (* (flower-scale f) 10) (* (flower-scale f) 30) "solid" "yellow"))
                        (rotate 180 (ellipse (* (flower-scale f) 10) (* (flower-scale f) 30) "solid" "yellow")))
               (flower-x f)
               (flower-y f)
               SCENE))

;; Flower Integer Integer MouseEvent -> Flower
;; Consumes the current Flower state and produces a new Flower state dependent on the behaviour of the mouse event
(define (handle-mouse f x y me)
  (cond [(mouse=? me "button-up") (make-flower x y 1)]
        [else f]))