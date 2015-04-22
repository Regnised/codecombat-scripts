-- using "bash", "move"
loop
    i = self:findNearest(self:findItems())
    e = self:findNearest(self:findEnemies())
    f = self:findFlag()
    if f then
        self:pickUpFlag(f)
    elseif i and e then
        di = self:distanceTo(i)
        de = self:distanceTo(e)
        if de <= 7 and de < di then
            if self:isReady("bash") then
                self:bash(e)
            else
                self:attack(e)
            end
        else
            self:move(i.pos)
        end
    elseif i then
        self:move(i.pos)
    elseif e then
        self:attack(e)
    end
end
