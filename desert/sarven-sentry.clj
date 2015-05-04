(while true
  (let [flagGreen (.findFlag this "green")
        flagBlack (.findFlag this "black")
        flagViolet (.findFlag this "violet")]
    (if flagGreen
      (when true
        (.pickUpFlag this flagGreen)
        (.buildXY this "fence" (.x (.pos flagGreen)) (.y (.pos flagGreen))))
      (if flagBlack
        (when true
          (.pickUpFlag this flagBlack)
          (.buildXY this "fire-trap" (.x (.pos flagBlack)) (.y (.pos flagBlack))))
        (if flagViolet
          (.pickUpFlag this flagViolet)
          (.wait this 0.1))))))
