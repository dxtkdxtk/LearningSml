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

(define (my_delay th)
  (mcons #f th))
(define (my_force p)
  (if (mcar p)
      (mcdr p)
      (begin (set-mcar! p #t)
             (set-mcdr! p ((mcdr p )))
             (mcdr p))))

(define (bad_mult a b_thunk)
  (cond [(= a 0) 0]
        [(= a 1) (b_thunk)]
        [#t (+ (b_thunk) (bad_mult (- a 1) b_thunk))]))
             

(define (slow_add x y)
  (letrec ([slowadd (lambda (y z)
                      (if (= z 0)
                          y
                          (slowadd y (- z 1))))])
    (+ (slowadd x 50000000) y)))


(define res2 (bad_mult 0 (let ([p (my_delay (lambda () (slow_add 4 5)))])
                           (lambda () (my_force p)))))
;(define res (bad_mult 999 (let ([p (my_delay (lambda () (slow_add 3 4)))])
;                           (lambda () (my_force p)))))

(define ones (lambda () (cons 1 ones)))
(define (f1 x)  (cons x  (lambda () (f1 (+ x 1)))))
(define nats (lambda () (f 1)))



(define fib (letrec ([memo null]
                     [f (lambda (x)
                          (let ([ans (assoc x memo)])
                            (if ans
                                (cdr ans)
                                (let ([new-ans (if (or (= x 1) (= x 2))
                                                   1
                                                   (+ (f (- x 1)) (f (- x 2))))])
                                  (begin
                                    (set! memo (cons (cons x new-ans) memo))
                                    new-ans)))))])
              f))
                          