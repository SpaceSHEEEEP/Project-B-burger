require 'constants'
require 'Healthbar_copy'
require 'Graphics'
require 'Particles'
require 'Chicken'
require 'Dustbin'

Chickens = {}

-- Below is the table of Chickens
function Chickens:load()
    self.chickenTable = {}
    self.moveChickenIndex = 0
end

function Chickens:mousepressed(x, y, button)
    local chickenIndex = Chickens:checkChickens(x, y)

    -- MAYBE make st when click and burger overlap, insert(newX, newY) st dont overlap
    if button == 1 and chickenIndex == 0 then
        Chickens:insert(x, y)
    end 

    if button == 1 and chickenIndex ~= 0 then
        self.moveChickenIndex = chickenIndex
        self.chickenTable[chickenIndex].inOil = false
    end
end

function Chickens:mousereleased(x, y, button)
    if button == 1 and self.moveChickenIndex ~= 0 then
        if inFryer(x, y) then
            self.chickenTable[self.moveChickenIndex].inOil = true
        end

        if inBin(x,y) then
            table.remove(self.chickenTable, self.moveChickenIndex)
        end

        self.moveChickenIndex = 0
    end
end

function inFryer(x, y)
    if  x > FRYER_X + FRYER_OFFSET and 
        x < FRYER_X + FRYER_WIDTH - FRYER_OFFSET and 
        y > FRYER_Y + FRYER_OFFSET and 
        y < FRYER_Y + FRYER_HEIGHT - FRYER_OFFSET then
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

function Chickens:insert(x, y)
    if  inFryer(x,y) then

        local xPos = math.min(x - CHICKEN_RADIUS, FRYER_X + FRYER_WIDTH - FRYER_OFFSET - CHICKEN_RADIUS * 2)
        xPos = math.max(xPos, FRYER_X + FRYER_OFFSET) -- this is at top left of burger


        local yPos = math.min(y - CHICKEN_RADIUS, FRYER_Y + FRYER_HEIGHT - FRYER_OFFSET - CHICKEN_RADIUS* 2)
        yPos = math.max(yPos, FRYER_Y + FRYER_OFFSET) -- this is at top left of burger

        table.insert(self.chickenTable, Chicken:new({xPos, yPos})) -- ew 
        
    end
end

function Chickens:checkChickens(mouseX, mouseY)
    for i, chicken in pairs(self.chickenTable) do 

        local mouse2centre = ((mouseX - chicken.x - chicken.radius)^2 + (mouseY - chicken.y - chicken.radius)^2)^0.5
        if mouse2centre < chicken.radius then
            return i 
        end
    end

    return 0
end

-- implement chicken fall function? fall off the FRYER

function Chickens:update(mouseX, mouseY, dt)
    if #self.chickenTable > 0 then
        for _, chicken in pairs(self.chickenTable) do
            chicken:update(dt)
        end

        if self.moveChickenIndex ~= 0 then
            self.chickenTable[self.moveChickenIndex]:move(mouseX, mouseY)
        end
    end
end

function Chickens:draw()
    for _, chicken in pairs(self.chickenTable) do
        chicken:draw()
    end
end
