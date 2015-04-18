-- using Long Sword, Steel Striker
loop
    local enemy = self:findNearest(self:findEnemies())
    local flag = self:findFlag()
    if flag then
        self:pickUpFlag(flag)
    elseif enemy then
        if self:isReady("cleave") then
            self:cleave(enemy)
        elseif self:isReady("bash") then
            self:bash(enemy)
        else
            self:attack(enemy)
        end
    end
end
