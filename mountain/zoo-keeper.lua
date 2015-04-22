local points = {}
points[1] = {x=33, y=42}
points[2] = {x=47, y=42}
points[3] = {x=33, y=26}
points[4] = {x=47, y=26}

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

while self.gold < 4 * self:costOf("soldier") do
    local i = self:findNearest(self:findItems())
    self:move(i.pos)
end
for i=1,4 do
    self:summon("soldier")
end

loop
    local friends = self:findFriends()
    for j=1,#friends do
        local point = points[j]
        local friend = friends[j]
        local enemy = findClosest(friend)
        if enemy then
            if enemy.team == "ogres" and friend:distanceTo(enemy) < 5 then
                self:command(friend, "attack", enemy)
            else
                self:command(friend, "move", point)
            end
        else
            self:command(friend, "move", point)
        end
    end
end
