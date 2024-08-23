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

    burgerIndex = Burgers:checkBurgers(x, y)

    -- MAYBE make st when click and burger overlap, insert(newX, newY) st dont overlap
    if button == 1 and burgerIndex == 0 then
        Burgers:insert(x, y)
    end 

    if button == 1 and burgerIndex ~= 0 then
        Burgers:move(burgerIndex)
    end
end 

function love.mousereleased(x, y, button)
    if button == 1 and burgerIndex ~= 0 then
        Burgers:move(nil)
    end
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

    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    love.graphics.print('mouseX: ' .. tostring(mouseX), 10, 25)
    love.graphics.print('mouseY: ' .. tostring(mouseY), 10, 40)
end