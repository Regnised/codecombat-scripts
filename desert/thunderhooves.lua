loop
    local yak = self:findNearestEnemy()
    if yak then
        if yak.pos.y > self.pos.y then
            self:buildXY("fence", yak.pos.x, yak.pos.y - 10)
        elseif yak.pos.y < self.pos.y then
            self:buildXY("fence", yak.pos.x, yak.pos.y + 10)
        end
    else
        self:moveXY(self.pos.x + 10, self.pos.y)
    end
end
