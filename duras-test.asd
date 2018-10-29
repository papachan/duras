(defsystem duras-test
  :author "@papachan <papachan@gmail.com>"
  :license "BSD"
  :depends-on (:duras
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "package")
                 (:file "tests"))))
  :perform (test-op (o s)
                    (uiop:symbol-call :fiveam '#:run!
                                      (uiop:find-symbol* '#:all-tests duras-test)))
  :description "")
