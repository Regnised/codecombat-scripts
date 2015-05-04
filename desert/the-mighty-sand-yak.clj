(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (< (.distanceTo this e) 10)
      (.moveXY this (+ (.x (.pos e)) 9) (.y (.pos this)))
      (.wait this 0.1))
    (.wait this 0.1)))
