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


(test add-2
  "Test the ADD-2 function"
  (is (= 2 (add-2 0)))
  (is (= 0 (add-2 -2))))

(explain! (run 'add-2))

(test ok-test
  (is (= (+ 2 2) 4)))

(run 'ok-test)

(test range-2
  "Test the RANGE function"
  (is (equal '(1 2 3 4 5 6) (duras::range 1 6))))

(explain! (run 'range-2))

(test interleaves-test
  "Test an interleave function with two lists"
  (is (equal '(1 :1 2 :2 3 :3 4 :4 5 :5 6 :6)
             (duras::interleave (duras::range 1 6) *mylist*))))

(explain! (run 'interleaves-test))


;; 

