require 'Background'
require 'FoodItems'
require 'Graphics'
require 'Particles'

function love.load()
    Background:load()
    FoodItems:load()
    Graphics:load()
    Particles:load()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button)
    FoodItems:mousepressed(x, y, button)
end 

function love.mousereleased(x, y, button)
    FoodItems:mousereleased(x, y, button)
end

function love.update(dt)
    mouseX, mouseY = love.mouse.getPosition()
    FoodItems:update(mouseX, mouseY, dt)
    Particles:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.7, 0.7, 0.7,1)
    Background:draw()
    FoodItems:draw()

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    love.graphics.print('mouseX: ' .. tostring(mouseX), 10, 25)
    love.graphics.print('mouseY: ' .. tostring(mouseY), 10, 40)
end