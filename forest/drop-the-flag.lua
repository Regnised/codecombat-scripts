function pos2xy(pos) return pos['x'], pos['y'] end

loop
    local flag = self:findFlag()
    if flag then
        self:pickUpFlag(flag)
        self:buildXY("fire-trap", pos2xy(flag.pos))
    else
        local item = self:findNearestItem()
        if item then
            self:moveXY(pos2xy(item.pos))
        end
    end
end
