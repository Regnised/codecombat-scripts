loop
    local e = self:findNearest(self:findEnemies())
    if e then
        if self:distanceTo(e) < 5 and self:isReady("bash") then
            self:bash(e)
        elseif self.pos.x == 40 and self.pos.y == 34 then
            self:shield()
        else
            self:move({x=40, y=34})
        end
    end
    if self.gold >= self:costOf("arrow-tower") then
        self:buildXY("arrow-tower", 34, 34)
    end
end
