-- level 3
function summonSoldier()
    if self.gold > self:costOf("soldier") then
        self:summon("soldier")
    end
end
function distance2(x, y, e)
    local dx, dy = e.pos.x - x, e.pos.y - y
    return dx*dx+dy*dy
end
function findNearestEnemy(x, y)
    local xs = self:findEnemies()
    if #xs > 0 then
        local e, minDist = xs[1], distance2(x, y, xs[1])
        for i = 1, #xs do
            local d = distance2(x, y, xs[i])
            if d < minDist then
                e, minDist = xs[i], d
            end
        end
        return e
    else
        return nil
    end
end
function commandSoldiers()
    local xs = self:findFriends()
    for i = 1, #xs do
        local e = findNearestEnemy((xs[i].pos.x + self.pos.x)/2,
                                   (xs[i].pos.y + self.pos.x)/2)
        if e then
            self:command(xs[i], "attack", e)
        end
    end
end

loop
    e = self:findNearest(self:findEnemies())
    i = self:findNearest(self:findItems())
    f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif i and self.health < self.maxHealth/2 then
        self:moveXY(i.pos.x, i.pos.y)
    elseif e then
        --d = self:distanceTo(e)
        if e.health > 60 and self:isReady("bash") then
            self:bash(e)
        else
            self:attack(e)
        end
    elseif self:isReady("power-up") then
        self:powerUp()
    end
    summonSoldier()
    commandSoldiers()
end

