function attack(e)
    if e.health > 162 and self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

loop
    local farthest = nil
    local maxDistance = 0
    local enemyIndex = 1
    local enemies = self:findEnemies()

    while enemyIndex <= #enemies do
        local target = enemies[enemyIndex]
        enemyIndex = enemyIndex + 1

        local distance = self:distanceTo(target)
        if distance > maxDistance then
            maxDistance = distance
            farthest = target
        end
    end

    if farthest then
        while farthest.health > 0 do
            attack(farthest)
        end
    end
end
