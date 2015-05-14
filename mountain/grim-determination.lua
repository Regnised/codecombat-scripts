function summonMinions()
    if self.gold >= self:costOf("griffin-rider") then
        self:summon("griffin-rider")
    end
end

function lowestHealthPaladin()
    local l, lowestHealth = nil, 9e9
    for i = 1, #fs do
        if fs[i].type == "paladin" and fs[i].health < lowestHealth and fs[i].health > 0 and fs[i].health < fs[i].maxHealth then
            l, lowestHealth = fs[i], fs[i].health
        end
    end
    return l
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
    for i = 1, #fs do
        if fs[i].type == "peasant" then
            local b = bestCoin(is, fs[i])
            if b then
                self:command(fs[i], "move", b.pos)
                is = remo(is, b)
            end
        elseif fs[i].type == "griffin-rider" then
            local e = findClosest(es, fs[i])
            if e then
                self:command(fs[i], "attack", e)
            end
        elseif fs[i].type == "paladin" then
            local l = lowestHealthPaladin()
            if fs[i].pos.x < 69 then
                self:command(fs[i], "move", {x=75, y=40})
            elseif l and fs[i]:canCast("heal") then
                self:command(fs[i], "cast", "heal", l)
            else
                self:command(fs[i], "shield")
            end
        end
    end
end

loop
    summonMinions()
    is = self:findItems()
    es = self:findEnemies()
    fs = self:findFriends()
    commandMinions()
end
