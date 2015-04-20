function attack(e)
    if e.health > 33 and self:isReady("bash") then
        self:bash(e)
    else
        self:attack(e)
    end
end

local enemies = self:findEnemies()
local enemyIndex = 1

loop
    local enemy = enemies[enemyIndex]
    if enemy then
        if enemy.type == 'shaman' then
            while enemy.health > 0 do
                attack(enemy)
            end
        end
    end
    enemyIndex = enemyIndex + 1
end
