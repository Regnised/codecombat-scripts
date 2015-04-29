-- using "bash", "move"
function chooseStrategy()
    local e = self:findNearest(es)
    if self:now() > 55 then
        return "run-away"
    elseif e then
        if e.pos.x < 38 then
            return "fight-back"
        else
            return "collect-coins"
        end
    else
        return "collect-coins"
    end
end

function distance2(a, b)
    local x, y = a.pos.x - b.pos.x, a.pos.y - b.pos.y
    return x*x + y*y
end
function findClosestR(t)
    local d, dmin = nil, 4e4
    for i = 1, #es do
        local dis = distance2(es[i], t)
        if dis < dmin and es[i].pos.x > 55 then
            d, dmin = es[i], dis
        end
    end
    return d
end
function commandAttack()
    local fs = self:findFriends()
    for i = 1, #fs do
        local e = findClosestR(fs[i])
        if e then
            self:command(fs[i], "attack", e)
        else
            self:command(fs[i], "move", {x=57, y=fs[i].pos.x})
        end
    end
end

function bestCoin(xs)
    local r, maxR = nil, 0
    for i = 1, #xs do
        local v = xs[i].value/self:distanceTo(xs[i])
        if v > maxR then
            r, maxR = xs[i], v
        end
    end
    return r
end
function pickUpCoin()
    local c = bestCoin(self:findItems())
    self:move(c.pos)
end

function heroAttack()
    local e = self:findNearest(es)
    local d = self:distanceTo(e)
    if d > 7 then
        self:move(e.pos)
    elseif self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

loop
    if self.gold >= self:costOf("griffin-rider") then
        self:summon("griffin-rider")
    end
    es = self:findEnemies()
    commandAttack()
    local strategy = chooseStrategy()
    if strategy == "fight-back" then
        heroAttack()
    elseif strategy == "run-away" then
        self:move({x=9, y=11})
    else
        pickUpCoin()
    end
end
