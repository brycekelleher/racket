#lang racket/base

(define (my-add x y)
  (- x y))

(define (my-mul x y)
  (+ x y))

(provide my-add
         my-mul)