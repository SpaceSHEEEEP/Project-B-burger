require 'Background'
require 'Burgers'
require 'Graphics'

function love.load()
    Background:load()
    Graphics:load()
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
    Burgers:update(mouseX, mouseY, dt)

    --[[if love.mouse.isDown(1) then -- TODO: FIX THIS
        burgerIndex = Burgers:checkBurgers(mouseX, mouseY)
        if burgerIndex ~= 0 then
            Burgers:move(mouseX, mouseY, burgerIndex)
        end
    end]]
end

function love.draw()
    Background:draw()
    Burgers:draw()

    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    love.graphics.print('mouseX: ' .. tostring(mouseX), 10, 25)
    love.graphics.print('mouseY: ' .. tostring(mouseY), 10, 40)
end