require 'Burgers'
require 'Chickens'

FoodItems = {}

function FoodItems:load()
    Burgers:load()
    Chickens:load()
end

function FoodItems:mousepressed(x, y, button)
    Burgers:mousepressed(x, y, button)
    Chickens:mousepressed(x, y, button)
end

function FoodItems:mousereleased(x, y, button)
    Burgers:mousereleased(x, y, button)
    Chickens:mousereleased(x, y, button)
end

function FoodItems:update(mouseX, mouseY, dt)
    Burgers:update(mouseX, mouseY, dt)
    Chickens:update(mouseX, mouseY, dt)
end

function FoodItems:draw()
    Burgers:draw()
    Chickens:draw()
end