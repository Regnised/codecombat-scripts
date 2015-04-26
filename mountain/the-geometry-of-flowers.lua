mathpi = 3.1415927
-- toggleFlowers(true/false) - turns flowers on or off.
-- setFlowerColor("random") - can also be "pink", "red", "blue", "purple", "yellow", or "white".

function drawCircle(x, y, size)
    local angle = 0
    self:toggleFlowers(false)
    self:moveXY(x, y)
    self:toggleFlowers(true)
    while angle <= mathpi * 2 do
        local newX = self.pos.x + (size * math.cos(angle))
        local newY = self.pos.y + (size * math.sin(angle))
        self:move({x=newX, y=newY})
        angle = angle + 0.2
    end
end

function drawSquare(x, y, size)
    self:toggleFlowers(false)
    self.moveXY(x, y)
    self:toggleFlowers(true)
    self:moveXY(self.pos.x + size, self.pos.y)
    self:moveXY(self.pos.x, self.pos.y + size)
    self:moveXY(self.pos.x - size, self.pos.y)
    self:moveXY(self.pos.x, self.pos.y - size)
end

--redX = {"x": 28, "y": 36}
--whiteX = {"x": 44, "y": 36}

self:setFlowerColor("red")
drawCircle(28, 36, 10)
self:setFlowerColor("white")
drawSquare(44, 36, 10)
