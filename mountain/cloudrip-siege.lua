-- level 2
-- using "bash", "move"
function pos2xy(pos) return pos['x'], pos['y'] end

tp = 1
towerPos = {{x=68, y=41}, {x=50, y=41}, {x=77, y=41}, {x=32, y=41}, {x=23, y=41}}

function dist2(a, b)
    local x, y = a.x - b.x, a.y - b.y
    return x*x + y*y
end
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
    local e = self:findNearest(self:findEnemies())
    if e then
        if self:distanceTo(e) <= 10 and e.maxHealth > 200 and self:isReady("bash") then
            self:bash(e)
        end
    end
    if self.gold >= self:costOf("arrow-tower") then
        if dist2(self.pos, towerPos[tp]) > 100 then
            self:move(towerPos[tp])
        else
            self:buildXY("arrow-tower", pos2xy(towerPos[tp]))
            if tp == #towerPos then
                tp = 1
            else
                tp = tp + 1
            end
        end
    elseif c then
        self:move(c.pos)
    end
end
