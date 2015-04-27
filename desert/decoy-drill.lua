function pos2xy(pos) return pos['x'], pos['y'] end

local decoysBuilt = 0
loop
    local item = self:findNearest(self:findItems())
    self:move(item.pos)
    if self.gold >= self:costOf("decoy") then
        self:buildXY("decoy", pos2xy(self.pos))
        decoysBuilt = decoysBuilt + 1
        if decoysBuilt >= 4 then
            break
        end
    end
end

self:say("Done building decoys!")
self:moveXY(14, 36)
self:say(decoysBuilt)
