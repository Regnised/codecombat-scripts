loop
    e = self:findNearestEnemy()
    if e then
        d = self:distanceTo(e)
        if d < 5 and self:isReady("cleave") then
            self:cleave(e)
        else
            self:attack("Chest")
        end
    else
        self:attack("Chest")
    end
end
