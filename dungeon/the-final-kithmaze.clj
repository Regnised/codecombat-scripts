(dotimes [_ 4]
  (.moveRight this)
  (.moveUp this)
  (def e (.findNearestEnemy this))
  (.attack this e)
  (.attack this e)
  (.moveRight this)
  (.moveDown this 2)
  (.moveUp this))
