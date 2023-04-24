function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "bullet"

    player = Player()
    enemy = Enemy()
    -- table of bullets
    listOfBullets = {}

    background = love.graphics.newImage("background-drip-candy.png")
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i, v in ipairs(listOfBullets) do
        v:update(dt)

        --Each bullets checks if there is collision with the enemy
        v:checkCollision(enemy)

        --If the bullet has the property dead and it's true then..
        if v.dead then
            --Remove it from the list
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    love.graphics.push()
    love.graphics.scale(0.6, 0.6)
    love.graphics.draw(background, 0, 0)
    love.graphics.pop()

    player:draw()
    enemy:draw()

    for i,v in ipairs(listOfBullets) do
        v:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
end
