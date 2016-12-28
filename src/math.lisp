;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; math.lisp
(defpackage :math
  (:use :cl)
  (:export :mround
           :average))

(in-package :math)



(defun average (list)
  (/ (reduce #'+ list) (length list)))

(defun mround (n multiple)
  (let ((m (/ 1 multiple)))
    (/ (round (* n m)) m)))
