(defn goback []
  (.wait this 0.001)
  (if (and (= (.x (.pos this)) 40) (= (.y (.pos this)) 34))
    (.shield this)
    (.moveXY this 40 34)))

(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (< (.distanceTo this e) 5)
      (.attack this e)
      (goback))
    (goback)))
