loop
    local pender = self:findNearest(self:findFriends())
    if pender then
        local v = pender.velocity
        self:move({x=pender.pos.x + v['x']/2, y=pender.pos.y + v['y']/2})
    end
end
