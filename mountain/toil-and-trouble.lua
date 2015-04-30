function distance2(a, b)
    local x, y = a.pos.x - b.pos.x, a.pos.y - b.pos.y
    return x*x + y*y
end
function findClosest(t)
    local d, dmin = nil, 4e4
    for i = 1, #es do
        local dis = distance2(es[i], t)
        if dis < dmin then
            d, dmin = es[i], dis
        end
    end
    return d
end
function findClosestArcher(t)
    local d, dmin = nil, 4e4
    for i = 1, #es do
        if es[i].type ~= "witch" then
            local dis = distance2(es[i], t)
            if dis < dmin then
                d, dmin = es[i], dis
            end
        end
    end
    return d
end
function commandMinions()
    local fs = self:findFriends()
    if #es > 0 then
        for i = 1, #fs do
            local e = nil
            if fs[i].type == "soldier" then
                e = findClosest(fs[i])
            else
                e = findClosestArcher(fs[i]) or findClosest(fs[i])
            end
            self:command(fs[i], "attack", e)
        end
    end
end

loop
    es = self:findEnemies()
    commandMinions()
end
