(while true
  (def e (.findNearestEnemy this))
  (if e
    (when true
      (def d (.distanceTo this e))
      (if (< d 5)
        (if (.isReady this "cleave")
          (.cleave this e)
          (.attack this e))
        (.wait this 0.25)))
    (.wait this 0.25)))
