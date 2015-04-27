-- using "bash", "cleave"
function summonSoldier()
    if self.gold >= self:costOf("soldier") then
        self:summon("soldier")
    end
end
function commandSoldiers()
    local f = self:findFriends()
    for i = 1, #f do
        local e = f[i]:findNearest(f[i]:findEnemies())
        if e then
            self:command(f[i], "attack", e)
        end
    end
end

loop
    summonSoldier()
    commandSoldiers()
    local e = self:findNearest(self:findEnemies())
    local i = self:findNearest(self:findItems())
    local f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif e and i then
        local de = self:distanceTo(e)
        local di = self:distanceTo(i)
        if de < di and self:isReady("cleave") then
            self:cleave(e)
        elseif de < di and self:isReady("bash") then
            self:bash(e)
        else
            self:move(i.pos)
        end
    elseif i then
        self:move(i.pos)
    end
end
