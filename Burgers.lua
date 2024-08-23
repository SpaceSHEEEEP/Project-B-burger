require 'constants'
require 'Healthbar_copy'
require 'Graphics'
require 'Particles'
require 'Burger'

Burgers = {}

-- Below is the table of burgers
function Burgers:load()
    burgerTable = {}
    moveBurgerIndex = nil
end

function Burgers:insert(x, y)

    if  x > HOTPLATE_X and 
        x < HOTPLATE_X + HOTPLATE_WIDTH and 
        y > HOTPLATE_Y and 
        y < HOTPLATE_Y + HOTPLATE_HEIGHT then

            local xPos = math.min(x - BURGER_RADIUS, HOTPLATE_X + HOTPLATE_WIDTH - BURGER_RADIUS * 2)
            xPos = math.max(xPos, HOTPLATE_X) -- this is at top left of burger


            local yPos = math.min(y - BURGER_RADIUS, HOTPLATE_Y + HOTPLATE_HEIGHT - BURGER_RADIUS* 2)
            yPos = math.max(yPos, HOTPLATE_Y) -- this is at top left of burger

            table.insert(burgerTable, Burger:new({xPos, yPos})) -- ew 
    end

end

function Burgers:checkBurgers(mouseX, mouseY)
    for i, burger in pairs(burgerTable) do 

        local mouse2centre = ((mouseX - burger.x - burger.radius)^2 + (mouseY - burger.y - burger.radius)^2)^0.5
        if mouse2centre < burger.radius then
            return i 
        end
    end

    return 0
end

function Burgers:move(index) -- maybe fix this? make it more organised? 
    moveBurgerIndex = index
end

-- implement burger fall function? fall off the hotplate

function Burgers:update(mouseX, mouseY, dt)
    if #burgerTable > 0 then
        for _, burger in pairs(burgerTable) do
            burger:update(dt)
        end

        if moveBurgerIndex ~= nil then
            burgerTable[moveBurgerIndex].x = mouseX - BURGER_RADIUS 
            burgerTable[moveBurgerIndex].healthbar.x = mouseX - BURGER_RADIUS
            burgerTable[moveBurgerIndex].y = mouseY - BURGER_RADIUS
            burgerTable[moveBurgerIndex].healthbar.y = mouseY - BURGER_RADIUS - HEALTHBAR_VERT_OFFSET
        end
    end
end

function Burgers:draw()
    for _, burger in pairs(burgerTable) do
        burger:draw()
    end
end

function generateBurger(xPos, yPos)
    local myTable = {
        radius = BURGER_RADIUS,
        x = xPos, -- top left
        y = yPos, -- top left
        rotation = math.random(math.random() * math.pi),
    
        r = 194/255,
        g = 143/255,
        b = 152/255,

        -- healthbar = generateHealthBar(xPos, yPos - HEALTHBAR_VERT_OFFSET),
        healthbar = Healthbar:new({x = xPos, y = yPos - HEALTHBAR_VERT_OFFSET, timeLimit = BURGER_TIME_LIMIT}),

        update = function(self, dt)
            self.healthbar:update(dt)
        end,

        draw = function(self)
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
    }

    return myTable
end
