(while true
  (def flag (.findFlag this))
  (if flag
    (.pickUpFlag this flag)
    (when true
      (def item (.findNearestItem this))
      (if item
        (.move this (.pos item))
        (.say this "Place a flag for me to go to.")))))
