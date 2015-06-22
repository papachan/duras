;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-

;;;; duras.lisp
(in-package :cl-user)
(defpackage #:duras
  (:use #:cl)
  (:export :hello))
(in-package #:duras)

(defun hello()
  (print "hello duras"))
;; 
