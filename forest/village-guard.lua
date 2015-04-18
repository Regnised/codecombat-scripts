function patrol(x, y)
    self:moveXY(x, y)
    local e = self:findNearest(self:findEnemies())
    if e then
        while e.health > 0 do
            self:attack(e)
        end
    end
end

loop
    patrol(35, 34)
    patrol(60, 31)
end
