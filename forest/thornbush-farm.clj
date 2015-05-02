(defn patrol [x y]
  (.moveXY this x y)
  (def e (.findNearest this (.findEnemies this)))
  (if e
    (if (= (.type e) "ogre")
      (.buildXY this "fire-trap" x y))))

(while true
  (patrol 43 50)
  (patrol 25 34)
  (patrol 43 20))
