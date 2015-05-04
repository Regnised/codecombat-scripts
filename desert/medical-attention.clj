(while true
  (def e (.findNearest this (.findEnemies this)))
  (if e
    (if (and (> (.health e) 78) (.isReady this "bash"))
      (.bash this e)
      (.attack this e))
    (if (< (.health this) (.maxHealth this))
      (when true
        (.move this (clj->js { :x 65, :y 46 }))
        (if (and (= (.x (.pos this)) 65) (= (.y (.pos this)) 46))
          (.say this "heal me")))
      (.move this (clj->js { :x 51, :y 38 })))))
