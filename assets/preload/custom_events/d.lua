local spacepress = 0
function onEvent(name, value1, value2)
	if name == 'd' then
		makeLuaSprite('Warn', 'warning', -430, 200)
		setLuaSpriteScrollFactor('Warn', 0, 0)
		addLuaSprite('Warn', true)
		scaleObject('Warn', 2, 2);
		

		playSound('alert', 1, 'QT')
		runTimer('second-beep', value1, 1)
		runTimer('alert-time', value2, 1)
	end
end

function onTimerCompleted(tag, Loops, LoopsLeft)
	if tag == 'alert-time' then
		if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') or botPlay then
			removeLuaSprite('Warn', false)
			playSound('attack', 1, 'Attack')
			characterPlayAnim('boyfriend', 'singRIGHT', true);
			characterPlayAnim('girlfriend', 'singRIGHT', true);
		else
		bruh = getProperty('health');
		setProperty('health', bruh - 0.8);
			playSound('attack', 1, 'Attack')
			removeLuaSprite('Warn', 'warning', true)
			characterPlayAnim('boyfriend', 'singRIGHTmiss', true);
			characterPlayAnim('girlfriend', 'singRIGHTmiss', true);
		end
	end
	if tag == 'second-beep' then
		playSound('alert', 1, 'QT')
	end
end
