loop
    local enemy = self:findNearestEnemy()
    local distance = self:distanceTo(enemy)
    if distance < 10 then
        self:attack(enemy)
    end
    self:moveXY(40, 38)
end
