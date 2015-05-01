(dotimes [n 3]
  (.buildXY this "fence" 36 (- 36 (* 4 n))))
(dotimes [_ 42]
  (.moveRight this))
