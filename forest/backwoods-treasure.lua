-- level 2
-- boss star not allowed
-- using Great Sword, Steel Striker
function fight(e)
    if e.health >= 200 and self:isReady("power-up") then
        self:powerUp()
        self:attack(e)
    elseif e.health > 60 and self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

self:moveXY(26, 34)
--self:moveXY(40, 28)

loop
    f = self:findFlag()
    e = self:findNearest(self:findEnemies())
    i = self:findNearest(self:findItems())
    if f then
        self:moveXY(f.pos.x, f.pos.y)
        self:pickUpFlag(f)
    elseif e and i then
        de = self:distanceTo(e)
        di = self:distanceTo(i)
        if de < di*2 then
            fight(e)
        else
            self:moveXY(i.pos.x, i.pos.y)
        end
    elseif e then
        fight(e)
    elseif i then
        self:moveXY(i.pos.x, i.pos.y)
    end
end
