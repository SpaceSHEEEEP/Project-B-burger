require 'constants'

Bin = {}

function Bin:load()
    self.bin = {
        x = BIN_X,
        y = BIN_Y,
        width = BIN_WIDTH,
        height = BIN_HEIGHT,

        r = 0,
        g = 150,
        b = 0
    }

    
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