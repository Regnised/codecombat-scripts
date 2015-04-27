-- using "bash", "cleave"

-- If the peasant is damaged, the flowers will shrink!
local p = self:findByType("peasant")[1]

function summonSoldiers()
    if self.gold >= self:costOf("soldier") then
        self:summon("soldier")
    end
end
function distance2(a, b)
    local x, y = a.pos.x - b.pos.x, a.pos.y - b.pos.y
    return x*x + y*y
end
function findClosest(t)
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
function commandSoldiers()
    local fs = self:findByType("soldier")
    if #es > 0 then
        for i = 1, #fs do
            self:command(fs[i], "attack", findClosest(fs[i]))
        end
    end
end

function pickUpNearestCoin()
    local i = self:findNearest(self:findItems())
    local e = self:findNearest(es)
    if e and i then
        if self:distanceTo(e) < self:distanceTo(i) then
            if self:isReady("bash") then
                self:bash(e)
            elseif self:isReady("cleave") then
                self:cleave(e)
            else
                self:move(i.pos)
            end
        else
            self:move(i.pos)
        end
    elseif i then
        self:move(i.pos)
    end
end

loop
    summonSoldiers()
    es = self:findEnemies()
    commandSoldiers()
    pickUpNearestCoin()
end
