(defn patrol [x y]
  (.moveXY this x y)
  (def e (.findNearest this (.findEnemies this)))
  (if e
    (while (> (.health e) 0)
       (.attack this e))))

(while true
  (patrol 35 34)
  (patrol 60 31))
