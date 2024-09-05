require 'constants'
require 'Healthbar_copy'
require 'Graphics'
require 'Particles'
require 'Burger'

Burgers = {}

-- Below is the table of burgers
function Burgers:load()
    self.burgerTable = {}
    self.moveBurgerIndex = 0
end

function Burgers:mousepressed(x, y, button)
    local burgerIndex = Burgers:checkBurgers(x, y)

    -- MAYBE make st when click and burger overlap, insert(newX, newY) st dont overlap
    if button == 1 and burgerIndex == 0 then
        Burgers:insert(x, y)
    end 

    if button == 1 and burgerIndex ~= 0 then
        self.moveBurgerIndex = burgerIndex
    end
end

function Burgers:mousereleased(x, y, button)
    if button == 1 and self.moveBurgerIndex ~= 0 then
        if inBin(x,y) then
            table.remove(self.burgerTable, self.moveBurgerIndex)
        end

        self.moveBurgerIndex = 0
    end
end

function inHotPlate(x, y)
    if  x > HOTPLATE_X and 
        x < HOTPLATE_X + HOTPLATE_WIDTH and 
        y > HOTPLATE_Y and 
        y < HOTPLATE_Y + HOTPLATE_HEIGHT then
            return true
    else
        return false 
    end
end

function inBin(x, y)
    if  x > BIN_X + BIN_OFFSET and 
        x < BIN_X + BIN_WIDTH - BIN_OFFSET and 
        y > BIN_Y + BIN_OFFSET and 
        y < BIN_Y + BIN_HEIGHT - BIN_OFFSET then
            return true
    else
        return false 
    end
end

function Burgers:insert(x, y)
    if  inHotPlate(x,y) then

        local xPos = math.min(x - BURGER_RADIUS, HOTPLATE_X + HOTPLATE_WIDTH - BURGER_RADIUS * 2)
        xPos = math.max(xPos, HOTPLATE_X) -- this is at top left of burger


        local yPos = math.min(y - BURGER_RADIUS, HOTPLATE_Y + HOTPLATE_HEIGHT - BURGER_RADIUS* 2)
        yPos = math.max(yPos, HOTPLATE_Y) -- this is at top left of burger

        table.insert(self.burgerTable, Burger:new({xPos, yPos})) -- ew 

    end
end

function Burgers:checkBurgers(mouseX, mouseY)
    for i, burger in pairs(self.burgerTable) do 

        local mouse2centre = ((mouseX - burger.x - burger.radius)^2 + (mouseY - burger.y - burger.radius)^2)^0.5
        if mouse2centre < burger.radius then
            return i 
        end
        
    end

    return 0
end

-- implement burger fall function? fall off the hotplate

function Burgers:update(mouseX, mouseY, dt)
    if #self.burgerTable > 0 then
        for _, burger in pairs(self.burgerTable) do
            burger:update(dt)
        end

        if self.moveBurgerIndex ~= 0 then
            self.burgerTable[self.moveBurgerIndex]:move(mouseX, mouseY) 
        end
    end
end

function Burgers:draw()
    for _, burger in pairs(self.burgerTable) do
        burger:draw()
    end
end
