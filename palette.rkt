;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname palette) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define colors (list "Orange Red"
                     "OrangeRed"
                     "Tomato"
                     "DarkRed"
                     "Red"
                     "Firebrick"
                     "Crimson"
                     "DeepPink"
                     "Maroon"
                     "Indian Red"
                     "IndianRed"
                     "Medium Violet Red"
                     "MediumVioletRed"
                     "Violet Red"
                     "VioletRed"
                     "LightCoral"
                     "HotPink"
                     "PaleVioletRed"
                     "LightPink"
                     "RosyBrown"
                     "Pink"
                     "Orchid"
                     "LavenderBlush"
                     "Snow"
                     "Chocolate"
                     "SaddleBrown"
                     "Brown"
                     "DarkOrange"
                     "Coral"
                     "Sienna"
                     "Orange"
                     "Salmon"
                     "Peru"
                     "DarkGoldenrod"
                     "Goldenrod"
                     "SandyBrown"
                     "LightSalmon"
                     "DarkSalmon"
                     "Gold"
                     "Yellow"
                     "Olive"
                     "Burlywood"
                     "Tan"
                     "NavajoWhite"
                     "PeachPuff"
                     "Khaki"
                     "DarkKhaki"
                     "Moccasin"
                     "Wheat"
                     "Bisque"
                     "PaleGoldenrod"
                     "BlanchedAlmond"
                     "Medium Goldenrod"
                     "MediumGoldenrod"
                     "PapayaWhip"
                     "MistyRose"
                     "LemonChiffon"
                     "AntiqueWhite"
                     "Cornsilk"
                     "LightGoldenrodYellow"
                     "OldLace"
                     "Linen"
                     "LightYellow"
                     "SeaShell"
                     "Beige"
                     "FloralWhite"
                     "Ivory"
                     "Green"
                     "LawnGreen"
                     "Chartreuse"
                     "Green Yellow"
                     "GreenYellow"
                     "Yellow Green"
                     "YellowGreen"
                     "Medium Forest Green"
                     "OliveDrab"
                     "MediumForestGreen"
                     "Dark Olive Green"
                     "DarkOliveGreen"
                     "DarkSeaGreen"
                     "Lime"
                     "Dark Green"
                     "DarkGreen"
                     "Lime Green"
                     "LimeGreen"
                     "Forest Green"
                     "ForestGreen"
                     "Spring Green"
                     "SpringGreen"
                     "Medium Spring Green"
                     "MediumSpringGreen"
                     "Sea Green"
                     "SeaGreen"
                     "Medium Sea Green"
                     "MediumSeaGreen"
                     "Aquamarine"
                     "LightGreen"
                     "Pale Green"
                     "PaleGreen"
                     "Medium Aquamarine"
                     "MediumAquamarine"
                     "Turquoise"
                     "LightSeaGreen"
                     "Medium Turquoise"
                     "MediumTurquoise"
                     "Honeydew"
                     "MintCream"
                     "RoyalBlue"
                     "DodgerBlue"
                     "DeepSkyBlue"
                     "CornflowerBlue"
                     "Steel Blue"
                     "SteelBlue"
                     "LightSkyBlue"
                     "Dark Turquoise"
                     "DarkTurquoise"
                     "Cyan"
                     "Aqua"
                     "DarkCyan"
                     "Teal"
                     "Sky Blue"
                     "SkyBlue"
                     "Cadet Blue"
                     "CadetBlue"
                     "Dark Slate Gray"
                     "DarkSlateGray"
                     "LightSlateGray"
                     "SlateGray"
                     "Light Steel Blue"
                     "LightSteelBlue"
                     "Light Blue"
                     "LightBlue"
                     "PowderBlue"
                     "PaleTurquoise"
                     "LightCyan"
                     "AliceBlue"
                     "Azure"
                     "Medium Blue"
                     "MediumBlue"
                     "DarkBlue"
                     "Midnight Blue"
                     "MidnightBlue"
                     "Navy"
                     "Blue"
                     "Indigo"
                     "Blue Violet"
                     "BlueViolet"
                     "Medium Slate Blue"
                     "MediumSlateBlue"
                     "Slate Blue"
                     "SlateBlue"
                     "Purple"
                     "Dark Slate Blue"
                     "DarkSlateBlue"
                     "DarkViolet"
                     "Dark Orchid"
                     "DarkOrchid"
                     "MediumPurple"
                     "Cornflower Blue"
                     "Medium Orchid"
                     "MediumOrchid"
                     "Magenta"
                     "Fuchsia"
                     "DarkMagenta"
                     "Violet"
                     "Plum"
                     "Lavender"
                     "Thistle"
                     "GhostWhite"
                     "White"
                     "WhiteSmoke"
                     "Gainsboro"
                     "Light Gray"
                     "LightGray"
                     "Silver"
                     "Gray"
                     "Dark Gray"
                     "DarkGray"
                     "Dim Gray"
                     "DimGray"
                     "Black"))

