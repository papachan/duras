;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage duras-test
  (:use :cl :fiveam :duras :binary)
  (:import-from :duras)
  (:import-from :binary)
  (:import-from :algorithm))

(in-package :duras-test)

;;;; 

(defparameter *mylist* '(:1 :2 :3 :4 :5 :6))

(defparameter *list* (list
                      "racadabra$"
                      "acadabra$"
                      "a$"
                      "abracadabra$"
                      "adabra$"
                      "abracadabra$"
                      "abra$"
                      "bracadabra$"
                      "bra$"
                      "cadabra$"
                      "ra$"))

(def-suite duras-suite :description "first tests")

(in-suite duras-suite)

;; ++++++++++++++++++++++++++++++++++++++++++
(test range-test
  "Test the RANGE function"
  (is (equal '(1 2) (range 1 2)))
  (is (equal '(2 3 4 5 6) (range 2 6)))
  (is (equal '(-2 -1 0 1 2 3) (range -2 3))))

;; ++++++++++++++++++++++++++++++++++++++++++
;; average test
(test average-test
  "Test an Average function"
  (is (equal 3 (average '(0 6))))
  (is (equal 5/2 (average '(0 1 2 3 4 5)))))

;; ++++++++++++++++++++++++++++++++++++++++++
(test flatten-test
  "Test a flatten list"
  (is (equal '(1 2 3 4) (flatten '(1 (2) (3) 4))))
  (is (equal '(1 2 3 4 5 6) (flatten '(1 2 (3 4 5 6))))))

;; ++++++++++++++++++++++++++++++++++++++++++
(test find-min-max
  "Test which find the min and the max of a list"
  (is (equal '(0 4) (find-min-max '(1 0 4))))
  (is (equal '(0 10) (find-min-max '(1 0 10 4)))))

;; ++++++++++++++++++++++++++++++++++++++++++
(test smallest-two
  "A test finding the smallest two values at a list"
  (is (equal '(1 2)  (smallest-two '(6 5 4 3 2 1 3 4 5 6 7)))) 
  (is (equal '(1 1)  (smallest-two '(1 1 1 1 1)))) 
  (is (equal '(0 1)  (smallest-two '(1 1 0 1 1))))
  (is (equal '(0 1)  (smallest-two '(0 1 1 1 1)))))

;; ++++++++++++++++++++++++++++++++++++++++++
(test calculate-list-sum-exp
  "A test to calculate the sum of digits of 2**n and sum"
  (is (equal 4 (calculate-list-exp 2)))
  (is (equal 26 (calculate-list-exp 15)))
  (is (equal 256 (calculate-list-exp 200))))

;; ++++++++++++++++++++++++++++++++++++++++++
(test interleaves-test
  "Test an interleave function with two lists"
  (is (equal '(1 :1 2 :2 3 :3 4 :4 5 :5 6 :6)
             (interleave (range 1 6) *mylist*))))

;; ++++++++++++++++++++++++++++++++++++++++++

(test binary-test
  "Test to transform a integer into a binary list"
  (is (equal '(1 0 1 0 1 0) (binary::binary-list 42))))

(test round_100-test
  "Test to round 100 an integer"
  (is (equal 15000 (mround 14967 100))))

(test findLongestSubString-test
  "Test to search the longest substring from a list"
  (is (equal "abracadabra$" (algorithm::findLongestSubstring *list*)))
  (is (equal "1" (algorithm::findLongestSubstring '("1" "2" "3")))))

(run! 'duras-suite)


