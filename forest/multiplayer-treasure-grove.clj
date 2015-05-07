(while true
  (def is (.findItems this))
  (def e (.findNearest this (.findEnemies this)))
  (def c nil)
  (when (seq is)
    (def cv 0)
    (def i 0)
    (while (< i (count is))
      (if (> (/ (.value (nth is i)) (.distanceTo this (nth is i))) cv)
        (when true
          (def c (nth is i))
          (def cv (/ (.value (nth is i)) (.distanceTo this (nth is i))))))
      (def i (inc i))))
  (if (and c e)
    (if (<= (.distanceTo this e) 7)
      (if (.isReady this "bash")
        (.bash this e)
        (.attack this e))
      (.move this (.pos c)))
    (if c
      (.move this (.pos c))
      (if e
        (.attack this e)))))
