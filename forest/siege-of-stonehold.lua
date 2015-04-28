-- using "bash", "cleave"
loop
    f = self:findFlag()
    e = self:findNearest(self:findEnemies())
    if f then
        self:pickUpFlag(f)
    elseif e then
        if e.type == "ogre" and self:isReady("bash") then
            self:bash(e)
        elseif self:isReady("cleave") then
            self:cleave(e)
        else
            self:attack(e)
        end
    end
end
