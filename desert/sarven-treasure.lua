-- level 2
function distTo2(t, o)
    local dx, dy = t['x'] - o.pos.x, t['y'] - o.pos.y
    return dx*dx + dy*dy
end
tele = {{x=5, y=49}, {x=76, y=51}, {x=5, y=19}, {x=76, y=19}}
function nearestTele()
    local r, dmin = tele[1], distTo2(tele[1], self)
    for i = 2, 4 do
        local di = distTo2(tele[i], self)
        if di < dmin then
            r, dmin = tele[i], di
        end
    end
    return r
end
function distance2(a, b)
    local x, y = a.pos.x - b.pos.x, a.pos.y - b.pos.y
    return x*x + y*y
end
function nearestSafeTele()
    local r, dmin = nil, 4e4
    for i = 1, 4 do
        local di = distTo2(tele[i], self)
        local emin = 4e4
        local es = self:findEnemies()
        if #es > 0 then
            for j = 1, #es do
                local dd = distTo2(tele[i], es[j])
                if dd < emin then
                    emin = dd
                end
            end
        end
        if emin > di and di < dmin then
            r, dmin = tele[i], di
        end
    end
    return r
end
function safeItems(xs)
    local r = {}
    for i = 1, #xs do
        local di = distance2(xs[i], self)
        local emin = 4e4
        local es = self:findEnemies()
        if #es > 0 then
            for j = 1, #es do
                local dd = distance2(xs[i], es[j])
                if dd < emin then
                    emin = dd
                end
            end
        end
        if emin > di then
            r[#r+1] = xs[i]
        end
    end
    return r
end

loop
    local i = self:findNearest(safeItems(self:findItems()))
    local e = self:findNearest(self:findEnemies())
    if i and e then
        local t = nearestSafeTele()
        if not t then
            t = nearestTele()
        end
        local de = self:distanceTo(e)
        local di = self:distanceTo(i)
        if di < de and de > 7 then
            self:move(i.pos)
        else
            if de <= 7 and self:isReady("bash") then
                self:bash(e)
            else
                self:move(t)
            end
        end
    elseif i then
        self:move(i.pos)
    elseif e then
        local t = nearestSafeTele()
        if not t then
            t = nearestTele()
        end
        self:move(t)
    end
end
