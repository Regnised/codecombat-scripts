local friendNames = {'Joan', 'Ronan', 'Nikita', 'Augustus'}
local friendIndex = 1

while friendIndex <= #friendNames do
    local friendName = friendNames[friendIndex]
    self:say(friendName .. ', go home!')
    friendIndex = friendIndex + 1
end

self:moveXY(30, 30)
self:buildXY("fence", 34, 30)
self:moveXY(20, 35)
