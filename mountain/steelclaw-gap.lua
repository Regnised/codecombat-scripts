defPoints = {{x=39, y=63}, {x=57, y=63}, {x=36, y=26}, {x=60, y=26}}

function summonTroops()
    if #self.built % 8 < 4 and self.gold >= self:costOf("soldier") then
        self:summon("soldier")
     elseif self.gold >= self:costOf("archer") then
        self:summon("archer")
    end
end
function commandTroops()
    local fs = self:findFriends()
    for i = 1, #fs do
        self:command(fs[i], "defend", defPoints[i % #defPoints + 1])
    end
end

loop
    summonTroops()
    commandTroops()
end
