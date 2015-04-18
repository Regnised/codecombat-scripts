loop
    local e = self:findNearestEnemy()
    local f = self:findFlag()
    if f then
        self:pickUpFlag(f)
        e = self:findNearestEnemy()
        if e then
            self:attack(e)
        end
    elseif e then
        if self:isReady("cleave") then
            self:cleave(e)
        else
            self:attack(e)
        end
    end
end
