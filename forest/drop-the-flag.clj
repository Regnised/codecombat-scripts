(while true
  (def flag (.findFlag this))
  (if flag
    (when true
      (.pickUpFlag this flag)
      (.buildXY this "fire-trap" (.x (.pos flag)) (.y (.pos flag))))
    (when true
      (def item (.findNearest this (.findItems this)))
      (if item
        (.move this (.pos item))
        (.move this (clj->js { :x 20, :y 32 }))))))
