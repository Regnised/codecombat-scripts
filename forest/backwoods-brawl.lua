-- level 3
-- using "bash", "move"
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
            self:command(fs[i], "attack", findClosest(fs[i]))
        end
    else
        for i = 1, #fs do
            if self:distanceTo(fs[i]) > 8 then
                self:command(fs[i], "move", self.pos)
            end
        end
    end
end

function withinDist(xs, d)
    local r = 0
    for i = 1, #xs do
        if self:distanceTo(xs[i]) <= d then
            r = r + 1
        end
    end
    return r
end

function attack(e)
    local es = self:findEnemies()
    local d = self:distanceTo(e)
    if d > 7 then
        self:move(e.pos)
    elseif e.health > 66 and self:isReady("bash") then
        self:bash(e)
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
    elseif i and self.health < self.maxHealth/3 then
        self:move(i.pos)
    elseif e then
        attack(e)
    end
    summonMinion()
    commandMinions()
end
