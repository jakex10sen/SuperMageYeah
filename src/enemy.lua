enemy = {
	speed = 500,
	h = 20,
	w = 20,
	hp = 1,
	dmg = 10,
	friction = 7,
	timer = 0,
	timerLim = math.random(3, 5),
	amount = math.random(1, 3),
	side = math.random(1, 4),
	drop = math.random(1, 3),
}

function enemy:generate(dt)
	enemy.timer = enemy.timer + dt
	if enemy.timer > enemy.timerLim then
		--spawn the enemy
		for i=1,enemy.amount do 
			if enemy.side == 1 then
				--left
				--enemy:spawn(576/ 2, 576 / 2)
				enemy:spawn(64, math.random(64, 512))
			end
			if enemy.side == 2 then
				--top
				--enemy:spawn(576/ 2, 576 / 2)
				enemy:spawn(math.random(64, 512), 64)
			end
			if enemy.side == 3 then
				--right				
				--enemy:spawn(576/ 2, 576 / 2)
				enemy:spawn(512 - enemy.w, math.random(64, 512))
			end
			if enemy.side == 4 then
				--bottom
				--enemy:spawn(576/ 2, 576 / 2)
				enemy:spawn(math.random(64, 512), 512 - enemy.h)
			end
		enemy.side = math.random(1, 4)
		end

		enemy.amount = math.random(1, 3)
		enemy.timerLim = math.random(3, 5)
		enemy.timer = 0
	end
end

function enemy:spawn(x, y)
	table.insert(enemy, {x = x, y = y, xvel = 0, yvel = 0, w = enemy.w, h = enemy.h, hp = 1 + math.floor(player.score / 100), drop = math.random(1, 3)})
end

function enemy:draw()
	for i,v in ipairs(enemy) do
		love.graphics.setColor(255,255,255)
		love.graphics.rectangle('fill', v.x, v.y, v.w, v.h)
	end
end
function enemy:ai(dt)
	for i,v in ipairs(enemy) do
		if v.x > player.x then
			v.xvel = v.xvel - enemy.speed * dt
		end
		if v.x < player.x then
			v.xvel = v.xvel + enemy.speed * dt
		end
		if v.y > player.y then
			v.yvel = v.yvel - enemy.speed * dt
		end
		if v.y < player.y then 
			v.yvel = v.yvel + enemy.speed * dt
		end
		if v.hp <= 0 then
			player.score = player.score + 5
			if v.drop == 1 then 
				player.mana = player.mana + 1
			end
			table.remove(enemy, i)
		end
	end
end
function enemy:physics(dt)
	for i,v in ipairs(enemy) do
		v.x = v.x + (v.xvel * dt)
		v.y = v.y + (v.yvel * dt)
		v.xvel = v.xvel * ( 1 - math.min(dt *  enemy.friction, 1))
		v.yvel = v.yvel  * (1 - math.min(dt * enemy.friction, 1))
	end
end
function enemy:boundary()
	for i,v in ipairs(enemy) do
		if v.x < 64 then
			v.x = 64
			v.xvel = 0
		end
		if v.x + v.w > 512 then
			v.x = 512 - v.w
			v.xvel = 0
		end
		if v.y < 64 then
			v.y = 64
			v.yvel = 0
		end
		if v.y + v.h > 512 then
			v.y = 512 - v.h
			v.yvel = 0
		end
	end
end
--MAIN FUNCTIONS
function ENEMY_DRAW()
	enemy:draw()
end
function ENEMY_UPDATE(dt)
	enemy:generate(dt)
	enemy:boundary()
	enemy:ai(dt)
	enemy:physics(dt)
end