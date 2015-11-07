(defsystem duras-test
  :author "@papachan <papachan@gmail.com>"
  :version "0.1"
  :license "MIT"
  :depends-on (:duras
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "duras-test"))))
  :description "")
