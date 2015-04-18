loop
    local enemy = self:findNearestEnemy()
    if enemy then
        d = self:distanceTo(enemy)
        if d < 5 then
            if self:isReady("cleave") then
                self:cleave(enemy)
            else
                self:attack(enemy)
            end
        else
            self:shield()
        end
    end
end
