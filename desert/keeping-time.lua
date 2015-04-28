-- using "bash", "cleave"
phase = 1

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
    local fs = minions(self:findFriends())
    if #es > 0 then
        for i = 1, #fs do
            local e = findClosest(fs[i])
            if phase == 1 and e.pos.x > 50 then
                self:command(fs[i], "move", {x=35, y=fs[i].pos.y})
            else
                self:command(fs[i], "attack", e)
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

function minions(xs)
    local r = {}
    for i = 1, #xs do
        if xs[i].type == "soldier" or xs[i].type == "archer" then
            r[#r+1] = xs[i]
        end
    end
    return r
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

function attack(e)
    local d = self:distanceTo(e)
    if e.health > 100 and self:isReady("bash") then
        self:bash(e)
    elseif d < 10 and self:isReady("cleave") then
        self:cleave(e)
    else
        self:attack(e)
    end
end

loop
    if phase == 1 and self:now() > 30 then
        phase = 2
    end
    summonMinion()
    es = notYak(self:findEnemies())
    commandMinions()
    local e = self:findNearest(es)
    local i = self:findNearest(self:findItems())
    if e and i then
        local de = self:distanceTo(e)
        local di = self:distanceTo(i)
        if de < di or phase == 2 then
            attack(e)
        else
            self:move(i.pos)
        end
    elseif e then
        attack(e)
    elseif i then
        self:move(i.pos)
    end
end
