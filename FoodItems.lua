require 'Burgers'

FoodItems = {}

function FoodItems:load()
    Burgers:load()
end

function FoodItems:update(mouseX, mouseY, dt)
    Burgers:update(mouseX, mouseY, dt)
end

function FoodItems:draw()
    Burgers:draw()
end