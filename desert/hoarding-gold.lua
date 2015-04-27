function pos2xy(pos) return pos['x'], pos['y'] end

local totalGold = 0
while totalGold < 25 do
    local coin = self:findNearest(self:findItems())
    totalGold = totalGold + coin.value
    self:moveXY(pos2xy(coin.pos))
end

self:moveXY(38, 34)
self:say("Done collecting gold!")
self:moveXY(59, 33)
self:say(totalGold)
