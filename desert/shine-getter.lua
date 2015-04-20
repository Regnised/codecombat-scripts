function bestCoin(xs)
    local r, maxR = xs[1], xs[1].value/self:distanceTo(xs[1])
    for i = 2, #xs do
        local v = xs[i].value/self:distanceTo(xs[i])
        if v > maxR then
            r, maxR = xs[i], v
        end
    end
    return r
end

loop
    local c = bestCoin(self:findItems())
    self:moveXY(c.pos.x, c.pos.y)
end
