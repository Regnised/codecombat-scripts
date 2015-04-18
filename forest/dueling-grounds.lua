-- using Long Sword
loop
    e = self:findNearestEnemy()
    if e then
        if self:isReady("cleave") then
            self:cleave(e)
        else
            self:attack(e)
        end
    end
end
