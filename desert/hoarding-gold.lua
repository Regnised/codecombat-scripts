local totalGold = 0
while true do
    local coin = self:findNearest(self:findItems())
    self:moveXY(coin.pos.x, coin.pos.y)
    totalGold = totalGold + coin.value
    if totalGold >= 25 then
        break
    end
end

self:moveXY(38, 34)
self:say("Done collecting gold!")
self:moveXY(58, 33)
self:say(totalGold)
