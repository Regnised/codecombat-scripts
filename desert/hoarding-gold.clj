(def totalGold 0)
(while (< totalGold 25)
  (def coin (.findNearest this (.findItems this)))
  (if coin
    (when true
      (def totalGold (+ totalGold (.value coin)))
      (.moveXY this (.x (.pos coin)) (.y (.pos coin))))
    (.wait this 0.1)))
(.moveXY this 38 34)
(.say this "Done collecting gold!")
(.moveXY this 59 33)
(.say this totalGold)
