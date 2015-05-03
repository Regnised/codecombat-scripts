(.moveXY this 23 23)
(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (.isReady this "cleave")
      (.cleave this e)
      (.attack this e)))
  (.wait this 0.1))
