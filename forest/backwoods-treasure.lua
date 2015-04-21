-- level 2
-- using "bash", "move"
function attack(e)
    local d = self:distanceTo(e)
    if d > 8 then
        self:move({x=e.pos.x, y=e.pos.y})
    elseif e.health >= 100 and self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

function get(i)
    self:move({x=i.pos.x, y=i.pos.y})
end

loop
    f = self:findFlag()
    e = self:findNearest(self:findEnemies())
    i = self:findNearest(self:findItems())
    if f then
        self:pickUpFlag(f)
    elseif e and i then
        d = self:distanceTo(e)
        if d < self:distanceTo(i) and d < 8 then
            attack(e)
        else
            get(i)
        end
    elseif i then
        get(i)
    elseif e then
        attack(e)
    end
end
