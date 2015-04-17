-- level 1
-- using Long Sword
loop
    e = self:findNearestEnemy()
    i = self:findNearestItem()
    if i then
        self:moveXY(i.pos.x, i.pos.y)
    elseif e then
        if self:isReady("cleave") then
            self:cleave(e)
        else
            self:attack(e)
        end
    end
end
