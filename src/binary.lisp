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
