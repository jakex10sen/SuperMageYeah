button = {}

function menuLoad()

end


function spawnButton(x, y, text, id)
	table.insert(button, {x = x, y = y, text = text, id = id})

end

function buttonDraw()
	for i,v in ipairs(button) do
		love.graphics.setFont(medium)
		love.graphics.setColor(255, 0, 0)
		love.graphics.rectangle('fill', v.x - (medium:getWidth(v.text)/2), v.y, medium:getWidth(v.text), medium:getHeight(v.text))
		love.graphics.setColor(0,0,0)
		love.graphics.print(v.text, v.x - (medium:getWidth(v.text)/2), v.y)
	end
end

function buttonClick(x, y)
	for i,v in ipairs(button) do
		if x > v.x - (medium:getWidth(v.text)/2) and 
		x < v.x + medium:getWidth(v.text) - (medium:getWidth(v.text)/2)and
		y > v.y and
		y < v.y + medium:getHeight(v.text) then
			if v.id == "quit" then
					-- body
				love.event.quit()
			end
			if v.id == "start" then
				gamestate = "playing"
			end
			if v.id == "control" then
				gamestate = "control"
			end
		end
	end
end
function mainMenuDraw()
	love.graphics.setFont(large)
	love.graphics.print("Super Mage Yeah!", (love.graphics.getWidth() / 2) - (large:getWidth("Super Mage Yeah!") / 2), 5)
	love.graphics.setBackgroundColor(255, 255, 255)
	buttonDraw()
end
function controlMenuDraw()
	love.graphics.setFont(large)
	love.graphics.print("Controls", (love.graohics.getWidth() /2) - (large:getWidth("Controls") / 2), 5)
	love.graphics.setBackgroundColor( 122, 122, 122)
	buttonDraw()
end

--MAIN FUNCTION
function MENU_DRAW()
	love.graphics.setFont(large)
	love.graphics.print("Super Mage Yeah!", (love.graphics.getWidth() / 2) - (large:getWidth("Super Mage Yeah!") / 2), 5)
	love.graphics.setBackgroundColor(255, 255, 255)
	buttonDraw()
end
function MENU_UPDATE(dt)
	spawnButton(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, "Start", "start")
	spawnButton(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + (medium:getHeight("Start") * 1.25), "Controls", "control")
	spawnButton(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + (medium:getHeight("Start")) + (medium:getHeight("Controls") * 1.5), "Quit", "quit")
end
