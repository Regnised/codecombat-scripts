loop
    local yak = self:findNearestEnemy()
    if yak then
        if self:distanceTo(yak) < 10 then
            self:moveXY(yak.pos.x + 10, self.pos.y)
        end
    end
end
