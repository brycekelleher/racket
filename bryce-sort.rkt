;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname bryce-sort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ListOfNumbers -> ListOfNumbers
;; consumes a list of numbers and produces a new sorted list of number
(check-expect (bryce-sort empty) empty)
(check-expect (bryce-sort (list 1)) (list 1))
(check-expect (bryce-sort (list 2 1)) (list 1 2))
(check-expect (bryce-sort (list 8 6 3 4 7 5 2 9 1)) (list 1 2 3 4 5 6 7 8 9))

(define (bryce-sort lon)
  (cond [(empty? lon) empty]
        [else
         (insert-into (first lon)
                      (bryce-sort (rest lon)))]))

;; consumes a number and a _sorted_ list of numbers and produces a sorted list with the
;; number inserted in the correct position
(check-expect (insert-into 1 empty) (list 1))
(check-expect (insert-into 2 (list 1)) (list 1 2))
(check-expect (insert-into 1 (list 2)) (list 1 2))
(check-expect (insert-into 3 (list 1 2 4 5)) (list 1 2 3 4 5))

(define (insert-into n lon)
  (cond [(empty? lon) (list n)]
        [else (if (< n (first lon))
                  (cons n lon)
                  (cons (first lon)
                        (insert-into n (rest lon))))]))
