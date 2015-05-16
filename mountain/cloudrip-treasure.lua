-- level 1
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
function findClosest(xs, t)
    local d, dmin = nil, 4e4
    for i = 1, #xs do
        local dis = distance2(xs[i], t)
        if dis < dmin then
            d, dmin = xs[i], dis
        end
    end
    return d
end
function bestCoin(xs, t)
    local r, maxR = nil, 0
    for i = 1, #xs do
        local v = xs[i].value/t:distanceTo(xs[i])
        if v > maxR then
            r, maxR = xs[i], v
        end
    end
    return r
end
function remo(xs, b)
    local r = {}
    for i = 1, #xs do
        if xs[i].pos.x ~= b.pos.x or xs[i].pos.y ~= b.pos.y then
            r[#r+1] = xs[i]
        end
    end
    return r
end
function commandMinions()
    local fs = self:findFriends()
    if #es > 0 then
        for i = 1, #fs do
            if fs[i].type ~= "peasant" then
                local e = findClosest(es, fs[i])
                self:command(fs[i], "attack", e)
            else
                local b = bestCoin(is, fs[i])
                if b then
                    self:command(fs[i], "move", b.pos)
                    is = remo(is, b)
                end
            end
        end
    else
        for i = 1, #fs do
            if fs[i].type ~= "peasant" and self:distanceTo(fs[i]) > 8 then
                self:command(fs[i], "move", self.pos)
            else
                local b = findClosest(is, fs[i])
                if b then
                    self:command(fs[i], "move", b.pos)
                    is = remo(is, b)
                end
            end
        end
    end
end

function attack(e)
    local d = self:distanceTo(e)
    if d > 7 then
        self:move(e.pos)
    elseif e.health > 200 and self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

loop
    if self:now() > 10 then
        summonMinion()
    end
    is = self:findItems()
    es = self:findEnemies()
    commandMinions()
    local e = self:findNearest(es)
    if e then
        attack(e)
    else
        self:move({x=78, y=60})
    end
end
