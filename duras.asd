;;;; duras.asd
(asdf:defsystem #:duras
  :author "@papachan"
  :license "MIT"
  :depends-on (:fiveam)
  :components ((:module "src"
                        :serial t
                        :components
		((:file "duras"))))
  :description "Scaffold for Common Lisp"
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))

