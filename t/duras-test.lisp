;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage duras-test
  (:use :cl
        :fiveam
        :duras
        :binary
        :math
        :algorithm))

(in-package :duras-test)

;;;; 

(defparameter *mylist* '(:1 :2 :3 :4 :5 :6) "used for interleaves test")

(defparameter *lst* '(1 2 2 3 3 4 5 6 6) "used for remove duplicates test")

(defparameter *list* (list
                      "racadabra$"
                      "acadabra$"
                      "a$"
                      "abracadabra$"
                      "adabra$"
                      "abra$"
                      "bracadabra$"
                      "bra$"
                      "cadabra$"
                      "ra$")
  "A list for largest substring test")

(defparameter *result* (list
                      "a$"
                      "ra$"
                      "bra$"
                      "abra$"
                      "adabra$"
                      "cadabra$"
                      "acadabra$"
                      "racadabra$"
                      "bracadabra$"
                      "abracadabra$")
  "A list for sorting test output")

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
  (is (equal '(1) (binary-list 1)))
  (is (equal '(1 1) (binary-list 3)))
  (is (equal '(1 1 1) (binary-list 7)))
  (is (equal '(1 1 1 1) (binary-list 15)))
  (is (equal '(1 0 1 0 1 0) (binary-list 42)))
  (is (equal '(1 1 1 1 1 1 1) (binary-list 127))))

(test round_100-test
  "Test to round 100 an integer"
  (is (equal 15000 (mround 14967 100))))

(test remove_duplicates-test
  "Test remove duplicates"
  (is (equal '(1 2 3 4 5 6) (remove-duplicates *lst* :test #'equal))))

(test findLongestSubString-test
  "Test to search the longest substring from a list"
  (is (equal "abracadabra$" (algorithm::findLongestSubstring *list*)))
  (is (equal "1" (findLongestSubstring '("1" "2" "3")))))

(test findSmallestSubString-test
  "Test to search the smallest substring from a list"
  (is (equal "a$" (findSmallestSubString *list*))))

(test reordering_list-test
  "Test reordering a list"
  (is (equal *result* (reordering-list *list*))))

;; ++++++++++++++++++++++++++++++++++++++++++

(defparameter *listA* '(2 4 8 16))
(defparameter *listB* '(3 5 7 11 13 17 19))

(test sort_double_list-test
  "Test sorting two lists and merging into a single one"
  (is (equal '(2 3 4 5 7 8 11 13 16 17 19)
             (merge 'list *listA* *listB* '<))))

;; ++++++++++++++++++++++++++++++++++++++++++

(run! 'duras-suite)

