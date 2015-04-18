loop
    local flag = self:findFlag()
    if flag then
        self:pickUpFlag(flag)
    else
        local item = self:findNearestItem()
        if item then
            local position = item.pos
            local x = position.x
            local y = position.y
            self:moveXY(x, y)
        else
            self:say("Place a flag for me to go to.")
        end
    end
end
