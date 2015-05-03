(while true
  (def f (.findFlag this))
  (if f
    (.pickUpFlag this f)
    (when true
      (def e (.findNearestEnemy this))
      (if e
        (when true
          (if (.isReady this "bash")
            (.bash this e)
            (if (.isReady this "cleave")
              (.cleave this e)
              (.attack this e))))
        (when true
          (def i (.findNearestItem this))
          (if i
            (.move this (.pos i))
            (.say this "I'm ready.")))))))
