mathpi = 3.1415927
twoPi = 2 * mathpi

function pythonsign(x)
   if x < 0 then
     return -1
   else
     return 1
   end
end

function drawPolyStars(center, radius, sides, skips, startAngle)
    angle = startAngle
    x = center['x']
    y = center['y']
    self:toggleFlowers(false)
    lops = skips + 1
    stepAngle = lops * (twoPi / sides)
    if skips ~= 0 and (sides % lops) == 0 then
        lops = skips
    end
    endAngle = (twoPi * lops) + startAngle
    while angle <= endAngle do
        newX = x + radius * math.cos(angle)
        newY = y + radius * math.sin(angle)
        self:moveXY(newX, newY)
        self:toggleFlowers(true)
        angle = angle + stepAngle
    end
end

function drawPolyStars(center, radius, sides, skips, startAngle)
    angle = startAngle
    x = center['x']
    y = center['y']
    self:toggleFlowers(false)
    lops = skips + 1
    stepAngle = lops * (twoPi / sides)
    if skips ~= 0 and (sides % lops) == 0 then
        lops = skips
    end
    endAngle = (twoPi * lops) + startAngle
    while angle <= endAngle do
        newX = x + radius * math.cos(angle)
        newY = y + radius * math.sin(angle)
        self.moveXY(newX, newY)
        self:toggleFlowers(true)
        angle = angle + stepAngle
    end
end

function drawStar(center, radius, sides, skips, startAngle)
    skipsPlusOne = skips + 1
    if ((sides/skipsPlusOne) ~= 1 and (sides%skipsPlusOne) == 0) then
        for index = 0, skips do
            angle = startAngle + index * (twoPi / sides)
            drawPolyStars(center, radius, sides, skips, angle)
        end
    else
        drawPolyStars(center, radius, sides, skips, startAngle)
    end
end

function drawPolygon(center, radius, sides, startAngle)
    drawPolyStars(center, radius, sides, 0, startAngle)
end

function drawSpokes(center, radius, sides, startAngle)
    x = center['x']
    y = center['y']
    endAngle = twoPi + startAngle
    stepAngle = twoPi / sides
    angle = startAngle
    while angle < endAngle do
        newX = x + radius * math.cos(angle)
        newY = y + radius * math.sin(angle)
        if math.floor(self.pos.x) == math.floor(x) and math.floor(self.pos.y) == math.floor(y) then
            self:toggleFlowers(true)
            self:moveXY(newX, newY)
        else
            self:toggleFlowers(false)
            self:moveXY(newX, newY)
            self:toggleFlowers(true)
            self.moveXY(x, y)
        end
        self:toggleFlowers(false)
        angle = angle +  stepAngle
    end
end

function drawSpiral(center, size, lopNum, startAngle)
    x = center['x']
    y = center['y']
    self:toggleFlowers(false)
    self:moveXY(x, y)
    self:toggleFlowers(true)
    steps = size * 2
    direction = pythonsign(lopNum)
    stepAngle = twoPi / steps / direction
    lops = direction * lopNum
    stepSize = size / steps / lops
    curSize = 0
    angle = startAngle
    endAngle = (twoPi * lopNum) + startAngle
    while (lopNum < 0 and angle >= endAngle) or (lopNum >= 0 and angle <= endAngle) do
        newX = x + curSize * math.cos(angle)
        newY = y + curSize * math.sin(angle)
        self:moveXY(newX, newY)
        angle = angle + stepAngle
        curSize = curSize + stepSize
    end
    newX = x + size * math.cos(endAngle)
    newY = y + size * math.sin(endAngle)
    self:moveXY(newX, newY)
end


redX = {x=28, y=36}
whiteX = {x=60, y=36}
whiteX2 = {x=60, y=42}

self:setFlowerColor("white")

drawPolygon(redX, 10, 6, mathpi/2)
drawSpokes(redX, 10, 3, 5*mathpi/6)

self:setFlowerColor("yellow")
drawStar(whiteX, 6, 7, 3, mathpi/2)

self:setFlowerColor("purple")
drawSpiral(whiteX2, 15,  1, 3*mathpi/2)
drawSpiral(whiteX2, 15,  -1, 3*mathpi/2)
