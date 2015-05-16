mathpi = 3.1415927
colors = {"pink", "white", "blue", "yellow", "red", "purple"}

function drawHex(x, y, size)
    local angle = 0
    self:toggleFlowers(false)
    self:moveXY(x, y)
    self:toggleFlowers(true)
    while angle <= 5 * mathpi/3 do
        local newX = self.pos.x + (size * math.cos(angle))
        local newY = self.pos.y + (size * math.sin(angle))
        self:moveXY(newX, newY)
        angle = angle + mathpi/3
    end
end

self:setFlowerColor("white")
drawHex(30, 30, 20)
drawHex(35, 25, 20)
self:setFlowerColor("blue")
drawHex(45, 15, 20)
drawHex(50, 10, 20)
self:setFlowerColor("white")
drawHex(60, 60, 20)
drawHex(65, 55, 20)
self:setFlowerColor("blue")
drawHex(75, 45, 20)
drawHex(80, 40, 20)
self:setFlowerColor("white")
drawHex(90, 90, 20)
drawHex(95, 85, 20)
self:setFlowerColor("blue")
drawHex(105, 75, 20)
drawHex(110, 70, 20)
