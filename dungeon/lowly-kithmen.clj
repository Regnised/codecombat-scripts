(dotimes [_ 2]
  (def e (.findNearestEnemy this))
  (.attack this e)
  (.attack this e))
(.moveDown this)
(.moveRight this 2)
