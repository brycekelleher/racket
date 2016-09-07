;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (copylist l)
  (cond [(empty? l) empty]
        [else
         (cons (first l) (copylist (rest l)))]))

(define (reverselist l m)
  (cond [(empty? l) m]
        [else
         (reverselist (rest l) (cons (first l) m))]))

(copylist    (list 1 2 3 4 5))
(reverselist (list 1 2 3 4 5) empty)