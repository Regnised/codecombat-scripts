-- using "bash", "cleave"
local ordersGiven = 0
while ordersGiven < 5 do
    self:moveXY(self.pos.x, self.pos.y - 9)
    self:say("Attack!")
    ordersGiven = ordersGiven + 1
end

function attack(e)
    local d = self:distanceTo(e)
    if e.health > 200 and self:isReady("bash") then
        self:bash(e)
    elseif d < 10 and self:isReady("cleave") then
        self:cleave(e)
    else
        self:attack(e)
    end
end

self:moveXY(38, 26)
loop
    e = self:findNearest(self:findEnemies())
    if e then
        attack(e)
    end
end
