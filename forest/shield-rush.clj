(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (.isReady this "cleave")
      (.cleave this e)
      (.shield this)))
  (.wait this 0.1))
