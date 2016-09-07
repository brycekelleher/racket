#lang racket

(require 2htdp/image)
(require 2htdp/universe)

;; =================
;; Constants:

(define EMPTY-SCENE (empty-scene 200 200))

;; =================
;; Data definitions:

(define-struct sprite-image (xf bm))
;; SpriteImage is (make-sprite-image Transform Bitmap)
;; interp. a sprite image consisting of a bitmap and a transform to be applied to the bitmap
#;
(define (fn-for-sprite-image si)
  (... (sprite-image-xf ...)
       (sprite-image-bm ...)))

;; SpriteFrame is one of:
;;   - empty
;;   - (cons SpriteImage SpriteFrame)
;; interp. A list of sprite image, usually indexed by direction
#;
(define (fn-for-sprite-frame sf)
  (cond [(empty? sf) ...]
        [else
         (... (fn-for-sprite-image (first sf))
              (fn-for-sprite-frame (rest sf)))]))

(define (tx-i bm) bm)
(define (tx-fh bm) (flip-horizontal bm))

;; sprite bitmaps
(define bitmap (bitmap/file "/mnt/hgfs/dev/doom_imp_sprite.bmp"))
(define bm-imp-idle-1-6   (freeze (*  0 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-1-5   (freeze (*  1 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-1-4   (freeze (*  2 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-1-3   (freeze (*  3 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-1-2   (freeze (*  4 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-2-6   (freeze (*  5 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-2-5   (freeze (*  6 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-2-4   (freeze (*  7 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-2-3   (freeze (*  8 59) (* 0 62) 59 62 bitmap))
(define bm-imp-idle-2-2   (freeze (*  9 59) (* 0 62) 59 62 bitmap))
(define bm-imp-attack-1-6 (freeze (* 10 59) (* 0 62) 59 62 bitmap))
(define bm-imp-attack-1-5 (freeze (* 11 59) (* 0 62) 59 62 bitmap))
(define bm-imp-attack-1-4 (freeze (*  0 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-1-3 (freeze (*  1 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-1-2 (freeze (*  2 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-2-6 (freeze (*  3 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-2-5 (freeze (*  4 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-2-4 (freeze (*  5 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-2-3 (freeze (*  6 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-2-2 (freeze (*  7 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-3-6 (freeze (*  8 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-3-5 (freeze (*  9 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-3-4 (freeze (* 10 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-3-3 (freeze (* 11 59) (* 1 62) 59 62 bitmap))
(define bm-imp-attack-3-2 (freeze (*  0 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-4-6 (freeze (*  1 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-4-5 (freeze (*  2 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-4-4 (freeze (*  3 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-4-3 (freeze (*  4 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-4-2 (freeze (*  5 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-5-6 (freeze (*  6 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-5-5 (freeze (*  7 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-5-4 (freeze (*  8 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-5-3 (freeze (*  9 59) (* 2 62) 59 62 bitmap))
(define bm-imp-attack-5-2 (freeze (* 10 59) (* 2 62) 59 62 bitmap))
(define bm-imp-pain-1-6   (freeze (* 11 59) (* 2 62) 59 62 bitmap))
(define bm-imp-pain-1-5   (freeze (*  0 59) (* 3 62) 59 62 bitmap))
(define bm-imp-pain-1-4   (freeze (*  1 59) (* 3 62) 59 62 bitmap))
(define bm-imp-pain-1-3   (freeze (*  2 59) (* 3 62) 59 62 bitmap))
(define bm-imp-pain-1-2   (freeze (*  3 59) (* 3 62) 59 62 bitmap))
(define bm-imp-die-1-0    (freeze (*  4 59) (* 3 62) 59 62 bitmap))
(define bm-imp-die-2-0    (freeze (*  5 59) (* 3 62) 59 62 bitmap))
(define bm-imp-die-3-0    (freeze (*  6 59) (* 3 62) 59 62 bitmap))
(define bm-imp-die-4-0    (freeze (*  7 59) (* 3 62) 59 62 bitmap))
(define bm-imp-die-5-0    (freeze (*  8 59) (* 3 62) 59 62 bitmap))
(define bm-imp-diex-1-0   (freeze (*  9 59) (* 3 62) 59 62 bitmap))
(define bm-imp-diex-2-0   (freeze (* 10 59) (* 3 62) 59 62 bitmap))
(define bm-imp-diex-3-0   (freeze (* 11 59) (* 3 62) 59 62 bitmap))
(define bm-imp-diex-4-0   (freeze (*  1 59) (* 4 62) 59 62 bitmap))
(define bm-imp-diex-5-0   (freeze (*  2 59) (* 4 62) 59 62 bitmap))
(define bm-imp-diex-6-0   (freeze (*  3 59) (* 4 62) 59 62 bitmap))
(define bm-imp-diex-7-0   (freeze (*  4 59) (* 4 62) 59 62 bitmap))
(define bm-imp-diex-8-0   (freeze (*  5 59) (* 4 62) 59 62 bitmap))

;; sprite-images
(define imp-idle-1-0 (make-sprite-image tx-fh bm-imp-idle-1-4))
(define imp-idle-1-1 (make-sprite-image tx-fh bm-imp-idle-1-3))
(define imp-idle-1-2 (make-sprite-image tx-i  bm-imp-idle-1-2))
(define imp-idle-1-3 (make-sprite-image tx-i  bm-imp-idle-1-3))
(define imp-idle-1-4 (make-sprite-image tx-i  bm-imp-idle-1-4))
(define imp-idle-1-5 (make-sprite-image tx-i  bm-imp-idle-1-5))
(define imp-idle-1-6 (make-sprite-image tx-i  bm-imp-idle-1-6))
(define imp-idle-1-7 (make-sprite-image tx-fh bm-imp-idle-1-5))
(define imp-idle-2-0 (make-sprite-image tx-fh bm-imp-idle-2-4))
(define imp-idle-2-1 (make-sprite-image tx-fh bm-imp-idle-2-3))
(define imp-idle-2-2 (make-sprite-image tx-i  bm-imp-idle-2-2))
(define imp-idle-2-3 (make-sprite-image tx-i  bm-imp-idle-2-3))
(define imp-idle-2-4 (make-sprite-image tx-i  bm-imp-idle-2-4))
(define imp-idle-2-5 (make-sprite-image tx-i  bm-imp-idle-2-5))
(define imp-idle-2-6 (make-sprite-image tx-i  bm-imp-idle-2-6))
(define imp-idle-2-7 (make-sprite-image tx-fh bm-imp-idle-2-5))
(define imp-attack-1-0 (make-sprite-image tx-fh bm-imp-attack-1-4))
(define imp-attack-1-1 (make-sprite-image tx-fh bm-imp-attack-1-3))
(define imp-attack-1-2 (make-sprite-image tx-i  bm-imp-attack-1-2))
(define imp-attack-1-3 (make-sprite-image tx-i  bm-imp-attack-1-3))
(define imp-attack-1-4 (make-sprite-image tx-i  bm-imp-attack-1-4))
(define imp-attack-1-5 (make-sprite-image tx-i  bm-imp-attack-1-5))
(define imp-attack-1-6 (make-sprite-image tx-i  bm-imp-attack-1-6))
(define imp-attack-1-7 (make-sprite-image tx-fh bm-imp-attack-1-5))
(define imp-attack-2-0 (make-sprite-image tx-fh bm-imp-attack-2-4))
(define imp-attack-2-1 (make-sprite-image tx-fh bm-imp-attack-2-3))
(define imp-attack-2-2 (make-sprite-image tx-i  bm-imp-attack-2-2))
(define imp-attack-2-3 (make-sprite-image tx-i  bm-imp-attack-2-3))
(define imp-attack-2-4 (make-sprite-image tx-i  bm-imp-attack-2-4))
(define imp-attack-2-5 (make-sprite-image tx-i  bm-imp-attack-2-5))
(define imp-attack-2-6 (make-sprite-image tx-i  bm-imp-attack-2-6))
(define imp-attack-2-7 (make-sprite-image tx-fh bm-imp-attack-2-5))
(define imp-attack-3-0 (make-sprite-image tx-fh bm-imp-attack-3-4))
(define imp-attack-3-1 (make-sprite-image tx-fh bm-imp-attack-3-3))
(define imp-attack-3-2 (make-sprite-image tx-i  bm-imp-attack-3-2))
(define imp-attack-3-3 (make-sprite-image tx-i  bm-imp-attack-3-3))
(define imp-attack-3-4 (make-sprite-image tx-i  bm-imp-attack-3-4))
(define imp-attack-3-5 (make-sprite-image tx-i  bm-imp-attack-3-5))
(define imp-attack-3-6 (make-sprite-image tx-i  bm-imp-attack-3-6))
(define imp-attack-3-7 (make-sprite-image tx-fh bm-imp-attack-3-5))
(define imp-attack-4-0 (make-sprite-image tx-fh bm-imp-attack-4-4))
(define imp-attack-4-1 (make-sprite-image tx-fh bm-imp-attack-4-3))
(define imp-attack-4-2 (make-sprite-image tx-i  bm-imp-attack-4-2))
(define imp-attack-4-3 (make-sprite-image tx-i  bm-imp-attack-4-3))
(define imp-attack-4-4 (make-sprite-image tx-i  bm-imp-attack-4-4))
(define imp-attack-4-5 (make-sprite-image tx-i  bm-imp-attack-4-5))
(define imp-attack-4-6 (make-sprite-image tx-i  bm-imp-attack-4-6))
(define imp-attack-4-7 (make-sprite-image tx-fh bm-imp-attack-4-5))
(define imp-attack-5-0 (make-sprite-image tx-fh bm-imp-attack-5-4))
(define imp-attack-5-1 (make-sprite-image tx-fh bm-imp-attack-5-3))
(define imp-attack-5-2 (make-sprite-image tx-i  bm-imp-attack-5-2))
(define imp-attack-5-3 (make-sprite-image tx-i  bm-imp-attack-5-3))
(define imp-attack-5-4 (make-sprite-image tx-i  bm-imp-attack-5-4))
(define imp-attack-5-5 (make-sprite-image tx-i  bm-imp-attack-5-5))
(define imp-attack-5-6 (make-sprite-image tx-i  bm-imp-attack-5-6))
(define imp-attack-5-7 (make-sprite-image tx-fh bm-imp-attack-5-5))
(define imp-pain-1-0   (make-sprite-image tx-fh bm-imp-pain-1-4))
(define imp-pain-1-1   (make-sprite-image tx-fh bm-imp-pain-1-3))
(define imp-pain-1-2   (make-sprite-image tx-i  bm-imp-pain-1-2))
(define imp-pain-1-3   (make-sprite-image tx-i  bm-imp-pain-1-3))
(define imp-pain-1-4   (make-sprite-image tx-i  bm-imp-pain-1-4))
(define imp-pain-1-5   (make-sprite-image tx-i  bm-imp-pain-1-5))
(define imp-pain-1-6   (make-sprite-image tx-i  bm-imp-pain-1-6))
(define imp-pain-1-7   (make-sprite-image tx-fh bm-imp-pain-1-5))
(define imp-die-1-0    (make-sprite-image tx-i  bm-imp-die-1-0))
(define imp-die-2-0    (make-sprite-image tx-i  bm-imp-die-2-0))
(define imp-die-3-0    (make-sprite-image tx-i  bm-imp-die-3-0))
(define imp-die-4-0    (make-sprite-image tx-i  bm-imp-die-4-0))
(define imp-die-5-0    (make-sprite-image tx-i  bm-imp-die-5-0))
(define imp-diex-1-0   (make-sprite-image tx-i  bm-imp-diex-1-0))
(define imp-diex-2-0   (make-sprite-image tx-i  bm-imp-diex-2-0))
(define imp-diex-3-0   (make-sprite-image tx-i  bm-imp-diex-3-0))
(define imp-diex-4-0   (make-sprite-image tx-i  bm-imp-diex-4-0))
(define imp-diex-5-0   (make-sprite-image tx-i  bm-imp-diex-5-0))
(define imp-diex-6-0   (make-sprite-image tx-i  bm-imp-diex-6-0))
(define imp-diex-7-0   (make-sprite-image tx-i  bm-imp-diex-7-0))
(define imp-diex-8-0   (make-sprite-image tx-i  bm-imp-diex-8-0))

;; frame definitions
(define imp-idle-1
  (list imp-idle-1-0
        imp-idle-1-1
        imp-idle-1-2
        imp-idle-1-3
        imp-idle-1-4
        imp-idle-1-5
        imp-idle-1-6
        imp-idle-1-7))
(define imp-idle-2
  (list imp-idle-2-0
        imp-idle-2-1
        imp-idle-2-2
        imp-idle-2-3
        imp-idle-2-4
        imp-idle-2-5
        imp-idle-2-6
        imp-idle-2-7))
(define imp-attack-1
  (list imp-attack-1-0
        imp-attack-1-1
        imp-attack-1-2
        imp-attack-1-3
        imp-attack-1-4
        imp-attack-1-5
        imp-attack-1-6
        imp-attack-1-7))
(define imp-attack-2
  (list imp-attack-2-0
        imp-attack-2-1
        imp-attack-2-2
        imp-attack-2-3
        imp-attack-2-4
        imp-attack-2-5
        imp-attack-2-6
        imp-attack-2-7))
(define imp-attack-3
  (list imp-attack-3-0
        imp-attack-3-1
        imp-attack-3-2
        imp-attack-3-3
        imp-attack-3-4
        imp-attack-3-5
        imp-attack-3-6
        imp-attack-3-7))
(define imp-attack-4
  (list imp-attack-4-0
        imp-attack-4-1
        imp-attack-4-2
        imp-attack-4-3
        imp-attack-4-4
        imp-attack-4-5
        imp-attack-4-6
        imp-attack-4-7))
(define imp-attack-5
  (list imp-attack-5-0
        imp-attack-5-1
        imp-attack-5-2
        imp-attack-5-3
        imp-attack-5-4
        imp-attack-5-5
        imp-attack-5-6
        imp-attack-5-7))
(define imp-pain-1
  (list imp-pain-1-0
        imp-pain-1-1
        imp-pain-1-2
        imp-pain-1-3
        imp-pain-1-4
        imp-pain-1-5
        imp-pain-1-6
        imp-pain-1-7))
(define imp-die-1
  (list imp-die-1-0))
(define imp-die-2
  (list imp-die-2-0))
(define imp-die-3
  (list imp-die-3-0))
(define imp-die-4
  (list imp-die-4-0))
(define imp-die-5
  (list imp-die-5-0))
(define imp-diex-1
  (list imp-diex-1-0))
(define imp-diex-2
  (list imp-diex-2-0))
(define imp-diex-3
  (list imp-diex-3-0))
(define imp-diex-4
  (list imp-diex-4-0))
(define imp-diex-5
  (list imp-diex-5-0))
(define imp-diex-6
  (list imp-diex-6-0))
(define imp-diex-7
  (list imp-diex-7-0))
(define imp-diex-8
  (list imp-diex-8-0))

(define-struct sprite-obj (frame dir))

;; =================
;; Functions:

;; Sprite -> Sprite
(define (main s)
  (big-bang s                     ; SpriteObj
            (on-tick tick 0.25)        ; SpriteObj -> SpriteObj
            (to-draw render)      ; SpriteObj -> SpriteObj
            (on-key handle-key))) ; SpriteObj KeyEvent -> SpriteObj


;; SpriteFrame -> SpriteFrame
(define (next-frame f)
  (cond [(eq? f imp-idle-1) imp-idle-2]
        [(eq? f imp-idle-2) imp-idle-1]
        [(eq? f imp-attack-1) imp-attack-2]
        [(eq? f imp-attack-2) imp-attack-3]
        [(eq? f imp-attack-3) imp-attack-4]
        [(eq? f imp-attack-4) imp-attack-5]
        [(eq? f imp-attack-5) imp-attack-1]
        [(eq? f imp-pain-1) imp-pain-1]
        [(eq? f imp-die-1) imp-die-2]
        [(eq? f imp-die-2) imp-die-3]
        [(eq? f imp-die-3) imp-die-4]
        [(eq? f imp-die-4) imp-die-5]
        [(eq? f imp-die-5) imp-die-1]
        [(eq? f imp-diex-1) imp-diex-2]
        [(eq? f imp-diex-2) imp-diex-3]
        [(eq? f imp-diex-3) imp-diex-4]
        [(eq? f imp-diex-4) imp-diex-5]
        [(eq? f imp-diex-5) imp-diex-6]
        [(eq? f imp-diex-6) imp-diex-7]
        [(eq? f imp-diex-7) imp-diex-8]
        [(eq? f imp-diex-8) imp-diex-1]))

(define (next-seq f)
  (cond [(eq? f imp-idle-1) imp-attack-1]
        [(eq? f imp-idle-2) imp-attack-1]
        [(eq? f imp-attack-1) imp-pain-1]
        [(eq? f imp-attack-2) imp-pain-1]
        [(eq? f imp-attack-3) imp-pain-1]
        [(eq? f imp-attack-4) imp-pain-1]
        [(eq? f imp-attack-5) imp-pain-1]
        [(eq? f imp-pain-1) imp-die-1]
        [(eq? f imp-die-1) imp-diex-1]
        [(eq? f imp-die-2) imp-diex-1]
        [(eq? f imp-die-3) imp-diex-1]
        [(eq? f imp-die-4) imp-diex-1]
        [(eq? f imp-die-5) imp-diex-1]
        [(eq? f imp-diex-1) imp-idle-1]
        [(eq? f imp-diex-2) imp-idle-1]
        [(eq? f imp-diex-3) imp-idle-1]
        [(eq? f imp-diex-4) imp-idle-1]
        [(eq? f imp-diex-5) imp-idle-1]
        [(eq? f imp-diex-6) imp-idle-1]
        [(eq? f imp-diex-7) imp-idle-1]
        [(eq? f imp-diex-8) imp-idle-1]))

;; SpriteObj -> SpriteObj
;; consumes a sprite obj and produces the next sprite state
(define (tick s)
  (make-sprite-obj (next-frame (sprite-obj-frame s)) (sprite-obj-dir s)))

;; _____________________________
;; Render

;; SpriteImage -> Image
(define (get-transformed-bitmap si)
  (let [(tx (sprite-image-xf si))
        (bm (sprite-image-bm si))]
    (tx bm)))

;; SpriteFrame Direction -> SpriteImage
(define (get-sprite-image sf dir)
  (if (= (length sf) 1)
      (get-transformed-bitmap (list-ref sf 0))
      (get-transformed-bitmap (list-ref sf dir))))

;; SpriteObj -> Image
;; renders the current state of the sprite
;; take the current sprite's frame and dir and lookup the image
(define (render s)
  (place-image (get-sprite-image (sprite-obj-frame s)
                                 (sprite-obj-dir s))
               100 100
               EMPTY-SCENE))

;; _____________________________
;; KeyHandler
(define (next-dir dir)
  (if (= (+ dir 1) 8)
      0
      (+ dir 1)))

(define (prev-dir dir)
  (if (= (- dir 1) -1)
      7
      (- dir 1)))

;; SpriteObj KeyEvent -> SpriteObj
(define (handle-key s ke)
  (cond [(key=? ke     " ") (make-sprite-obj (next-seq (sprite-obj-frame s))
                                             (sprite-obj-dir s))]
        [(key=? ke  "left") (make-sprite-obj (sprite-obj-frame s)
                                             (prev-dir (sprite-obj-dir s)))]
        [(key=? ke "right") (make-sprite-obj (sprite-obj-frame s)
                                             (next-dir (sprite-obj-dir s)))]))

(main (make-sprite-obj imp-idle-1 0))
