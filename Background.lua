require 'constants'
require 'Hotplate'
require 'Dustbin'

Background = {}

function Background:load()
    Hotplate:load()
    Bin:load()
end

function Background:update()

end

function Background:draw()
    Hotplate:draw()
    Bin:draw()
end