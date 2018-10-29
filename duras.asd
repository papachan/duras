;;;; duras.asd

(asdf:defsystem #:duras
  :author "papachan <papachan@gmail.com>"
  :license "BSD"
  :depends-on (:fiveam)
  :components ((:module "src"
                        :serial t
                        :components
                        ((:file "package")
                         (:file "math")
                         (:file "duras")
                         (:file "binary")
                         (:file "algorithm"))))
  :description "A project with some algorithms solving exercices"
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))
