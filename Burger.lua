require 'Healthbar_copy'
require 'constants'

Burger = {
    radius = BURGER_RADIUS, 
    x = 0,
    y = 0,
    rotation = 0, 
    healthbar = {}
}

function Burger:update(dt)
    self.healthbar:update(dt)
end

function Burger:draw()
    if self.healthbar.modified == 0 then
        love.graphics.setColor(1,1,1,1)
        -- it took me WAY TOO LONG to make the damn burger rotate
        love.graphics.draw(frozen_patty, self.x + self.radius, self.y + self.radius, self.rotation, 1, 1, self.radius, self.radius)
    elseif self.healthbar.modified == 1 then
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(cooked_patty, self.x + self.radius, self.y + self.radius, self.rotation, 1, 1, self.radius, self.radius)
    elseif self.healthbar.modified == 2 or self.healthbar.modified == 3 then
        love.graphics.setColor(1,1,1,1)
        Particles:draw(self.x + self.radius, self.y + self.radius, mouseY)
        love.graphics.draw(burnt_patty, self.x + self.radius, self.y + self.radius, self.rotation, 1, 1, self.radius, self.radius)
    end
    
    self.healthbar:draw()
end

function Burger:move(mouseX, mouseY)
    self.x = mouseX - BURGER_RADIUS 
    self.y = mouseY - BURGER_RADIUS
    self.healthbar.x = mouseX - BURGER_RADIUS
    self.healthbar.y = mouseY - BURGER_RADIUS - HEALTHBAR_VERT_OFFSET
end

function Burger:new(t)
    t = t or {}
    local t2 = {
        x = t[1],
        y = t[2],
        rotation = math.random() * math.pi,
        healthbar = Healthbar:new({x = t[1], y = t[2] - HEALTHBAR_VERT_OFFSET, timeLimit = BURGER_TIME_LIMIT})
    }
    setmetatable(t2, self)
    self.__index = self
    return t2
end
