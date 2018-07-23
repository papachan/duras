;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-

(in-package :cl-user)

(defpackage :binary
  (:use :cl)
  (:export :binary-list))

(in-package :binary)

(defun binary-list (n)
  (assert (>= n 0))
  (multiple-value-bind (q r) (floor n 2)
    (if (zerop q)
        (list r)
        (nconc (binary-list q) (list r)))))

(defun binary-search (value array &optional (max) (min 0))
  (let* ((index (floor (+ min max) 2)))
    (cond ((< (aref array index) value)
           (binary-search value array (length array) index))
          ((> (aref array index) value)
           (binary-search value array index))
          (t index))))
