;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; algorithm.lisp
(defpackage :algorithm
  (:use :cl))

(in-package :algorithm)

(defun findLongestSubstring (ns)
  (let ((best nil))
    (loop for n in ns do
         (if (> (length n) (length best))
             (setf best n)))
    best))


