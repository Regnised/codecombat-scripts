loop
    local e = self:findNearestEnemy()
    if e then
        self:attack(e)
    end
end
