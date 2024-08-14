require 'constants'

Bin = {}

function Bin:load()
    self.bin = {
        x = BIN_X,
        y = BIN_Y,
        width = BIN_WIDTH,
        height = BIN_HEIGHT,
        offset = BIN_OFFSET,

        r = 0/255,
        g = 69/255,
        b = 45/255
    }

end

function Bin:draw()
    love.graphics.setColor(self.bin.r, self.bin.g, self.bin.b, 1)
    love.graphics.rectangle('fill', self.bin.x, self.bin.y, self.bin.width, self.bin.height)

    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle('fill', self.bin.x + self.bin.offset, self.bin.y + self.bin.offset, self.bin.width - self.bin.offset * 2, self.bin.height - self.bin.offset * 2)
end

