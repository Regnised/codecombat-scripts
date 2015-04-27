-- using "bash", "cleave"
function countWithin(xs, d)
    local r = 0
    for i = 1, #xs do
        if self:distanceTo(xs[i]) <= d then
            r = r + 1
        end
    end
    return r
end

loop
    if countWithin(self:findEnemies(), 10) >= 10 then
        break
    end
    self:shield()
end

self:cleave(self:findNearest(self:findEnemies()))
self:moveXY(79, 33)
