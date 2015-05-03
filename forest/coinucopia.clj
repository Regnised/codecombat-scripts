(while true
  (def flag (.findFlag this))
  (if flag
    (.pickUpFlag this flag)
    (.say this "Place a flag for me to go to.")))