(require 2htdp/image)
(require 2htdp/universe)

; code for drawing a color swatch
;(beside (overlay (square 10 "outline" "black") (square 10 "solid" (fourth  colors)))
;        (overlay (square 10 "outline" "black") (square 10 "solid" (second colors))))

;; =================
;; Constants:
(define SWATCH-SIZE 10)

;; =================
;; Data definitions:

; ColorList is one of:
;   - empty
;   - (cons Color empty)
; interp. A list of colors

(define CList1 (list "red" "green" "blue"))
(define CList2 (list "red" "green" "blue" "white" "black"))

#; template
(define (fn-for-colorlist cl)
  (cond [(empty? cl) (...)]
        [else (... (first cl)
                   (fn-for-colorlist (rest cl)))])) 

;; =================
;; Functions:

; _______________________________________________
; Color -> Image
; consumes a color and produces a new image of a single color swatch
(check-expect (draw-swatch "red")
              (overlay (square SWATCH-SIZE "outline" "black") (square SWATCH-SIZE "solid" "red")))
(check-expect (draw-swatch "green")
              (overlay (square SWATCH-SIZE "outline" "black") (square SWATCH-SIZE "solid" "green")))
(check-expect (draw-swatch "blue")
              (overlay (square SWATCH-SIZE "outline" "black") (square SWATCH-SIZE "solid" "blue")))

; Stub
;(define (draw-swatch color) empty-image)

(define (draw-swatch color)
  (overlay (square SWATCH-SIZE "outline" "black") (square SWATCH-SIZE "solid" color)))

; _______________________________________________
; Integer ColorList -> ColorList
; consumes an integer representing the number of swatches in a row and a color list and produces a colorlist
; representing a list of the colors in the row
(check-expect (first-row 100 empty)
              empty)
(check-expect (first-row 10 (list "red" "green" "blue"))
              (list "red"))
(check-expect (first-row 20 (list "red" "green" "blue"))
              (list "red" "green"))

; stub
;(define (first-row pw cl) empty)

(define (first-row pw cl)
  (cond [(or (empty? cl) (< pw SWATCH-SIZE)) empty]
        [else (cons (first cl)
                    (first-row (- pw SWATCH-SIZE) (rest cl)))]))

; _______________________________________________
; Integer ColorList -> ColorList
; consumes an integer representing the number of swatches in a row and a color list and produces a colorlist
; representing a list of the colors in the row
(check-expect (rest-row 1 empty) empty)
(check-expect (rest-row 10 (list "red" "green" "blue"))
              (list "green" "blue"))
(check-expect (rest-row 20 (list "red" "green" "blue"))
              (list "blue"))

; stub
;(define (rest-row pw cl) empty)
(define (rest-row pw cl)
  (cond [(empty? cl) empty]
        [(>= pw SWATCH-SIZE) (rest-row (- pw SWATCH-SIZE) (rest cl))]
        [else
         (cons (first cl)
               (rest-row (- pw SWATCH-SIZE) (rest cl)))]))
; _______________________________________________
; ColorList -> Image
; consumes a color list and produces an image representing a row in the palette containing the colors in the list
(check-expect (draw-palette-row (list "red" "green" "blue"))
              (beside (draw-swatch "red")
                      (beside (draw-swatch "green")
                              (beside (draw-swatch "blue")
                                      empty-image))))

; Stub
;(define (draw-palette-row cl) empty-image)

(define (draw-palette-row cl)
  (cond [(empty? cl) empty-image]
        [else (beside (draw-swatch (first cl))
                      (draw-palette-row (rest cl)))]))

; _______________________________________________
; Integer Integer List -> Image
; consumes two integers representing the width and the height of the palette as well as a list of colors in the palette
; and produces a new palette image

; stub
;(define (draw-palette pw ph colorlist) empty-image)
(check-expect (draw-palette 100 100 (list "red" "green" "blue"))
              (beside (draw-swatch "red")
                      (beside (draw-swatch "green")
                              (beside (draw-swatch "blue")
                                      empty-image))))

(define (draw-palette pw ph cl)
  (cond [(empty? cl) empty-image]
        [else (above/align "left"
                           (draw-palette-row (first-row pw cl))
                           (draw-palette pw ph (rest-row pw cl)))]))

