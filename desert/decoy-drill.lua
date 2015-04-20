local decoysBuilt = 0
loop
    local item = self:findNearest(self:findItems())
    self:move({x=item.pos.x, y=item.pos.y})
    if self.gold >= 25 then
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
