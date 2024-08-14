require 'Graphics'

Particles = {}

function Particles:load()
	local img = burnt_patty

	psystem = love.graphics.newParticleSystem(img, 20)
	psystem:setParticleLifetime(2, 6) -- Particles live at least 2s and at most 5s.
	psystem:setEmissionRate(5)
    psystem:setSizes(0.5, 0.25, 0.125)
	psystem:setSizeVariation(1)
    psystem:setLinearAcceleration(-5, -20, 5, -5)
	psystem:setColors(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0) -- Fade to transparency.

    particleCoordinates = {}
end

function Particles:add(xCoor, yCoor)
    table.insert(particleCoordinates, {xCoor, yCoor})
end

--[[ function Particles:remove(xCoor, yCoor)
    table.remove(particleCoordinates, {xCoor, yCoor})
end ]]

function Particles:draw(xCoor, yCoor)
    --[[ for _, coor in pairs(particleCoordinates) do 
        love.graphics.draw(psystem, coor[1], coor[2])
    end ]]
    love.graphics.draw(psystem, xCoor, yCoor)
end

function Particles:update(dt)
	psystem:update(dt)
end