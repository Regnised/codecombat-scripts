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

function pickUpCoin()
    local i = self:findNearest(self:findItems())
    local e = self:findNearest(self:findEnemies())
    if e and i then
        local di, de = self:distanceTo(i), self:distanceTo(e)
        if de < di and de <= 7 then
            if self:isReady("bash") then
                self:bash(e)
            else
                self:attack(e)
            end
        else
            self:move(i.pos)
        end
    elseif e then
        self:attack(e)
    elseif i then
        self:move(i.pos)
    end
end

function commandS(f)
    local es = self:findEnemies()
    if #es > 0 then
        local e = findClosest(f)
        if e.pos.x < 55 then
            self:command(f, "attack", e)
        else
            self:command(f, "move", {x=42, y=f.pos.y})
        end
    else
        if f.pos.x ~= 42 then
            self:command(f, "move", {x=42, y=f.pos.y})
        end
    end
end
function commandA(f)
    local es = self:findEnemies()
    if #es > 0 then
        local e = findClosest(f)
        if e.pos.x < 60 then
            self:command(f, "attack", e)
        else
            self:command(f, "move", {x=25, y=f.pos.y})
        end
    else
        if f.pos.x ~= 25 then
            self:command(f, "move", {x=25, y=f.pos.y})
        end
    end
end

loop
    pickUpCoin()
    summonMinion()
    local fs = self:findFriends()
    for i = 1, #fs do
        if fs[i].type == "soldier" then
            commandS(fs[i])
        elseif fs[i].type == "archer" then
            commandA(fs[i])
        end
    end
end
