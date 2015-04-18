-- The raven will tell you what to use for your maze parameters!
SLIDE, SWITCH, SKIP = 10, 7, 11
local sideSteps = 1
local steps = 1
local X_PACE_LENGTH = 4
local Y_PACE_LENGTH = 6
local sn = 1
while steps <= 35 do
    self:moveXY(steps * X_PACE_LENGTH, sideSteps * Y_PACE_LENGTH)
    if steps % SWITCH == 0 then
        sn = -sn
    end
    sideSteps = sideSteps + sn
    if steps % SKIP == 0 then
        sideSteps = sideSteps + sn
    end
    if sideSteps < 1 then
        sideSteps = sideSteps + SLIDE
    elseif sideSteps > SLIDE then
        sideSteps = sideSteps - SLIDE
    end
    steps = steps + 1
end
