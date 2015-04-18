loop
    enemy = self:findNearestEnemy()
    if enemy then
        self:attack(enemy)
    else
        self:moveXY(40, 34)
    end
end
