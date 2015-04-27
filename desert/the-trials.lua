function attack(e)
    if e.health > 78 and self:isReady("bash") then
        self:bash(e)
    elseif e.health >= 200 and self:isReady("power-up") then
        self:powerUp()
        self:attack(e)
    else
        self:attack(e)
    end
end

function finishthem()
    local g = false
    while #self:findEnemies() > 0 do
        e = self:findNearest(self:findEnemies())
        if e.type == "oasis-guardian" then
            g = true
        end
        while e.health > 0 do
            attack(e)
        end
    end
    return g
end
function collectStuff()
    loop
        i = self:findNearest(self:findItems())
        if not i then break end
        self:move(i.pos)
    end
end
function relocateTo(x, y)
    while self.pos.x ~= x and self.pos.y ~= y do
        self:move({x=x, y=y})
        _ = finishthem()
    end
end
function doTrial(pos)
    loop
        self:move(pos)
        local g = finishthem()
        if g then break end
    end
end

relocateTo(113, 22)
collectStuff()
doTrial({x=113, y=22})
relocateTo(15, 112)
collectStuff()
doTrial({x=15, y=112})
relocateTo(102, 124)
for i = 1, 4 do
    self:summon("griffin-rider")
end
fs = self:findByType("griffin-rider")
for i = 1, #fs do
    self:command(fs[i], "defend", {x=99, y=123})
end
collectStuff()
doTrial({x=102, y=124})
for i = 1, #fs do
    self:command(fs[i], "defend", {x=123, y=61})
end
relocateTo(70, 72)
doTrial({x=70, y=72})
