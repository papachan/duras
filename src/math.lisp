;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; math.lisp
(defpackage :math
  (:use :cl)
  (:export :mround
           :average
           :primep))

(in-package :math)



(defun average (list)
  (/ (reduce #'+ list) (length list)))

(defun mround (n multiple)
  (let ((m (/ 1 multiple)))
    (/ (round (* n m)) m)))

(defun primep (n)
  (cond ((< n 2) nil)
        ((= n 2) t)
        (t
         (loop for i from 2 to (sqrt n)
            when (zerop (mod n i))
            return nil
            finally (return t)))))
