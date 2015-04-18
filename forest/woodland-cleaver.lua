self:moveXY(23, 23)
loop
    local enemy = self:findNearestEnemy()
    if self:isReady("cleave") then
        self:cleave(enemy)
    else
        self:attack(enemy)
    end
end
