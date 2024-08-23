require 'constants'

-- Define class attributes
Healthbar = {
    x = 0,
    y = 0,
    width = HEALTHBAR_WIDTH,
    widthBlue = HEALTHBAR_WIDTH,
    height = HEALTHBAR_HEIGHT,
    timer = 0,
    timeLimit = 0,
    modified = 0
}

-- Define class methods
function Healthbar:update(dt)
    if self.modified == 0 then
        if self.timer < self.timeLimit then
            self.timer = self.timer + dt
            self.widthBlue = self.width * (1 - self.timer / self.timeLimit)
        else
            self.timer = 0
            self.modified = 1
        end
    elseif self.modified == 1 then
        if self.timer < self.timeLimit then
            self.timer = self.timer + dt
            self.widthBlue = self.width * (1 - self.timer / self.timeLimit)
        else 
            self.timer = 0
            self.modified = 2
        end
    elseif self.modified == 2 then
        if self.timer < self.timeLimit then
            self.timer = self.timer + dt
            self.widthBlue = self.width * (1 - self.timer / self.timeLimit)
        else 
            self.timer = 0
            self.modified = 3
        end
    end
end

function Healthbar:draw()
    love.graphics.setColor(1, 0, 0, 1) -- red
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    
    love.graphics.setColor(0, 0, 1, 1) -- blue
    love.graphics.rectangle('fill', self.x, self.y, self.widthBlue, self.height)
end

function Healthbar:new(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self
    return t
end