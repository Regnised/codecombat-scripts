(while true
  (def e (.findNearestEnemy this))
  (if e
    (.attack this e)
    (.attack this "Chest"))
  (.wait this 0.1))
