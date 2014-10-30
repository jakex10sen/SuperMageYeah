require('menu')
require('map')
require('player')
require('enemy')
require('bullet')
function love.load()
	small = love.graphics.newFont(18)
	medium = love.graphics.newFont(45)
	large = love.graphics.newFont(50)
	gamestate = "menu"
	mapLoad()
	player.load()
end

function love.draw()
	if gamestate == "playing" then
		if player.hp > 0 then
			MAP_DRAW()
			PLAYER_DRAW()
			ENEMY_DRAW()
			BULLET_DRAW()
		else
			love.graphics.setBackgroundColor(255,255,255)
			love.graphics.setColor(255,0,0)
			love.graphics.setFont(medium)
			love.graphics.printf("GAME OVER", love.graphics.getWidth() /2, love.graphics.getHeight() /2, 0, "center")
		end
	end
	if gamestate == "menu" then
		MENU_DRAW()
	end
	if gamestate == "control" then
		love.graphics.setBackgroundColor(150,150,150);
	end
end

function love.update(dt)
	if gamestate == "playing" then
		if player.hp > 0 then
			PLAYER_UPDATE(dt)
			ENEMY_UPDATE(dt)
			BULLET_UPDATE(dt)
		end
	end
	if gamestate == "menu" then
		MENU_UPDATE(dt)
	end
	if gamestate == "control" then
		
	end
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
	bullet.shoot(key)
end
function love.mousepressed(x, y)
	if gamestate == "menu" then
		buttonClick(x, y)
	end
end
