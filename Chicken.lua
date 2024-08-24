require 'Healthbar_copy'
require 'constants'

Chicken = {
    radius = CHICKEN_RADIUS, 
    x = 0,
    y = 0,
    rotation = 0, 
    healthbar = {},
    inOil = true
}

function Chicken:update(dt)
    self.healthbar:update(dt)
end

function Chicken:draw()
    if not self.inOil then
        if self.healthbar.modified == 0 then
            love.graphics.setColor(1,1,1,1)
            love.graphics.draw(raw_drum, self.x + self.radius, self.y + self.radius, self.rotation, 1, 1, self.radius, self.radius)
        elseif self.healthbar.modified == 1 then
            love.graphics.setColor(1,1,1,1)
            love.graphics.draw(egg_drum, self.x + self.radius, self.y + self.radius, self.rotation, 1, 1, self.radius, self.radius)
        elseif self.healthbar.modified == 2 or self.healthbar.modified == 3 then
            love.graphics.setColor(1,1,1,1)
            Particles:draw(self.x + self.radius, self.y + self.radius, mouseY)
            love.graphics.draw(flour_drum, self.x + self.radius, self.y + self.radius, self.rotation, 1, 1, self.radius, self.radius)
        end
    end
    
    self.healthbar:draw()
end

function Chicken:move(mouseX, mouseY)
    self.x = mouseX - CHICKEN_RADIUS 
    self.y = mouseY - CHICKEN_RADIUS
    self.healthbar.x = mouseX - CHICKEN_RADIUS
    self.healthbar.y = mouseY - CHICKEN_RADIUS - HEALTHBAR_VERT_OFFSET
end

function Chicken:new(t)
    t = t or {}
    local t2 = {
        x = t[1],
        y = t[2],
        rotation = math.random() * math.pi,
        healthbar = Healthbar:new({x = t[1], y = t[2] - HEALTHBAR_VERT_OFFSET, timeLimit = CHICKEN_TIME_LIMIT})
    }
    setmetatable(t2, self)
    self.__index = self
    return t2
end
