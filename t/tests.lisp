;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
;;;; tests.lisp
(asdf:oos 'asdf:load-op :fiveam)

(in-package :duras-test)

;;;;

(def-suite duras-suite :description
  "a serie of tests to validate each exercises")

(in-suite duras-suite)

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

(test test1_range-test
  "Test the RANGE function"
  (is (equal '(1 2) (range 1 2)))
  (is (equal '(2 3 4 5 6) (range 2 6)))
  (is (equal '(-2 -1 0 1 2 3) (range -2 3))))

(test test2_average-test
  "Test an Average function"
  (is (equal 3 (math::average '(0 6))))
  (is (equal 5/2 (math::average '(0 1 2 3 4 5)))))

(test test3_flatten-test
  "Test a flatten list"
  (is (equal '(1 2 3 4) (flatten '(1 (2) (3) 4))))
  (is (equal '(1 2 3 4 5 6) (flatten '(1 2 (3 4 5 6))))))

(test test4_find-min-max
  "Test which find the min and the max of a list"
  (is (equal '(0 4) (find-min-max '(1 0 4))))
  (is (equal '(0 10) (find-min-max '(1 0 10 4)))))

(test test5_smallest-two
  "A test finding the smallest two values at a list"
  (is (equal '(1 2)  (smallest-two '(6 5 4 3 2 1 3 4 5 6 7))))
  (is (equal '(1 1)  (smallest-two '(1 1 1 1 1))))
  (is (equal '(0 1)  (smallest-two '(1 1 0 1 1))))
  (is (equal '(0 1)  (smallest-two '(0 1 1 1 1)))))

(test test6_calculate-list-sum-exp
  "A test to calculate the sum of digits of 2**n and sum"
  (is (equal 4 (calculate-list-exp 2)))
  (is (equal 26 (calculate-list-exp 15)))
  (is (equal 256 (calculate-list-exp 200))))

(test test7_interleaves-test
  "Test an interleave function with two lists"
  (is (equal '(1 :1 2 :2 3 :3 4 :4 5 :5 6 :6)
             (interleave (range 1 6) *mylist*))))

(test test8_binary-test
  "Test to transform a integer into a binary list"
  (is (equal '(1) (binary::binary-list 1)))
  (is (equal '(1 1) (binary::binary-list 3)))
  (is (equal '(1 1 1) (binary::binary-list 7)))
  (is (equal '(1 1 1 1) (binary::binary-list 15)))
  (is (equal '(1 0 1 0 1 0) (binary::binary-list 42)))
  (is (equal '(1 1 1 1 1 1 1) (binary::binary-list 127))))

(test test9_round_100-test
  "Test to round 100 an integer"
  (is (equal 15000 (math::mround 14967 100))))

(test test11_findLongestSubString-test
  "Test to search the longest substring from a list"
  (is (equal "abracadabra$" (algorithm::findLongestSubstring *list*)))
  (is (equal "1" (algorithm::findLongestSubstring '("1" "2" "3")))))

(test test12_findSmallestSubString-test
  "Test to search the smallest substring from a list"
  (is (equal "a$" (algorithm::findSmallestSubString *list*))))

(test test13_reordering_list-test
  "Test reordering a list"
  (is (equal *result* (algorithm::reordering-list *list*))))

(test test14_sort_double_list-test
  "Test sorting two lists and merging into a single one"
  (let ((*listA* '(2 4 8 16))
        (*listB* '(3 5 7 11 13 17 19)))
    (is (equal '(2 3 4 5 7 8 11 13 16 17 19)
               (merge 'list *listA* *listB* '<)))))

(test test15_prime_number
  "detect when numer is prime or not"
  (is (equal (math::primep 0) nil))
  (is (equal (math::primep 2) t))
  (is (equal (math::primep 3) t))
  (is (equal (math::primep 4) nil)))

(test test16_get-10-first-primes-number
  "new method to get the 10 first primes number"
  (is (equal '(2 3 5 7 11 13 17 19 23 29) (first-primes))))

(test test17_binary-search
  "a binary search test"
  (let ((arr #(1 3 4 5 6 7)))
    (is (equal 0 (binary::binary-search 1 arr)))
    (is (equal 1 (binary::binary-search 3 arr)))
    (is (equal 5 (binary::binary-search 7 arr)))))

(test test18_clean_list
  "cleaning a list from letter"
  (let ((a '(1 2 a d e 6 7 9 10)))
    (is (equal '(1 2 6 7 9 10) (algorithm::clean-list a)))))

(test test19_min_list
  "find the minimum value of a given list"
  (let ((a '(1 8 14 32 4))
        (b '(32 6 4 77 50 21 38 2)))
    (is (equal 1 (algorithm::min-list a)))
    (is (equal 2 (algorithm::min-list b)))))

(test test20_remove_duplicates_in_list
  "remove duplicates elements of a given list"
  (let ((a '(a a a a b c c a a d e e e e)))
    (is (equal '(b c a d e) (algorithm::unique a)))
    (is (equal '(1 2 3 4 5 6) (algorithm::unique *lst*)))))


(run! 'duras-suite)

(print "test ends")
