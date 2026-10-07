local World = {}
World.__index = World

function World.new()

    local self = setmetatable({}, World)

    -- Objects the player cannot walk through
    self.walls = {

        -- Map border
        { x = 0,   y = 0,   width = 960, height = 20 },
        { x = 0,   y = 520, width = 960, height = 20 },
        { x = 0,   y = 0,   width = 20,  height = 540 },
        { x = 940, y = 0,   width = 20,  height = 540 },

        -- House
        { x = 70, y = 70, width = 220, height = 120 },

        -- Garden fence
        { x = 320, y = 70, width = 160, height = 20 },

        -- Store
        { x = 700, y = 70, width = 170, height = 120 },

        -- Bush area
        { x = 520, y = 80, width = 100, height = 100 },

        -- Bottom buildings
        { x = 70, y = 390, width = 180, height = 80 },
        { x = 700, y = 390, width = 170, height = 80 },
    }

    return self
end


function World:draw()

    -- Entire environment
    love.graphics.setColor(0.25, 0.55, 0.25)
    love.graphics.rectangle("fill", 0, 0, 960, 540)

    -- Main road
    love.graphics.setColor(0.25, 0.25, 0.25)
    love.graphics.rectangle(
        "fill",
        20,
        230,
        920,
        100
    )

    -- Sidewalk
    love.graphics.setColor(0.55, 0.55, 0.55)

    love.graphics.rectangle(
        "fill",
        20,
        210,
        920,
        20
    )

    love.graphics.rectangle(
        "fill",
        20,
        330,
        920,
        20
    )

    -- Draw buildings / obstacles
    love.graphics.setColor(0.7, 0.45, 0.3)

    -- House
    love.graphics.rectangle(
        "fill",
        70,
        70,
        220,
        120
    )

    -- Store
    love.graphics.setColor(0.3, 0.45, 0.7)

    love.graphics.rectangle(
        "fill",
        700,
        70,
        170,
        120
    )

    -- Bottom buildings
    love.graphics.setColor(0.65, 0.5, 0.4)

    love.graphics.rectangle(
        "fill",
        70,
        390,
        180,
        80
    )

    love.graphics.rectangle(
        "fill",
        700,
        390,
        170,
        80
    )

    -- Bush
    love.graphics.setColor(0.15, 0.4, 0.15)

    love.graphics.rectangle(
        "fill",
        520,
        80,
        100,
        100
    )

    -- Garden
    love.graphics.setColor(0.35, 0.7, 0.3)

    love.graphics.rectangle(
        "fill",
        320,
        70,
        160,
        120
    )

    -- Garden fence
    love.graphics.setColor(0.5, 0.3, 0.15)

    love.graphics.rectangle(
        "fill",
        320,
        70,
        160,
        10
    )

    -- Alley / exit
    love.graphics.setColor(0.15, 0.15, 0.15)

    love.graphics.rectangle(
        "fill",
        420,
        470,
        120,
        50
    )

    -- Labels
    love.graphics.setColor(1, 1, 1)

    love.graphics.print("HOUSE", 150, 120)
    love.graphics.print("GARDEN", 360, 120)
    love.graphics.print("BUSH", 550, 125)
    love.graphics.print("STORE", 760, 120)

    love.graphics.print("ROAD", 460, 270)

    love.graphics.print("ALLEY →", 440, 490)
end


function World:isBlocked(x, y, width, height)

    for _, wall in ipairs(self.walls) do

        if x < wall.x + wall.width
        and x + width > wall.x
        and y < wall.y + wall.height
        and y + height > wall.y then

            return true
        end
    end

    return false
end

return World