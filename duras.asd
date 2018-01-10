;;;; duras.asd

(asdf:defsystem #:duras
  :author "papachan <papachan@gmail.com>"
  :license "MIT"
  :depends-on (:fiveam)
  :components ((:module "src"
                        :serial t
                        :components
                        ((:file "math")
                         (:file "duras")
                         (:file "binary")
                         (:file "algorithm"))))
  :description "Scaffold for beginners in Common Lisp"
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))
