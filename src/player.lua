player = {}


function player.load()
	player.x = (love.graphics.getWidth() / 2) - 16
	player.y = (love.graphics.getHeight() / 2) - 16
	player.xvel = 0
	player.yvel = 0
	player.friction = 7
	player.h = 32
	player.w = 32
	player.speed = 1000
	player.hp = 12
	player.mana = 12
	player.dmg = 10
	player.score = 0
end
function player:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle('fill', player.x, player.y, player.w, player.h)
end
function player:scoreCount()
	love.graphics.setColor(255, 255, 255)
	love.graphics.setFont(small)
	love.graphics.print("Score: " .. player.score, 32, 8)
end
function player:hpbar()
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(small)
	love.graphics.print("HP", 32, 544)
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle('line',64, 544, 192, 8)
	love.graphics.rectangle('fill', 64, 544, 16 * player.hp, 8)
--[[	if player.hp >= 1 then
		love.graphics.rectangle('fill', 64, 544, 16 ,8)
	end
	if player.hp >= 2 then
		love.graphics.rectangle('fill', 80, 544, 16, 8)
	end
	if player.hp >= 3 then
		love.graphics.rectangle('fill', 96, 544, 16, 8)
	end
	if player.hp >= 4 then
		love.graphics.rectangle('fill', 112, 544, 16, 8)
	end
	if player.hp >= 5 then
		love.graphics.rectangle('fill', 128, 544, 16, 8)	
	end
	if player.hp >= 6 then
		love.graphics.rectangle('fill', 144, 544, 16, 8)	
	end
	if player.hp >= 7 then
		love.graphics.rectangle('fill', 160, 544, 16, 8)	
	end
	if player.hp >= 8 then
		love.graphics.rectangle('fill', 176, 544, 16, 8)	
	end
	if player.hp >= 9 then
		love.graphics.rectangle('fill', 192, 544, 16, 8)	
	end
	if player.hp >= 10 then
		love.graphics.rectangle('fill', 208, 544, 16, 8)	
	end
	if player.hp >= 11 then
		love.graphics.rectangle('fill', 224, 544, 16, 8)	
	end
	if player.hp == 12 then
		love.graphics.rectangle('fill', 240, 544, 16, 8)	
	end	]]--
end
function player:manabar()
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(small)
	love.graphics.print("MP", 32, 560)
	love.graphics.setColor(0,0,255)
	love.graphics.rectangle('line',64, 560, 192, 8)
	love.graphics.rectangle('fill', 64, 560, 16 * player.mana, 8)
	--[[if player.mana >= 1 then
		love.graphics.rectangle('fill', 64, 560, 16 ,8)
	end
	if player.mana >= 2 then
		love.graphics.rectangle('fill', 80, 560, 16, 8)
	end
	if player.mana >= 3 then
		love.graphics.rectangle('fill', 96, 560, 16, 8)
	end
	if player.mana >= 4 then
		love.graphics.rectangle('fill', 112, 560, 16, 8)
	end
	if player.mana >= 5 then
		love.graphics.rectangle('fill', 128, 560, 16, 8)	
	end
	if player.mana >= 6 then
		love.graphics.rectangle('fill', 144, 560, 16, 8)	
	end
	if player.mana >= 7 then
		love.graphics.rectangle('fill', 160, 560, 16, 8)	
	end
	if player.mana >= 8 then
		love.graphics.rectangle('fill', 176, 560, 16, 8)	
	end
	if player.mana >= 9 then
		love.graphics.rectangle('fill', 192, 560, 16, 8)	
	end
	if player.mana >= 10 then
		love.graphics.rectangle('fill', 208, 560, 16, 8)	
	end
	if player.mana >= 11 then
		love.graphics.rectangle('fill', 224, 560, 16, 8)	
	end
	if player.mana == 12 then
		love.graphics.rectangle('fill', 240, 560, 16, 8)	
	end	]]--
end
function player:move(dt)
	if love.keyboard.isDown('w') and
	player.yvel > -player.speed then
		player.yvel = player.yvel - player.speed * dt
	end
	if love.keyboard.isDown('s') and
	player.yvel < player.speed then	
		player.yvel = player.yvel + player.speed * dt
	end
	if love.keyboard.isDown('a') and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end
	if love.keyboard.isDown('d') and
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
	end
end
function player:boundary()
	if player.y < 64 then
		player.y = 64
		player.yvel = 0
	end
	if player.x < 64 then
		player.x = 64
		player.xvel = 0
	end
	if player.y + player.h > 512 then
		player.y = 512 - player.h
		player.yvel = 0
	end
	if player.x + player.w > 512 then
		player.x = 512 - player.w
		player.xvel = 0
	end
end
function player:Physics(dt)
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.xvel = player.xvel *(1 - math.min(dt * player.friction, 1))
	player.yvel = player.yvel *(1 - math.min(dt * player.friction, 1))
end
function player:collide(dt)
	for i,v in ipairs(enemy) do
		if player.x + player.w > v.x and
		player.x < v.x + v.w and
		player.y + player.h > v.y and
		player.y < v.y + v.h then
		player.hp = player.hp - enemy.dmg * dt
		end
	end
end

--MAIN FUNCTIONS
function PLAYER_DRAW()
	player:draw()
	player:manabar()
	player:hpbar()
	player:scoreCount()
end

function PLAYER_UPDATE(dt)
	player:Physics(dt)
	player:boundary()
	player:move(dt)
	player:collide(dt)
	
end