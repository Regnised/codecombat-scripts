(while true
  (let [yak (.findNearestEnemy this)]
    (if yak
        (if (> (.y (.pos yak)) (.y (.pos this)))
          (.buildXY this "fence" (.x (.pos yak)) 35)
          (.buildXY this "fence" (.x (.pos yak)) 25))
        (.move this (clj->js { :x 68, :y 30 })))))
