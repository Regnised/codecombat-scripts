loop
    local flag = self:findFlag()
    if flag then
        self:pickUpFlag(flag)
    else
        self:say("Place a flag for me to go to.")
    end
end
