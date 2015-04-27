-- using "cleave" and Defensive Boots
loop
    local e = self:findNearestEnemy()
    if e then
        local d = self:distanceTo(e)
        if d > 10 then
            self:move({x=51, y=53})
        elseif d > 3 and self:isReady("cleave") then
            self:cleave(e)
        else
            self:attack(e)
        end
    else
        self:move({x=51, y=53})
    end
end
