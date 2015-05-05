(defn attack [e]
  (if (.isReady this "power-up")
    (when true
      (.powerUp this)
      (.attack this e))
    (if (.isReady this "bash")
      (.bash this e)
      (.attack this e))))

(while true
  (def es (.findEnemies this))
  (doseq [e es]
    (if (= (.type e) "shaman")
      (while (> (.health e) 0)
        (attack e))
      (.wait this 0.1))))
