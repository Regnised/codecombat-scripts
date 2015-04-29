-- using "bash", "move", "power-up"
function notYak(xs)
    local r = {}
    for i = 1, #xs do
        if xs[i].type ~= "sand-yak" then
            r[#r+1] = xs[i]
        end
    end
    return r
end

mini = 1
function summonMinion()
    if mini == 1 and self.gold >= self:costOf("soldier") then
        self:summon("soldier")
        mini = 2
    elseif mini == 2 and self.gold >= self:costOf("archer") then
        self:summon("archer")
        mini = 3
    elseif mini == 3 and self.gold > self:costOf("griffin-rider") then
        self:summon("griffin-rider")
        mini = 1
    end
end
function distance2(a, b)
    local x, y = a.pos.x - b.pos.x, a.pos.y - b.pos.y
    return x*x + y*y
end
function findClosest(t)
    local d, dmin = nil, 4e4
    for i = 1, #es do
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
    local d = self:distanceTo(e)
    if d > 10 then
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
function bestEnemy(xs)
    local e, de = nil, 4e4
    for i = 1, #xs do
        local d = 4e4
        if xs[i].type == "soldier" then
            d = 3 * self:distanceTo(xs[i])
        elseif xs[i].type == "archer" or xs[i].type == "griffin-rider" then
            d = self:distanceTo(xs[i]) / 5
        else
            if self:isReady("bash") then
                d = self:distanceTo(xs[i]) / 2
            else
                d = 3 * self:distanceTo(xs[i])
            end
        end
        if d < de then
            e, de = xs[i], d
        end
    end
    return e
end

loop
    local i = self:findNearest(self:findItems())
    summonMinion()
    es = notYak(self:findEnemies())
    commandMinions()
    local e = bestEnemy(es)
    local f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif i then
        self:move(i.pos)
    elseif e then
        attack(e)
    end
end
