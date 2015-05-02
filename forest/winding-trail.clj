(doseq [pos [[36 60] [56 19]]] (.moveXY this (first pos) (second pos)))
(.buildXY this "fire-trap" 72 27)
(doseq [pos [[37 13] [72 59] [72 63] [75 63] [75 59]]] (.moveXY this (first pos) (second pos)))
