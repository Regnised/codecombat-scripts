loop
    local flag = self:findFlag()
    local enemy = self:findNearestEnemy()
    local item = self:findNearestItem()
    if flag then
        self:pickUpFlag(flag)
    elseif enemy then
        d = self:distanceTo(enemy)
        if d < 10 and self:isReady("cleave") then
            self:cleave(enemy)
        else
            self:attack(enemy)
        end
    elseif item then
        self:moveXY(item.pos.x, item.pos.y)
    end
end
