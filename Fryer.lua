require 'constants'

Fryer = {}

function Fryer:load()
    -- hotplate 
    self.fryer = {
        x = FRYER_X,
        y = FRYER_Y,
        width = FRYER_WIDTH,
        height = FRYER_HEIGHT,
        offset = FRYER_OFFSET,

        r = 85/255,
        g = 85/255,
        b = 85/255
    }

end

function Fryer:draw()
    love.graphics.setColor(self.fryer.r, self.fryer.g, self.fryer.b, 1)
    love.graphics.rectangle('fill', self.fryer.x, self.fryer.y, self.fryer.width, self.fryer.height)

    love.graphics.setColor(201/255, 118/255, 26/255, 1)
    love.graphics.rectangle('fill', self.fryer.x + self.fryer.offset, self.fryer.y + self.fryer.offset, self.fryer.width - 2*self.fryer.offset, self.fryer.height - 2*self.fryer.offset)
end