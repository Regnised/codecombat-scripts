-- using "bash", "cleave"
loop
    if 3 * self.health < self.maxHealth then
        self:moveXY(65, 46)
    else
        local e = self:findNearestEnemy()
        if e then
            local d = self:distanceTo(e)
            if e.health > 66 and self:isReady("bash") then
                self:bash(e)
            elseif d < 10 and d > 3 and self:isReady("cleave") then
                self:cleave(e)
            else
                self:attack(e)
            end
        end
    end
end
