(while true
  (def e (.findNearestEnemy this))
  (if e
    (.attack this e)
    (.move this (clj->js { :x 53, :y 55 }))))
