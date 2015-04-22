local decoysBuilt = 0
loop
    local item = self:findNearest(self:findItems())
    self:move(item.pos)
    if self.gold >= self:costOf("decoy") then
        self:buildXY("decoy", self.pos.x, self.pos.y)
        decoysBuilt = decoysBuilt + 1
        if decoysBuilt >= 4 then
            break
        end
    end
end

self:say("Done building decoys!")
self:moveXY(14, 36)
self:say(decoysBuilt)
