(while true
  (def e (.findNearestEnemy this))
  (if e
    (.attack this e)
    (.wait this 0.1)))
