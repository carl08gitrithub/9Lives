local Player = {}
Player.__index = Player

function Player.new(x, y)
    local self = setmetatable({}, Player)

    self.x = x
    self.y = y

    self.width = 24
    self.height = 24

    self.speed = 180

    return self
end

function Player:update(dt, world)
    local dx = 0
    local dy = 0

    if love.keyboard.isDown("w","up") then
        dy = dy - 1
    end

    if love.keyboard.isDown("s","down") then
        dy = dy + 1
    end

    if love.keyboard.isDown("a", "left") then
        dx = dx - 1
    end

    if love.keyboard.isDown("d", "right") then
        dx = dx + 1
    end

    -- Prevent diagonal movement from being faster
    if dx ~= 0 or dy ~= 0 then
        local length = math.sqrt(dx*dx+dy*dy)

        dx = dx/length
        dy = dy/length
    end

    local newX = self.x + dx*self.speed*dt
    local newY = self.y + dy*self.speed*dt

    -- collision with environment
    if not world:isBlocked(newX, self.y, self.width,self.height) then
        self.x = newX
    end

    if not world:isBlocked(self.x, newY, self.width, self.height) then
        self.y = newY
    end
end

function Player:draw()
    love.graphics.setColor(1,1,1)

    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

return Player