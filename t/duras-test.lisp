;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-

(asdf:oos 'asdf:load-op :fiveam)

(defpackage duras-test
  (:use :cl :fiveam :duras))

(in-package :duras-test)

; test a call a function from duras
(duras:hello)

;;;; First we need some functions to test.

(defun range (start end)
  (if (> start end)
      nil
      (cons start (range (+ start 1) end))))

(defun add-2 (n)
  (+ n 2))

(defun add-4 (n) 
  (+ n 4))


(test add-2
  "Test the ADD-2 function"
  (is (= 2 (add-2 0)))
  (is (= 0 (add-2 -2))))

(run 'add-2) 

(explain! (run 'add-2))

(run! 'add-2)

(def-suite :duras-test :description "first tests")

(in-suite :duras-test)

(test ok-test
  (is (= (+ 2 2) 4)))

(test range-2
  "Test the RANGE function"
  (is (equal '(1 2 3 4 5 6) (range 1 6))))


(run! 'duras-test)
