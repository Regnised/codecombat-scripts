local points = {}
points[1] = {x=13, y=73}
points[2] = {x=51, y=73}
points[3] = {x=51, y=53}
points[4] = {x=90, y=52}

while self.gold < 4 * self:costOf("soldier") do
    local i = self:findNearest(self:findItems())
    self:move(i.pos)
end
self:summon("soldier")
self:summon("soldier")
self:summon("soldier")
self:summon("soldier")
fs = self:findByType("soldier")
for i = 1, 4 do
    self:command(fs[i], "move", points[i])
end
