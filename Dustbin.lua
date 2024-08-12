require 'constants'

Bin = {}

function Bin:load()
    self.bin = {
        x = BIN_X,
        y = BIN_Y,
        width = BIN_WIDTH,
        height = BIN_HEIGHT,
        offset = BIN_OFFSET,

        r = 0,
        g = 10,
        b = 0
    }

end

function Bin:draw()
    love.graphics.setColor(self.bin.r, self.bin.g, self.bin.b, 1)
    love.graphics.rectangle('fill', self.bin.x, self.bin.y, self.bin.width, self.bin.height)

    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle('fill', self.bin.x + self.bin.offset, self.bin.y + self.bin.offset, self.bin.width - self.bin.offset * 2, self.bin.height - self.bin.offset * 2)
end


--[[
below is for reference

Hotplate = {}

function Hotplate:load()
    -- hotplate 
    self.hotplate = {
        x = HOTPLATE_X,
        y = HOTPLATE_Y,
        width = HOTPLATE_WIDTH,
        height = HOTPLATE_HEIGHT,

        r = 105/255,
        g = 105/255,
        b = 105/255
    }

    self.tableTest = {text = 'hello'}
end

function Hotplate:draw()
    love.graphics.setColor(self.hotplate.r, self.hotplate.g, self.hotplate.b, 1)
    love.graphics.rectangle('fill', self.hotplate.x, self.hotplate.y, self.hotplate.width, self.hotplate.height)
end
]]