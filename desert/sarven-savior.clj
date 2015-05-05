(def friendNames ["Joan" "Ronan" "Nikita" "Augustus"])
(doseq [friend friendNames]
  (.say this (apply str [friend ", go home!"])))
(.moveXY this 30 30)
(.buildXY this "fence" 34 30)
(.moveXY this 20 35)
