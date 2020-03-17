#lang sicp

; 设计一个函数返回三个参数中较大的两个的和。

(define (max-sum a b c)
  (sum-l (max-second a b (cons a (cons b (cons c '()))) (lambda (m n ) (cons m (cons n '()))))))

(define (max-second a b l p)
  (cond ((null? l) (p a b))
        ((and (>= a (car l)) (>= b (car l)))  (max-second a b (cdr l) p))
        (else
          (cond ((> a b) (max-second a (car l) (cdr l) p))
                (else (max-second b (car l) (cdr l) p))))))

(define (sum-l l)
  (cond ((null? l) 0)
        (else (+ (car l) (sum-l (cdr l))))))


(define (max-sum-2 a b c)
  (cond ((and (> (+ a b) (+ a c)) (> (+ a b) (+ b c))) (+ a b))
        ((and (> (+ b c) (+ a c)) (> (+ b c) (+ a b))) (+ b c))
        ((and (> (+ a c) (+ b c)) (> (+ a c) (+ a b))) (+ a c))
        (else (+ a b))))

; 在3个参数中 2 2 相加的合 找到最大的返回，如果找不出最大的说明3个参数相同，随便找两个参数返回即可。
; 在3个参数中，找一个参数判断其是不是最小的一个数，如果是返回前两个数相加，如果不是在前两个数中找到较大的一个与这个数相加返回。
; 将3个参数的和求出，然后找到3个参数中最小的一个，将和减去最小的一个及得到结果。
