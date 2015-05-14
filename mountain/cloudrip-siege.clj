(def t 0)
(def towers [[68 41][50 41][77 41][32 41][23 41]])

(defn dist2 [xs ys]
  (def x (- (.x xs) (first ys)))
  (def y (- (.y xs) (second ys)))
  (+ (* x x) (* y y)))

(while true
  (def e (.findNearest this (.findEnemies this)))
  (if e
    (if (and (< (.distanceTo this e) 10) (.isReady this "bash"))
        (.bash this e)))
  (if (>= (.gold this) (.costOf this "arrow-tower"))
    (when true
      (def nt (nth towers t))
      (if (> (dist2 (.pos this) nt) 100)
        (.move this (clj->js { :x (first nt), :y (second nt) }))
        (when true
          (.buildXY this "arrow-tower" (first nt) (second nt))
          (def t (mod (inc t) (count towers))))))
    (when true
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
        (.wait this 0.01)))))
