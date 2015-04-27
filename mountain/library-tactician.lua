mathpi = 3.1415927

local l = self:findByType("librarian")[1]
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
function commandSoldiers(xs)
    for i = 1, #xs do
        local angle = mathpi * 2 * i / #xs
        local defPos = {x=l.pos.x+10 * math.cos(angle), y=l.pos.y+10 * math.sin(angle)}
        self:command(xs[i], "defend", defPos)
    end
end
function mostHealthyEnemy()
    local m, mh = nil, 15 -- at least more than 15
    for i = 1, #es do
        if es[i].health > mh then
            m, mh = es[i], es[i].health
        end
    end
    return m
end
function commandArchers(xs)
    for i = 1, #xs do
        if archerTarget then
            self:command(xs[i], "attack", archerTarget)
        else
            local e = self:findNearest(es)
            if e then
                self:command(xs[i], "attack", e)
            else
        local angle = mathpi * 2 * i / #xs
            local defPos = {x=l.pos.x+5 * math.cos(angle), y=l.pos.y+5 * math.sin(angle)}
            self:command(xs[i], "move", defPos)
            end
        end
    end
end


archerTarget = nil
loop
    summonMinion()
    es = self:findEnemies()
    if not archerTarget then
        archerTarget = mostHealthyEnemy()
    else
        if archerTarget.health <= 0 then
            archerTarget = mostHealthyEnemy()
        end
    end
    commandSoldiers(self:findByType("soldier"))
    commandArchers(self:findByType("archer"))
end
