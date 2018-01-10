;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; duras.lisp

(in-package :cl-user)

(defpackage :duras
  (:use :cl)
  (:import-from #:math
                :primep)
  (:export :range
           :interleave
           :flatten
           :find-min-max
           :smallest-two
           :number-to-list
           :calculate-list-exp
           :first-primes))

(in-package :duras)

; a range function
(defun range (min max)
  (loop for n from min below (+ 1 max)
       collect n))

(defun interleave (lst1 lst2)
  "interleave example"
  (cond ((and (eql lst1 nil) (eql lst2 nil)) nil)
        ((eql lst1 nil ) (cons nil (interleave lst2 lst1)))
        (t  (cons (first lst1) (interleave lst2 (rest lst1))))))

(defun flatten (structure)
  (cond ((null structure) nil)
        ((atom structure) (list structure))
        (t (mapcan #'flatten structure))))

(defun find-min-max (numbers)
  (let ((min 100) (max -1))
    (dolist (i numbers (list min max))
      (if (> i max) (setf max i))
      (if (< i min) (setf min i)))))

(defun smallest-two (lst)
  (let ((min1 (min (first lst) (second lst)))
        (min2 (max (first lst) (second lst))))
    (dolist (element (cddr lst) (list min1 min2))
      (cond
        ((< element min1) (setf min2 min1 min1 element))
        ((< element min2) (setf min2 element))))))

(defun number-to-list (n)
  (loop for c across
       (write-to-string n) collect (digit-char-p c)))

(defun calculate-list-exp (n)
  (reduce #'+ (number-to-list (expt 2 n))))

(defun first-primes (&key (end 10))
  (loop for n upfrom 2
     when (primep n)
     sum 1 into count
     and collect n
     until (>= count end)))

;;
