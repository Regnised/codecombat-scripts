loop
    local flag = self:findFlag()
    if flag then
        self:pickUpFlag(flag)
        self:buildXY("fire-trap", flag.pos.x, flag.pos.y)
    else
        local item = self:findNearestItem()
        if item then
            local itemPos = item.pos
            local x = itemPos.x
            local y = itemPos.y
            self:moveXY(x, y)
        end
    end
end
