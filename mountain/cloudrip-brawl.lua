-- level 1
-- using "bash", "move", "power-up"
sol = true
function summonMinion()
    if sol and self.gold >= self:costOf("soldier") then
        self:summon("soldier")
        sol = false
    elseif self.gold >= self:costOf("archer") then
        self:summon("archer")
        sol = true
    end
end
function distance2(a, b)
    local x, y = a.pos.x - b.pos.x, a.pos.y - b.pos.y
    return x*x + y*y
end
function findClosest(t)
    local es = self:findEnemies()
    if #es == 0 then return nil end
    local d, dmin = es[1], distance2(es[1], t)
    for i = 2, #es do
        local dis = distance2(es[i], t)
        if dis < dmin then
            d, dmin = es[i], dis
        end
    end
    return d
end
function commandMinions()
    local fs = self:findFriends()
    local es = self:findEnemies()
    if #es > 0 then
        for i = 1, #fs do
            local e = findClosest(fs[i])
            self:command(fs[i], "attack", e)
        end
    else
        for i = 1, #fs do
            if self:distanceTo(fs[i]) > 8 then
                self:command(fs[i], "move", self.pos)
            end
        end
    end
end

function attack(e)
    d = self:distanceTo(e)
    if d > 8 then
        self:move(e.pos)
    elseif e.health > 200 and self:isReady("bash") then
        self:bash(e)
    elseif e.health >= 100 and self:isReady("power-up") then
        self:powerUp()
        self:attack(e)
    else
        self:attack(e)
    end
end

loop
    i = self:findNearest(self:findItems())
    e = self:findNearest(self:findEnemies())
    f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif i and e then
        if self:distanceTo(e) < self:distanceTo(i) then
            attack(e)
        else
            self:move(i.pos)
        end
    elseif i then
        self:move(i.pos)
    elseif e then
        attack(e)
    end
    summonMinion()
    commandMinions()
end
