mini = 1
function summonMinion()
    if mini == 1 and self.gold >= self:costOf("soldier") then
        self:summon("soldier")
        mini = 2
    elseif mini == 2 and self.gold >= self:costOf("archer") then
        self:summon("archer")
        mini = 3
    elseif mini == 3 and self.gold > self:costOf("griffin-rider") then
        self:summon("griffin-rider")
        mini = 1
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
function commandMinions()
    local fs = self:findFriends()
    local es = self:findEnemies()
    if #es > 0 then
        for i = 1, #fs do
            if fs[i].type ~= "yeti" then
                local e = findClosest(fs[i])
                self:command(fs[i], "attack", e)
            end
        end
    else
        for i = 1, #fs do
            if self:distanceTo(fs[i]) > 8 then
                self:command(fs[i], "move", self.pos)
            end
        end
    end
end

loop
    local e = self:findNearest(self:findEnemies())
    local i = self:findNearest(self:findItems())
    if e and i then
        local di = self:distanceTo(i)
        local de = self:distanceTo(e)
        local n = self:findNearest(self:findCorpses())
        if n then
            if self:distanceTo(n) > 20 then
                n = nil
            end
        end
        if e.health > 300 and de <= 25 and self:isReady("fear") then
            self:cast("fear", e)
        elseif de < di then
            self:attack(e)
        elseif n and self:isReady("raise-dead") then
            self:cast("raise-dead")
        elseif di > 6 and self:isReady("goldstorm") then
            self:cast("goldstorm")
        else
            self:move(i.pos)
        end
    elseif i then
        self:move(i.pos)
    elseif e then
        self:attack(e)
    end
    summonMinion()
    commandMinions()
end
