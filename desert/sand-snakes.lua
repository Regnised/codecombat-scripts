function pos2xy(pos) return pos['x'], pos['y'] end

function nearestCoin(xs)
    local r, minD = nil, 9e9
    for i = 1, #xs do
        local d = self:distanceTo(xs[i])
        if d < minD then
            r, minD = xs[i], d
        end
    end
    return r
end

loop
    local c = nearestCoin(self:findItems())
    self:moveXY(pos2xy(c.pos))
end
