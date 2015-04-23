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
    fs = self:findFriends()
    for i = 1, #fs do
        if fs[i].type == "archer" or fs[i].type == "soldier" or fs[i].type == "griffin-rider" then
            local es = notYak(self:findEnemies())
            if fs[i].type == "griffin-rider" then
                self:command(fs[i], "defend", {x=56, y=fs[i].pos.y})
            elseif fs[i].type == "archer" then
                self:command(fs[i], "defend", {x=56, y=fs[i].pos.y})
            elseif fs[i].type == "soldier" then
                self:command(fs[i], "defend", {x=56, y=fs[i].pos.y})
            end
        end
    end
end


function notYak(xs)
    local r = {}
    for i = 1, #xs do
        if xs[i].type ~= "sand-yak" then
            r[#r+1] = xs[i]
        end
    end
    return r
end

function rightmost(xs)
    local r, rmax = xs[1], xs[1].pos.x
    for i = 2, #xs do
        if rmax < xs[i].pos.x then
            r, rmax = xs[i], xs[i].pos.x
        end
    end
    return r
end
function closestArcher()
    local xs = self:findEnemies()
    local r, dr = nil, 4e4
    for i = 1, #xs do
        if (xs[i].type == "archer" or xs[i].type == "shaman") and self:distanceTo(xs[i]) < dr then
            r = xs[i]
            dr = self:distanceTo(xs[i])
        end
    end
    return r
end

loop
    i = self:findNearest(self:findItems())
    e = self:findNearest(notYak(self:findEnemies()))
    f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif i then
        self:move({x=i.pos.x, y=i.pos.y})
    elseif e then
        local ca = closestArcher() 
        local ri = rightmost(self:findFriends())
        if ri and self.health < 50 then
            self:move({x=ri.pos.x - 15, y=self.pos.y})
        elseif ca and self.health > 200 then
            self:attack(ca)
        elseif ri.pos.x < self.pos.x then
            self:move({x=ri.pos.x - 5, y=self.pos.y})
        elseif e.health > 100 and self:isReady("bash") then
            self:bash(e)
        elseif e.health >= 100 and self:isReady("power-up") then
            self:powerUp()
            self:attack(e)
        else
            self:attack(e)
        end
    end
    summonMinion()
    commandMinions()
end
