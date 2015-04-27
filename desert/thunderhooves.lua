loop
    local yak = self:findNearest(self:findEnemies())
    if not yak then
        self:moveXY(self.pos.x+10, self.pos.y)
    elseif yak.pos.y > self.pos.y then
        self:buildXY("fence", yak.pos.x, yak.pos.y-10)
    else
        self:buildXY("fence", yak.pos.x, yak.pos.y+10)
    end
end
