(def hits 0)
(while (< hits 10)
  (def e (.findNearest this (.findEnemies this)))
  (when e
    (.attack this e)
    (def hits (inc hits))))
(.moveXY this 79 33)
