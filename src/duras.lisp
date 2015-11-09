;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; duras.lisp
;(do-all-symbols (sym (find-package :duras)) (export sym))

(in-package :cl-user)

(defpackage :duras
  (:use :cl)
  (:documentation "a simple exercise"))

(in-package :duras)

;;; "duras" goes here. Hacks and glory await!

(defun hello()
  (print "hello example test")
  (terpri))

; a range function
(defun range (min max)
  (loop for n from min below (+ 1 max)
       collect n))

;;; interleaves two lists in a method:
;;; (range 1 6) (:1 :2 :3 :4 :5 :6)
(defparameter *mylist* '(:1 :2 :3 :4 :5 :6))

(defun interleave (lst1 lst2)
  "interleave example"
  (cond ((and (eql lst1 nil) (eql lst2 nil)) nil)
        ((eql lst1 nil ) (cons nil (interleave lst2 lst1)))
        (t  (cons (first lst1) (interleave lst2 (rest lst1))))))

;;
