#lang racket

(define (check-prefix? s prefix) (string-prefix? s prefix))
(define (drop-prefix s prefix) (substring s (string-length prefix)))

;; String -> (listof LexicalTokens)
;; consumes a string a produces a list of lexical tokens
(define (lex-string s)
  (cond [(string=? s "") empty]
        [(string-prefix? s "(") (cons "o-paren" (lex-string (drop-prefix s "(")))]
        [(string-prefix? s ")") (cons "c-paren" (lex-string (drop-prefix s ")")))]
        [(string-prefix? s "+") (cons "builtin+" (lex-string (drop-prefix s "+")))]
        [(string-prefix? s "-") (cons "builtin-" (lex-string (drop-prefix s "-")))]
        [(string-prefix? s " ") (lex-string (drop-prefix s " "))]
        [else
         (error "couldn't parse string")]))

(define LEX1 (lex-string "(+)"))

;;(define num-table
;;  '(("1" 1) ("2" 2) ("3" 3) ("4" 4) ("5" 5) ("6" 6) ("7" 7) ("8" 8) ("9" 9)))
(define (my-string->num s)
  (foldl (lambda (x y) (+ (* 10 y)
                          (- (char->integer x)
                             (char->integer #\0))))
         0
         (string->list s)))