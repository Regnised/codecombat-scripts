(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (.isReady this "bash")
      (.bash this e)
      (.attack this e)))
  (.moveXY this 40 37))
