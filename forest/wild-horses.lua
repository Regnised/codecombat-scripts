loop
    horse = self:findNearest(self:findFriends())
    if horse then
        local x1 = horse.pos.x - 7
        local x2 = horse.pos.x + 7
        if x1 >= 1 then
            self:moveXY(x1, horse.pos.y)
        elseif x2 <= 79 then
            self:moveXY(x2, horse.pos.y)
        end
        local distance = self:distanceTo(horse)
        if distance <= 10 then
            self:say("Whoa")
            self:moveXY(28, 54)
            self:moveXY(42, 22)
        end
    end
end
