(while true
  (def e (.findNearestEnemy this))
  (if e
    (if (= (.type e) "burl")
      (.say this "I'm not attacking that Burl!")
      (if (= (.type e) "ogre")
        (.moveXY this 21 39)
        (.attack this e)))
    (.wait this 0.1)))
