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
        elseif de < 15 then
            self:move(e.pos)
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
    self:command(f, "defend", {x=41, y=39})
end
function commandA(f)
    self:command(f, "defend", {x=37, y=30})
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
