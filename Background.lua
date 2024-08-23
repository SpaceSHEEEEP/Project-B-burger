require 'constants'
require 'Hotplate'
require 'Fryer'
require 'Dustbin'

Background = {}

function Background:load()
    Hotplate:load()
    Fryer:load()
    Bin:load()
end

function Background:update()

end

function Background:draw()
    Hotplate:draw()
    Fryer:draw()
    Bin:draw()
end