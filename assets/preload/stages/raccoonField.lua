function onCreate()
	-- The floor. Had to squeeze it vertically in order to be faithful to the Sonic.exe version.
	makeLuaSprite('ground', 'ladyY/floor', -1450, -200);
	scaleObject('ground', 5, 2.75);

	-- The mountains in the far background. Had to shrink them a tad to fit better in frame.
	makeLuaSprite('mountains', 'ladyY/mountains', -500, -360);
	scaleObject('mountains', 3.0, 3.0);
	setLuaSpriteScrollFactor('mountains', 0.2, 0.2);

	-- The, uh...sky.
	makeLuaSprite('sky', 'ladyY/sky', -400, -300);
	scaleObject('sky', 2.0, 1.5);
	setLuaSpriteScrollFactor('sky', 0.1, 0.1);

	-- The second layer of ground behind the front one to give the illusion of more space.
	makeLuaSprite('groundBack', 'ladyY/floor', -1450, -300);
	scaleObject('groundBack', 5, 2.75);
	setProperty('groundBack.flipX', true);
	setLuaSpriteScrollFactor('groundBack', 0.7, 0.7);

	-- The third layer of ground behind the others.
	makeLuaSprite('groundFar', 'ladyY/floor', -450, -80);
	scaleObject('groundFar', 2.5, 1.5);
	setLuaSpriteScrollFactor('groundFar', 0.35, 0.35);

	-- The hands in the middle.
	makeAnimatedLuaSprite('hands', 'ladyY/NotKnuckles', 230, -30);
	addAnimationByPrefix('hands', 'loop', 'Notknuckles', 24, true);
	scaleObject('hands', 0.9, 0.9);

	-- That stupid fucking flower thing on the side.
	makeAnimatedLuaSprite('fuckingFlower', 'ladyY/WeirdAssFlower', -200, 20);
	addAnimationByPrefix('fuckingFlower', 'loop', 'flower', 24, true);
	scaleObject('fuckingFlower', 1.4, 1.4);
	setLuaSpriteScrollFactor('fuckingFlower', 0.7, 0.7);

	-- The tree on BF's side.
	makeLuaSprite('tree', 'ladyY/tree', -600, -500);
	scaleObject('tree', 3.3, 3.3);

	-- The tree in the far background on the left
	makeLuaSprite('treeBack', 'ladyY/tree', -690, 20);
	scaleObject('treeBack', 0.23, 0.23);
	setLuaSpriteScrollFactor('treeBack', 2.25, 2.25);

	-- The small flower in front of Lady Y.
	makeLuaSprite('flower1', 'ladyY/smallflower', -760, 100);
	scaleObject('flower1', 2.5, 2.5);
	setLuaSpriteScrollFactor('flower1', 1.1, 1.1);

	-- The flower in front of BF.
	makeLuaSprite('flower2', 'ladyY/smallflower', -350, 160);
	scaleObject('flower2', 3.0, 3.0);
	setProperty('flower2.flipX', true);
	setLuaSpriteScrollFactor('flower2', 1.2, 1.1);

	-- The flower right behind BF.
	makeLuaSprite('flower3', 'ladyY/smallflower', -200, 0);
	scaleObject('flower3', 2.0, 2.0);
	setProperty('flower3.flipX', true);

	-- The flower in the far background on the right.
	makeLuaSprite('flower4', 'ladyY/smallflower', 950, 115);
	scaleObject('flower4', 0.95, 1.0);
	setLuaSpriteScrollFactor('flower4', 0.45, 0.45);


	-- Adding and layering the different background objects into the stage.
	addLuaSprite('sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('groundFar', false);
	addLuaSprite('treeBack', false);
	addLuaSprite('flower4', false);
	addLuaSprite('groundBack', false);
	addLuaSprite('fuckingFlower', false);
	addLuaSprite('ground', false);
	addLuaSprite('flower3', false);
	addLuaSprite('hands', false);
	addLuaSprite('tree', false);
	addLuaSprite('flower1', true);
	addLuaSprite('flower2', true);
end

local alphaTimer = true;

-- Notes go bye-bye at the start of the song for dramatic effect.
function onUpdate()
	if alphaTimer == true then
		for i = 0,7,1 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
		end
	end
end

-- Notes phase back into existence.
function onStepHit()
	if curStep == 116 then
		for i=0,7,1 do
			noteTweenAlpha('tweenOut' ..i, i, 1, 1, 'linear');
		end
	end

	if curStep == 100 then
		alphaTimer = false;
	end
end

--[[
	Instead of having 8 different individual tweens to fade all 8 notes, I use a "for" statement. If you want thorough information on the subject, head to https://www.lua.org/pil/4.3.4.html

In essence, the "for" statement allows for many individual items to be made with just a few lines of code.
Everything between the "do" and "end" will be looped a number of times that is dictated by what comes after the "for."
The statement is structured like this:

	for var = int1, int2, int3 do
		debugPrint('Your number is ' .. var);
	end

"var" can be any variable you wish to use. "i" tends to be used because it's small and easy. You don't have to define this variable prior.
"int1" is your first integer. It is the number that the function starts on.
"int2" is your second integer. It is the number that the function ends on.
"int3" is your third integer. It is the number that the function will count up by on each loop. If you don't have a third integer, it defaults to counting by 1.

The print command outputs a small string of text and then the integer value. To combine variables into strings, you can use two periods. Usually it's &&, but Lua is weird.
]]