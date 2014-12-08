#lang racket

(provide (all-defined-out))
(define b 3)
(define f (lambda (x) (* 1 (+ x b))))

(define a (f 3))

(set! b 5)
(define c (f 4))

(define lst (cons 1 (cons #t (cons "hi" null))))
(define pr (cons 1 (cons #t "hi")))

(define mpr (mcons 1 (mcons #t "hi")))

