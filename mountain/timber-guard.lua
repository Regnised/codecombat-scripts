sol = true
function summonMinion()
    if sol and self.gold >= self:costOf("soldier") then
        self:summon("soldier")
        sol = false
    elseif self.gold >= self:costOf("archer") then
        self:summon("archer")
        sol = true
    end
end
function commandMinions()
    fs = self:findFriends()
    for i = 1, #fs do
        if fs[i].type == "archer" or fs[i].type == "soldier" then
            local es = self:findEnemies()
            if #es > 0 then
                self:command(fs[i], "attack", es[1])
            elseif fs[i].type == "archer" then
                self:command(fs[i], "move", {x=60, y=fs[i].pos.y})
            elseif fs[i].type == "soldier" then
                self:command(fs[i], "move", {x=65, y=fs[i].pos.y})
            end
        end
    end
end

function inView(xs)
    r = {}
    for i = 1, #xs do
        if xs[i].pos.y <= 55 and xs[i].pos.y > 28 then
            r[#r + 1] = xs[i]
        end
    end
    return r
end

loop
    i = self:findNearest(inView(self:findItems()))
    if i then
        self:move(i.pos)
    else
        self:move({x=23, y=42})
    end
    summonMinion()
    commandMinions()
end
