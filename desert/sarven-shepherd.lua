-- using "bash", "cleave"
function notYak(xs)
    local r = {}
    for i = 1, #xs do
        if xs[i].type ~= "sand-yak" then
            r[#r+1] = xs[i]
        end
    end
    return r
end

function withinDist(xs, d)
    local r = 0
    for i = 1, #xs do
        if self:distanceTo(xs[i]) <= d then
            r = r + 1
        end
    end
    return r
end

function attack(e)
    if e.health > 66 and self:isReady("bash") then
        self:bash(e)
    elseif withinDist(es, 10) > 2 and self:isReady("cleave") then
        self:cleave(e)
    else
        self:attack(e)
    end
end

loop
    es = notYak(self:findEnemies())
    local e = self:findNearest(es)
    if e then
        attack(e)
    else
        self:move({x=40, y=32})
    end
end
