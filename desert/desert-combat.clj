(def ordersGiven 0)
(while (< ordersGiven 5)
  (.moveXY this (.x (.pos this)) (- (.y (.pos this)) 8))
  (.say this "Attack!")
  (def ordersGiven (inc ordersGiven)))
(.moveXY this 38 26)
(.powerUp this)
(while true
  (def e (.findNearest this (.findEnemies this)))
  (if e
    (.attack this e)
    (.wait this 0.1)))
