function mapLoad()
	tile1 = love.graphics.newImage('graphics/brick.png')
	tile0 = love.graphics.newImage('graphics/grass.png')
	map = 	{
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
			}
	canvas = love.graphics.newCanvas()
	mapDraw()
end
function mapDraw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255,255,255)
	love.graphics.setCanvas(canvas)
	for y=1, #map do
		for x=1, #map[y] do
			if map[y][x] == 1 then
				love.graphics.draw(tile1,x*32,y*32)
			elseif map[y][x] == 0 then
				love.graphics.draw(tile0, x * 32, y * 32)
			end
		end
	end
	love.graphics.setCanvas()
end

-- MAIN FUNCTIONS
function MAP_UPDATE(dt)

end

function MAP_DRAW()
	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.draw(canvas)
end