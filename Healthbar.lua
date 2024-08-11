require 'constants'

function generateHealthBar(xPos, yPos)
    local myTable = {
        x = xPos,
        y = yPos,
        width = HEALTHBAR_WIDTH,
        widthBlue = HEALTHBAR_WIDTH,
        height = HEALTHBAR_HEIGHT,
        timer = 0,
        timeLimit = BURGER_TIME_LIMIT,
        modified = 0,

        update = function(self, dt)
            if self.modified == 0 then
                if self.timer < self.timeLimit then
                    self.timer = self.timer + dt
                    self.widthBlue = self.width * (1 - self.timer / self.timeLimit)
                else
                    self.timer = 0
                    self.modified = 1
                end
            elseif self.modified == 1 then
                if self.timer < self.timeLimit then
                    self.timer = self.timer + dt
                    self.widthBlue = self.width * (1 - self.timer / self.timeLimit)
                else 
                    self.timer = 0
                    self.modified = 2
                end
            elseif self.modified == 2 then
                if self.timer < self.timeLimit then
                    self.timer = self.timer + dt
                    self.widthBlue = self.width * (1 - self.timer / self.timeLimit)
                else 
                    self.timer = 0
                    self.modified = 3
                end
            end
        end,

        draw = function(self)
            love.graphics.setColor(1, 0, 0, 1) -- red
            love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
            
            love.graphics.setColor(0, 0, 1, 1) -- blue
            love.graphics.rectangle('fill', self.x, self.y, self.widthBlue, self.height)
        end
    }

    return myTable
end