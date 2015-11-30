;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage duras-test
  (:use :cl :fiveam :duras)
  (:import-from :duras :hello))

(in-package :duras-test)

; test a call a function from duras
(hello)

;;;; First we need some functions to test.

(defparameter *mylist* '(:1 :2 :3 :4 :5 :6))

(defun add-2 (n)
  (+ n 2))

(defun add-4 (n) 
  (+ n 4))

(def-suite duras-suite :description "first tests")

(in-suite duras-suite)

(test add-2
  "Test the ADD-2 function"
  (is (= 2 (add-2 0)))
  (is (= 0 (add-2 -2))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test ok-test
  (is (= (+ 2 2) 4)))

;; range test
(test ok-range
  "Test the RANGE function"
  (is (equal '(1 2 3 4 5 6) (duras::range 1 6))))

;; ++++++++++++++++++++++++++++++++++++++++++
;; average test
(test ok-average
      "Test an Average function"
      (is (equal 3 (duras::average '(0 6)))))

;; ++++++++++++++++++++++++++++++++++++++++++
(test interleaves-test
  "Test an interleave function with two lists"
  (is (equal '(1 :1 2 :2 3 :3 4 :4 5 :5 6 :6)
             (duras::interleave (duras::range 1 6) *mylist*))))

(test flatten-test
  "Test a flatten list"
  (is (equal '(1 2 3 4) (duras::flatten '(1 (2) (3) 4)))))

(run 'duras-suite)

