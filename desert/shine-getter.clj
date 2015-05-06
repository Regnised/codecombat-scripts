(while true
  (def is (.findItems this))
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
  (if c
    (.move this (.pos c))
    (.wait this 0.1)))
