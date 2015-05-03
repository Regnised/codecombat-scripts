(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (< (.distanceTo this e) 5)
      (if (.isReady this "cleave")
        (.cleave this e))))
  (.attack this "Chest"))
