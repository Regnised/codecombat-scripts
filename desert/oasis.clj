(def y 30)
(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (and (< (.distanceTo this e) 12) (>= (+ (.x (.pos e)) 5) (.x (.pos this))))
      (.moveXY this (- (.x (.pos e)) 5) y)
      (.moveXY this (+ (.x (.pos this)) 10) y))
    (.moveXY this (+ (.x (.pos this)) 10) y)))
