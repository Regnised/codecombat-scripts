loop
    e = self:findNearestEnemy()
    if e then
        self:attack(e)
    else
        self:attack("Chest")
    end
end
