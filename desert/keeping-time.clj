(while (< (.now this) 30)
  (if (>= (.gold this) (.costOf this "soldier"))
    (.summon this "soldier"))
  (def e (.findNearest this (.findEnemies this)))
  (doseq [f (.findByType this "soldier")]
    (if e
      (.command this f "attack" e)
      (.command this f "move" (clj->js { :x 40, :y 50 }))))
  (if e
    (if (< (.x (.pos e)) 50)
      (if (and (> (.health e) 75) (.isReady this "bash"))
        (.bash this e)
        (.attack this e))
      (when true
        (def i (.findNearest this (.findItems this)))
        (.move this (.pos i))))
    (when true
      (def i (.findNearest this (.findItems this)))
      (.move this (.pos i)))))
(while true
  (def e (.findNearest this (.findEnemies this)))
  (doseq [f (.findByType this "soldier")]
    (if e
      (.command this f "attack" e)))
  (if e
    (if (and (> (.health e) 75) (.isReady this "bash"))
      (.bash this e)
      (.attack this e))
    (.wait this 0.1)))
