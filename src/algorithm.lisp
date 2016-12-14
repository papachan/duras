;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
;;;; algorithm.lisp
(defpackage :algorithm
  (:use :cl))

(in-package :algorithm)

;; Loop
;; (defun findLongestSubstring (ns)
;;   (let ((best nil))
;;     (loop for n in ns do
;;          (if (> (length n) (length best))
;;              (setf best n)))
;;     best))

(defun findLongestSubstring (ns &optional (best nil))
  (cond ((not (null ns))
         (if (> (length (first ns)) (length best))
             (setf best (first ns)))
         (findLongestSubstring (cdr ns) best))
        (best)))




