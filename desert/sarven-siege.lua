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
function battlePos(y)
    return 25 + 5 * (y % 12)
end
function commandMinions()
    fs = self:findFriends()
    for i = 1, #fs do
        if fs[i].type == "archer" or fs[i].type == "soldier" then
            local es = self:findEnemies()
            if #es > 0 then
                local e = findClosest(fs[i])
                if e.pos.x < 60 then
                    if fs[i].type == "archer" then
                        self:command(fs[i], "move", {x=74, y=battlePos(i)})
                    elseif fs[i].type == "soldier" then
                        self:command(fs[i], "move", {x=70, y=battlePos(i)})
                    end
                else
                    self:command(fs[i], "attack", findClosest(fs[i]))
                end
            elseif fs[i].type == "archer" then
                self:command(fs[i], "move", {x=74, y=battlePos(i)})
            elseif fs[i].type == "soldier" then
                self:command(fs[i], "move", {x=70, y=battlePos(i)})
            end
        end
    end
end
loop
    i = self:findNearest(self:findItems())
    e = self:findNearest(self:findEnemies())
    if e and i then
        di, de = self:distanceTo(i), self:distanceTo(e)
        if de < di then
            self:attack(e)
        else
            self:move(i.pos)
        end
    elseif e then
        self:attack(e)
    elseif i then
        self:move(i.pos)
    else
        self:move({x=23, y=42})
    end
    summonMinion()
    commandMinions()
end
