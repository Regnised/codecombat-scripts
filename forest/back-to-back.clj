(while true
  (def e (.findNearestEnemy this))
  (if e
    (.attack this e)
    (.moveXY this 40 34)))
