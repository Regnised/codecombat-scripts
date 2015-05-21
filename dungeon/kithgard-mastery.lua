local coins = 0
loop
    zx, zy = self.pos.x, self.pos.y
    self:moveXY(zx + 9, zy + 20)
    self:attack(self:findNearest(self:findEnemies()))
    self:moveXY(zx + 20, zy + 49)
    local i = self:findNearest(self:findItems())
    self:moveXY(i.pos.x, i.pos.y)
    coins = coins + 1
    self:moveXY(zx + 34, zy + 24)
    self:say(coins)
    self:wait(2)
    self:moveXY(zx + 40, zy)
    self:say("Sesame")
    self:moveXY(zx + 60, zy)
end
