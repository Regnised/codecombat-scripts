while self:now() < 20 do
    local i = self:findNearest(self:findItems())
    if i then
        self:move(i.pos)
    end
end
while self.pos.x > 16 do
    self:move({x=16, y=38})
end
self:buildXY("fence", 21, 38)
