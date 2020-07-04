;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(in-package :cl-user)

(defpackage :hackerrank
  (:use :cl))

(in-package :hackerrank)
;; https://www.hackerrank.com/challenges/area-under-curves-and-volume-of-revolving-a-curv/problem
;; Consider the algebraic expression given by:
;;
;; (a1)xb1 + (a2)xb2 + (a3)xb3 ......(an)xbn
;;
;; For the purpose of numerical computation, the area under the curve
;; y = f(x) between the limits a and b can be computed by the Limit
;; Definition of a Definite Integral.
;;
;; Some background about areas and volume computation.
;;
;; Using equal Sub-Intervals of length = 0.001, you need to
;;
;; Evaluate the area bounded by a given polynomial function of the
;; kind described above, between given limits a and b.
;;
;; Evaluate the volume of the solid obtained by revolving this
;; polynomial curve around the X-Axis.
;;
;; Round off your answers to one decimal place(x.x). An error margin
;; of +/- 0.2 will be tolerated.
;;
;; Input Format
;;
;; First line will contain N integers separated by spaces, which are
;; the values of a1, a2...aN.
;;
;;
;; Second Line will contain N integers separated by spaces, which are
;; the values of b1, b2...bN.
;;
;; The third Line will contain two space separated Integers which are
;; the lower and upper limits of the range in which integration needs
;; to be performed.
;;
;; Constraints
;; -1000 <= a <= 1000
;; -20 <= b <= 20
;; 1 <= L < R <= 20
;;
;; Output Format
;;
;; The first Line will contain the area between the curve and the
;; x-axis, bound between the specified limits. The second Line will
;; contain the volume of the solid obtained by rotating the curve
;; around the x-axis, between the specified limits.
;;
;; Sample Input:
;;
;; 1 2
;; 0 1
;; 2 20
;;
;; Explanatory Note:
;;
;; The algebraic expression represented by
;;
;; (1)x6 + (2)x7 + (3)x8 + (4)x9 + (5)x10
;;
;; We need to find the area of the curve enclosed under this curve,
;; between the limits x=1 and 4. And, we also need to find the volume
;; of the solid formed by revolving this curve around the x-axis
;; between the limits x = 1 and 4.
;;
;; Sample Output
;;
;; 414.0
;; 36024.1
;;
(defun read-list ()
  (with-input-from-string (in (read-line))
    (loop for x = (read in nil nil) while x collect x)))

(defun bounds (&key (start 0) (end 10) (step (/ 1 1000)))
  (loop for i from start upto end by step collect i))

(defun calculate-area-volume (bounds coefs powers)
  (flet ((algebraic-exp (x)
           (reduce #'+ (mapcar (lambda (a b) (* a (expt x b))) coefs powers))))
    (mapcar #'algebraic-exp bounds)))

(defun area (step g)
  (* step (reduce #'+ g)))

(defun volume (step g)
  (flet ((pow-pi (x)
           (* pi (expt x 2))))
    (* step (reduce #'+ (mapcar #'pow-pi g)))))

(defun calculate (coefs powers lv)
  (let* ((step 0.001)
         (b (bounds :start (car lv) :end (second lv) :step step))
         (res (calculate-area-volume b coefs powers))
         (a (area step res))
         (v (volume step res)))
    (format t "~,1F~%~,1F~%" a v)))

(defun main ()
  (let ((z (read-list))
        (x (read-list))
        (v (read-list)))
    (calculate z x v)))

(main)
;; input:
;; 1 2
;; 0 1
;; 2 20

;; Expected
;; 414.0
;; 36024.1

;; input:
;; 1 2 3 4 5
;; 6 7 8 9 10
;; 1 4

;; Expected
;; 2435300.3
;; 26172951168940.8
