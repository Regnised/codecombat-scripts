(while true
  (def f (.findFlag this))
  (if f
    (.pickUpFlag this f)
    (when true
      (def e (.findNearestEnemy this))
      (if e
        (if (.isReady this "bash")
          (.bash this e)
          (.attack this e))
        (.wait this 0.1)))))
