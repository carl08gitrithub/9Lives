local Player = require("player")
local World = require("world")

local player
local world

function love.load()
    love.window.setTitle("9Lives")
    love.window.setMode(960, 540)

    world = World.new()
    player = Player.new(100, 300)
end

function love.update(dt)
    player:update(dt, world)
end

function love.draw()
    world:draw()
    player:draw()
end