loop
    local yak = self:findNearestEnemy()
    if yak then
        if self:distanceTo(yak) < 10 then
            self:moveXY(self.pos.x - 10, self.pos.y)
        else
            self:moveXY(self.pos.x + 10, self.pos.y)
        end
    else
        self:moveXY(self.pos.x + 10, self.pos.y)
    end
end
