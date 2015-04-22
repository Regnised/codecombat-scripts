-- level 3
-- using "bash", "move", "power-up"
function attack(e)
    local d = self:distanceTo(e)
    if d > 8 then
        if e.health > 100 and not self:hasEffect("power-up") and self:isReady("power-up") then
            self:powerUp()
        else
            self:move(e.pos)
        end
    elseif e.health >= 100 and self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

loop
    f = self:findFlag()
    e = self:findNearest(self:findEnemies())
    i = self:findNearest(self:findItems())
    if f then
        self:pickUpFlag(f)
    elseif e and i then
        d = self:distanceTo(e)
        if d < self:distanceTo(i) and d < 8 then
            attack(e)
        else
            self:move(i.pos)
        end
    elseif i then
        self:move(i.pos)
    elseif e then
        attack(e)
    end
end
