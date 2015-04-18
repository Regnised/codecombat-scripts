loop
    e = self:findNearestEnemy()
    if self:isReady("cleave") then
        self:cleave(e)
    else
        self:shield()
    end
end
