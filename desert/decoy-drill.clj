(def decoysBuilt 0)
(while (< decoysBuilt 4)
  (def coin (.findNearest this (.findItems this)))
  (if coin
    (.move this (.pos coin))
    (.wait this 0.1))
  (if (>= (.gold this) (.costOf this "decoy"))
    (when true
      (.buildXY this "decoy" (.x (.pos this)) (.y (.pos this)))
      (def decoysBuilt (inc decoysBuilt)))))
(.say this "Done building decoys!")
(.moveXY this 14 36)
(.say this decoysBuilt)
