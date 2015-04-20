loop
    local flagGreen = self:findFlag("green")
    local flagBlack = self:findFlag("black")
    local flagViolet = self:findFlag("violet")

    if flagGreen then
        self:pickUpFlag(flagGreen)
        self:buildXY("fence", flagGreen.pos.x, flagGreen.pos.y)
    elseif flagBlack then
        self:pickUpFlag(flagBlack)
        self:buildXY("fire-trap", flagBlack.pos.x, flagBlack.pos.y)
    elseif flagViolet then
        self:pickUpFlag(flagViolet)
    end
end
