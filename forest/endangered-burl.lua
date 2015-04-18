loop
    local enemy = self:findNearestEnemy()
    if enemy.type == "burl" then
        self:say("I'm not attacking that Burl!")
    elseif enemy.type == "munchkin" or enemy.type == "thrower" then
        self:attack(enemy)
    elseif enemy.type == "ogre" then
        self:moveXY(21, 42)
    end
end
