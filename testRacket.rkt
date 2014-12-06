#lang racket

(provide (all-defined-out))

(define x 3)
(define y (+ x 2))
(define cube1 
  (lambda (x)
         (* x (* x x))))
(define cube2 
  (lambda (x)
         (* x x x)))
(define (cube3 x)
  (* x x x))

(define (my-map f xs)
  (if (null? xs)
      null       
      (cons (f (car xs))          
            (my-map f (cdr xs)))))
             
(define foo (my-map (lambda (x) (+ x 1))
                    (cons 1 (cons 2 (cons 3 null)))))