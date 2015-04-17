loop
    @moveRight()
    @moveUp()
    e = @findNearestEnemy()
    @attack e
    @attack e
    @moveRight()
    @moveDown(2)
    @moveUp()
