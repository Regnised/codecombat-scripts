local i = 1
loop
    self:moveXY(self.pos.x + i, self.pos.y)
    self:moveXY(self.pos.x, self.pos.y - i)
    i = i + 1
    self:moveXY(self.pos.x - i, self.pos.y)
    self:moveXY(self.pos.x, self.pos.y + i)
    i = i + 1
end
