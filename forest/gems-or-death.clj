(doseq [pos [[0 18][0 12][8 12][0 12][0 18][15 40][25 15]]] (.moveXY this (first pos) (second pos)))
(.attack this (.findNearestEnemy this))
(.moveXY this 55 25)
