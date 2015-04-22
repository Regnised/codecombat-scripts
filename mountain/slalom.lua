gems = self:findItems()
for i = 1, #gems do
    while self.pos.x < 10 + 10 * i do
        self:move({ x=10+10*i, y=35 })
    end
    while self.pos.x < gems[i].pos.x do
        self:move(gems[i].pos)
    end
end
