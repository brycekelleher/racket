#lang racket/gui

(require 2htdp/image)
(require 2htdp/universe)

;; imp sprites
(define bitmap (bitmap/file "/mnt/hgfs/dev/doom_imp_sprite.bmp"))
(define imp_idle_1   (freeze (* 0 59) (* 0 62) 59 62 bitmap))
(define imp_idle_2   (freeze (* 5 59) (* 0 62) 59 62 bitmap))

(define imp_attack_1 (freeze (* 10 59) (* 0 62) 59 62 bitmap))
(define imp_attack_2 (freeze (*  3 59) (* 1 62) 59 62 bitmap))
(define imp_attack_3 (freeze (*  8 59) (* 1 62) 59 62 bitmap))
(define imp_attack_4 (freeze (*  1 59) (* 2 62) 59 62 bitmap))
(define imp_attack_5 (freeze (*  6 59) (* 2 62) 59 62 bitmap))

(define imp_pain_1   (freeze (* 11 59) (* 2 62) 59 62 bitmap))

(define imp_die_1    (freeze (*  4 59) (* 3 62) 59 62 bitmap))
(define imp_die_2    (freeze (*  5 59) (* 3 62) 59 62 bitmap))
(define imp_die_3    (freeze (*  6 59) (* 3 62) 59 62 bitmap))
(define imp_die_4    (freeze (*  7 59) (* 3 62) 59 62 bitmap))
(define imp_die_5    (freeze (*  8 59) (* 3 62) 59 62 bitmap))

(define imp_diex_1    (freeze (*  9 59) (* 3 62) 59 62 bitmap))
(define imp_diex_2    (freeze (* 10 59) (* 3 62) 59 62 bitmap))
(define imp_diex_3    (freeze (* 11 59) (* 3 62) 59 62 bitmap))
(define imp_diex_4    (freeze (*  1 59) (* 4 62) 59 62 bitmap))
(define imp_diex_5    (freeze (*  2 59) (* 4 62) 59 62 bitmap))
(define imp_diex_6    (freeze (*  3 59) (* 4 62) 59 62 bitmap))
(define imp_diex_7    (freeze (*  4 59) (* 4 62) 59 62 bitmap))
(define imp_diex_8    (freeze (*  5 59) (* 4 62) 59 62 bitmap))

(define EMPTY-SCENE (empty-scene 200 200))


(define-struct state (action bm))

;; Bitmap -> Bitmap
(define (main s)
  (big-bang s                     ; Bitmap
            (on-tick tick 0.25)     ; Bitmap -> Bitmap
            (to-draw render)       ; Bitmap -> Image
            (on-key handle-key)))  ; Bitmap KeyEvent -> Image

;; Bitmap -> Bitmap
;; consumes the current state and produces the next state
(define (tick-imp-idle bm)
  (cond [(eq? bm imp_idle_1) imp_idle_2]
        [(eq? bm imp_idle_2) imp_idle_1]))

(define (tick-imp-attack bm)
  (cond
    [(eq? bm imp_attack_1) imp_attack_2]
        [(eq? bm imp_attack_2) imp_attack_3]
        [(eq? bm imp_attack_3) imp_attack_4]
        [(eq? bm imp_attack_4) imp_attack_2]
        ;[(eq? bm imp_attack_4) imp_attack_2]
        [else (error "how did I get here")]))

(define (tick-imp-die bm)
  (cond [(eq? bm imp_die_1) imp_die_2]
        [(eq? bm imp_die_2) imp_die_3]
        [(eq? bm imp_die_3) imp_die_4]
        [(eq? bm imp_die_4) imp_die_5]
        [(eq? bm imp_die_5) imp_die_1]
        [else (error "how did I get here")]))

(define (tick-imp-diex bm)
  (cond [(eq? bm imp_diex_1) imp_diex_2]
        [(eq? bm imp_diex_2) imp_diex_3]
        [(eq? bm imp_diex_3) imp_diex_4]
        [(eq? bm imp_diex_4) imp_diex_5]
        [(eq? bm imp_diex_5) imp_diex_6]
        [(eq? bm imp_diex_6) imp_diex_7]
        [(eq? bm imp_diex_7) imp_diex_8]
        [(eq? bm imp_diex_8) imp_diex_1]
        [else (error "how did I get here")]))

(define (lookup-action-fn action)
  (cond [(eq? 'idle action) tick-imp-idle]
        [(eq? 'attack action) tick-imp-attack]
        [(eq? 'die action) tick-imp-die]
        [(eq? 'diex action) tick-imp-diex]))

(define (tick s)
  (define action (state-action s))
  (define bm     (state-bm s))
  (make-state action
              ((lookup-action-fn action) bm)))

;; Bitmap -> Image
;; consumes the current state and prodcues the scene image
(define (render s)
  (define action (state-action s))
  (define bm     (state-bm s))
  (place-image bm 100 100 EMPTY-SCENE))

;; fixme: factor out into next-state
(define (handle-key s ke)
  (define action (state-action s))
  (define bm     (state-bm s))
  (cond [(and (key=? ke " ") (eq? action 'idle  )) (make-state 'attack imp_attack_2)]
        [(and (key=? ke " ") (eq? action 'attack)) (make-state 'die imp_die_1)]
        [(and (key=? ke " ") (eq? action 'die   )) (make-state 'diex imp_diex_1)]
        [(and (key=? ke " ") (eq? action 'diex  )) (make-state 'idle imp_idle_1)]))

(main (make-state 'idle imp_idle_1))

