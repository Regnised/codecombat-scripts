mathpi = 3.1415927

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
        local defPos = {x=41+10 * math.cos(angle), y=40+10 * math.sin(angle)}
        self:command(xs[i], "defend", defPos)
    end
end
function mostHealthyEnemy()
    local es = self:findEnemies()
    local m, mh = nil, 0
    for i = 1, #es do
        if es[i].health > mh and es[i].health > 15 then
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
            local e = self:findNearest(self:findEnemies())
            if e then
                self:command(xs[i], "attack", e)
            else
        local angle = mathpi * 2 * i / #xs
            local defPos = {x=41+5 * math.cos(angle), y=40+5 * math.sin(angle)}
            self:command(xs[i], "move", defPos)
            end
        end
    end
end


archerTarget = nil
loop
    if not archerTarget then
        archerTarget = mostHealthyEnemy()
    else
        if archerTarget.health <= 0 then
            archerTarget = mostHealthyEnemy()
        end
    end
    summonMinion()
    commandSoldiers(self:findByType("soldier"))
    commandArchers(self:findByType("archer"))
end
