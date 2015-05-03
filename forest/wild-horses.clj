(while true
  (def h (.findNearest this (.findFriends this)))
  (if h
    (when true
      (.move this (.pos h))
      (when (< (.distanceTo this h) 10)
        (.say this "Whoa")
        (.moveXY this 28 54)))
    (.wait this 0.125)))
