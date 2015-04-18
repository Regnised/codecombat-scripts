loop
    self:moveXY(43, 50)
    local e = self:findNearestEnemy()
    if e then
        self:buildXY("fire-trap", 43, 50)
    end

    self:moveXY(25, 34)
    e = self:findNearestEnemy()
    if e then
        self:buildXY("fire-trap", 25, 34)
    end

    self:moveXY(43, 20)
    e = self:findNearestEnemy()
    if e then
        self:buildXY("fire-trap", 43, 20)
    end
end
