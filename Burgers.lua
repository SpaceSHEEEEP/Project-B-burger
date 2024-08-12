require 'constants'
require 'Healthbar'

Burgers = {}

-- Below is the table of burgers
local burgerTable = {}

local moveBurgerIndex = nil

function Burgers:insert(x, y)

    if  x > HOTPLATE_X and 
        x < HOTPLATE_X + HOTPLATE_WIDTH and 
        y > HOTPLATE_Y and 
        y < HOTPLATE_Y + HOTPLATE_HEIGHT then

            local xPos = math.min(x - BURGER_WIDTH / 2, HOTPLATE_X + HOTPLATE_WIDTH - BURGER_WIDTH)
            xPos = math.max(xPos, HOTPLATE_X)


            local yPos = math.min(y - BURGER_HEIGHT / 2, HOTPLATE_Y + HOTPLATE_HEIGHT - BURGER_HEIGHT)
            yPos = math.max(yPos, HOTPLATE_Y)

            table.insert(burgerTable, generateBurger(xPos, yPos))
    end

end

function Burgers:checkBurgers(mouseX, mouseY)
    for i, burger in pairs(burgerTable) do 
        if  mouseX < burger.x + burger.width and mouseX > burger.x and
            mouseY < burger.y + burger.height and mouseY > burger.y then
            return i    
        end
    end

    return 0
end

function Burgers:move(index)
    moveBurgerIndex = index
end

function Burgers:update(mouseX, mouseY, dt)
    for _, burger in pairs(burgerTable) do
        burger:update(dt)
    end

    if moveBurgerIndex ~= nil then
        burgerTable[moveBurgerIndex].x = mouseX - BURGER_WIDTH/2
        burgerTable[moveBurgerIndex].healthbar.x = mouseX - BURGER_WIDTH/2
        burgerTable[moveBurgerIndex].y = mouseY - BURGER_HEIGHT/2
        burgerTable[moveBurgerIndex].healthbar.y = mouseY - BURGER_HEIGHT/2 - HEALTHBAR_VERT_OFFSET
    end
end

function Burgers:draw()
    for _, burger in pairs(burgerTable) do
        burger:draw()
    end
end

function generateBurger(xPos, yPos)
    local myTable = {
        x = xPos,
        y = yPos,
        width = BURGER_WIDTH,
        height = BURGER_HEIGHT,
    
        r = 194/255,
        g = 143/255,
        b = 152/255,

        healthbar = generateHealthBar(xPos, yPos - HEALTHBAR_VERT_OFFSET),

        update = function(self, dt)
            self.healthbar:update(dt)
        end,

        draw = function(self)
            if self.healthbar.modified == 0 then
                love.graphics.setColor(self.r, self.g, self.b, 1)
                love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) 
            elseif self.healthbar.modified == 1 then
                love.graphics.setColor(self.r - 90/255, self.g - 90/255, self.b - 90/255, 1)
                love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) 

            elseif self.healthbar.modified == 2 then
                love.graphics.setColor(self.r - 140/255, self.g - 140/255, self.b - 140/255, 1)
                love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) 
            end
            
            self.healthbar:draw()
        end
    }

    return myTable
end
