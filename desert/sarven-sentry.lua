function pos2xy(pos) return pos['x'], pos['y'] end

loop
    local flagGreen = self:findFlag("green")
    local flagBlack = self:findFlag("black")
    local flagViolet = self:findFlag("violet")

    if flagGreen then
        self:pickUpFlag(flagGreen)
        self:buildXY("fence", pos2xy(flagGreen.pos))
    elseif flagBlack then
        self:pickUpFlag(flagBlack)
        self:buildXY("fire-trap", pos2xy(flagBlack.pos))
    elseif flagViolet then
        self:pickUpFlag(flagViolet)
    end
end
