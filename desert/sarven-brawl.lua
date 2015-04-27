-- level 2
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
    if #es > 0 then
        for i = 1, #fs do
            local e = findClosest(fs[i])
            if self:distanceTo(fs[i]) < 15 then
                self:command(fs[i], "attack", e)
            else
                self:command(fs[i], "move", self.pos)
            end
        end
    else
        for i = 1, #fs do
            if self:distanceTo(fs[i]) > 8 then
                self:command(fs[i], "move", self.pos)
            end
        end
    end
end


function notYak(xs)
    local r = {}
    for i = 1, #xs do
        if xs[i].type ~= "sand-yak" then
            r[#r+1] = xs[i]
        end
    end
    return r
end

loop
    local i = self:findNearest(self:findItems())
    summonMinion()
    es = notYak(self:findEnemies())
    commandMinions()
    local e = self:findNearest(es)
    local f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif i then
        self:move(i.pos)
    elseif e then
        local d = self:distanceTo(e)
        if d > 10 then
            if e.health >= 150 and not self:hasEffect("power-up") and self:isReady("power-up") then
                self:powerUp()
            else
                self:move(e.pos)
            end
        elseif e.health > 100 and self:isReady("bash") then
            self:bash(e)
        else
            self:attack(e)
        end
    end
end
