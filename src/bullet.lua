bullet = {
	speed = 150,
	count = 0,
	image = love.graphics.newImage('graphics/fball.png'),
	h = love.graphics.newImage('graphics/fball.png'):getHeight(),
	w = love.graphics.newImage('graphics/fball.png'):getWidth(),
}

function bullet.collide()
	for i,v in ipairs(enemy) do
		for ia,va in ipairs(bullet) do
			if va.x + va.w > v.x and
				va.x < v.x + v.w and
				va.y + va.h > v.y and
				va.y < v.y + v.h then
				v.hp = v.hp - 1
				table.remove(bullet, ia)
			end
		end
	end
end

function bullet.move(dt)
	for i,v in ipairs(bullet) do
		if v.dir == "right" then
			v.x= v.x + bullet.speed * dt
		end
		if v.dir == "left" then
			v.x = v.x - bullet.speed * dt
		end
		if v.dir == "down" then
			v.y = v.y + bullet.speed * dt
		end
		if v.dir == 'up' then
			v.y = v.y - bullet.speed * dt
		end
		end
end

function bullet.boundary()
	for i,v in ipairs(bullet) do
		if v.y + bullet.h > 544 then
			table.remove(bullet, i)
		end
		if v.x + bullet.w > 544 then
			table.remove(bullet, i)
		end
		if v.x < 64 then
			table.remove(bullet, i)
			
		end
		if v.y < 64 then
			table.remove(bullet, i)
		end
	end
end



function bullet.spawn(x, y, dir)
	table.insert(bullet, {x=x, y=y, dir=dir, w = bullet.w, h = bullet.h})
	player.mana = player.mana -1
end

function bullet.draw() 
	for i,v in ipairs(bullet) do
		love.graphics.setColor(255,255,255)
		if  v.dir == "up" then
			love.graphics.draw(bullet.image, v.x, v.y, math.rad(0), 1, 1, bullet.w/2, bullet.h/2)
		elseif v.dir == "right" then
			love.graphics.draw(bullet.image, v.x, v.y, math.rad(90), 1,  1, bullet.w/2, bullet.h/2)
		elseif v.dir == "down" then
			love.graphics.draw(bullet.image, v.x, v.y, math.rad(180), 1,  1, bullet.w/2, bullet.h/2)
		elseif v.dir == "left" then
			love.graphics.draw(bullet.image, v.x, v.y, math.rad(270), 1,  1, bullet.w/2, bullet.h/2)
		end
	end
	if player.mana == 0 then
		love.graphics.setColor(152,0,152)
		love.graphics.printf("'R' to regen mana", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, "center")
	end
end

function bullet.shoot(key)
	if key == "r" then
		player.mana = 12
	end
	if player.mana > 0 then
		if key == "right" then
			bullet.spawn(player.x + player.w, player.y + player.h/2, 'right')
		elseif key == "left" then
			bullet.spawn(player.x, player.y + player.h/2, 'left')
		elseif key == "up" then
			bullet.spawn(player.x + player.w/2, player.y, 'up')
		elseif key == 'down' then
			bullet.spawn(player.x + player.w/2, player.y + player.h, 'down')
		end
	else 
		love.graphics.setColor(255,0,0)
		love.graphics.setFont(small)
		love.graphics.print("RELOAD!", 50, 550)
	end
end






--MAIN FUNCTIONS
function BULLET_DRAW()
	bullet.draw()
end
function BULLET_UPDATE(dt)
	bullet.move(dt)
	bullet.collide()
	bullet.boundary()
end