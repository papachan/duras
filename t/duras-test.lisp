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

(def-suite duras-suite :description "first tests")

(in-suite duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test range-test
  "Test the RANGE function"
  (is (equal '(1 2) (duras::range 1 2)))
  (is (equal '(2 3 4 5 6) (duras::range 2 6)))
  (is (equal '(-2 -1 0 1 2 3) (duras::range -2 3))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
;; average test
(test average-test
  "Test an Average function"
  (is (equal 3 (duras::average '(0 6))))
  (is (equal 5/2 (duras::average '(0 1 2 3 4 5)))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test flatten-test
  "Test a flatten list"
  (is (equal '(1 2 3 4) (duras::flatten '(1 (2) (3) 4))))
  (is (equal '(1 2 3 4 5 6) (duras::flatten '(1 2 (3 4 5 6))))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test find-min-max
  "Test which find the min and the max of a list"
  (is (equal '(0 4) (duras::find-min-max '(1 0 4))))
  (is (equal '(0 10) (duras::find-min-max '(1 0 10 4)))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test smallest-two
  "A test finding the smallest two values at a list"
  (is (equal '(1 2)  (duras::smallest-two '(6 5 4 3 2 1 3 4 5 6 7)))) 
  (is (equal '(1 1)  (duras::smallest-two '(1 1 1 1 1)))) 
  (is (equal '(0 1)  (duras::smallest-two '(1 1 0 1 1))))
  (is (equal '(0 1)  (duras::smallest-two '(0 1 1 1 1)))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test calculate-list-sum-exp
  "A test to calculate the sum of digits of 2**n and sum"
  (is (equal 4 (duras::calculate-list-exp 2)))
  (is (equal 26 (duras::calculate-list-exp 15)))
  (is (equal 256 (duras::calculate-list-exp 200))))

(run! 'duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test interleaves-test
  "Test an interleave function with two lists"
  (is (equal '(1 :1 2 :2 3 :3 4 :4 5 :5 6 :6)
             (duras::interleave (duras::range 1 6) *mylist*))))

(run! 'duras-suite)




