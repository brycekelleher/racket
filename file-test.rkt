#lang racket

(require  test-engine/racket-gui
         "file.rkt")

(check-expect (my-add 1 1) 2)
(check-expect (my-mul 3 2) 6)

(test)