(defn attack []
  (.moveRight this)
  (def e (.findNearestEnemy this))
  (.attack this e)
  (.attack this e)
  (.moveRight this))

(attack)
(attack)
