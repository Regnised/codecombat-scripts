loop
    fs = self:findFriends()
    for i = 1, #fs do
        e = self:findNearest(fs[i]:findEnemies())
        if e then
            self:command(fs[i], "attack", e)
        elseif (self:now() > 2  and fs[i].type == "soldier") or (self:now() > 3.5  and fs[i].type == "archer") then
            self:command(fs[i], "move", {x=fs[i].pos.x + 3, y=fs[i].pos.y})
        end
    end
    e = self:findNearest(self:findEnemies())
    if e then
        self:attack(e)
    else
        self:move({x=87, y=48})
    end
end
