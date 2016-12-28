;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; algorithm.lisp
(defpackage :algorithm
  (:use :cl)
  (:export :findLongestSubstring
           :findSmallestSubstring
           :reordering-list))

(in-package :algorithm)

(defun findLongestSubstring (lst &rest args)
  (let ((best (car args)))
    (if (not (null lst))
        (progn
          (if (< (length best) (length (first lst)))
              (setf best (first lst)))
          (findLongestSubstring (rest lst) best))
        best)))

(defun findSmallestSubstring (lst &rest args)
  (let ((best (car args)))
    (unless (car args)
      (setf best (first lst)))
    (if (not (null lst))
        (progn
          (cond ((< (length (first lst)) (length best))
                 (setf best (first lst))))
          (findSmallestSubstring (rest lst) best))
        best)))

;; reordering list
(defun reordering-list (lst &rest new)
  (let ((res (findSmallestSubstring lst)))
    (if (not (null lst))
        (reordering-list (remove res lst)
                         (append (car new) (list res)))
        (car new))))

