-- using Long Sword, The Monolith
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
    local fs = minions(self:findFriends())
    local es = notYak(self:findEnemies())
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
    d = self:distanceTo(e)
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
    e = self:findNearest(self:findEnemies())
    i = self:findNearest(self:findItems())
    if e and i then
        de = self:distanceTo(e)
        di = self:distanceTo(i)
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
    summonMinion()
    commandMinions()
end
