function pos2xy(pos) return pos['x'], pos['y'] end

function bestCoin(xs)
    local r, maxR = nil, 0
    for i = 1, #xs do
        local v = xs[i].value/self:distanceTo(xs[i])
        if v > maxR then
            r, maxR = xs[i], v
        end
    end
    return r
end

loop
    local c = bestCoin(self:findItems())
    self:moveXY(pos2xy(c.pos))
end
