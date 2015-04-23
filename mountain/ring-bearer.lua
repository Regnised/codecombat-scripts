mathpi = 3.1415927

local peasant = self:findByType("peasant")[1]
function summonSoldier()
    if self.gold >= self:costOf("soldier") then
        self:summon("soldier")
    end
end
function commandSoldiers()
    local f = self:findByType("soldier")
    for i = 1, #f do
        local o = findSoldierOffset(f, i)
        self:command(f[i], "move", {x=peasant.pos.x + o['x'], y=peasant.pos.y + o['y']})
    end
end
function findSoldierOffset(xs, i)
    return radial2cart(5, i*360/#xs)
end

function radial2cart(r, degr)
    local radi = mathpi * degr / 180
    return {x=r * math.cos(radi), y=r * math.sin(radi)} 
end

loop
    self:move({x=peasant.pos.x - 2, y=peasant.pos.y})
    summonSoldier()
    commandSoldiers()
end
