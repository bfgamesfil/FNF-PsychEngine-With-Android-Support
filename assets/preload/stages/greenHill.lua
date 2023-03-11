function onCreate()

	-- The burning sky.
	makeLuaSprite('sky', 'justbfgames/BGSky', -250, -130);
	setScrollFactor('sky', 0.3, 0.3);

	-- What's nice is that all the assets for this song are 1920x1080 and are already placed where they need to be. So, as long as they're in relation to the grass, they can have the same values.
	-- Right after I wrote that, I had to micro manage each value. Awesome.
	-- A little while after I wrote those two, Stamps reminded me of Cycoxius's old assets from 1.0. So now I'm using those.
	makeLuaSprite('grass', 'justbfgames/Grass', -400, 50);
	scaleObject('grass', 1.2, 1);

	makeLuaSprite('yuri', 'justbfgames/Yuri', -300, -30);

	makeLuaSprite('arm', 'justbfgames/Arm', 300, -100);


	-- The brush behind the main grass.
	makeLuaSprite('backGrass', 'justbfgames/OuterBush', -300, 0);
	setScrollFactor('backGrass', 0.85, 0.85);
	scaleObject('backGrass', 1.1, 1);

	-- The trees in the foreground.
	makeLuaSprite('foreTrees', 'justbfgames/TreesFG', -380, -250);
	setScrollFactor('foreTrees', 1.2, 1.1);
	scaleObject('foreTrees', 1.1, 1.4);

	-- The brush at the top of the screen.
	makeLuaSprite('bushTop', 'justbfgames/OuterBushUp', -400, -100);
	setScrollFactor('bushTop', 0.95, 0.95);
	scaleObject('bushTop', 1.1, 1);

	-- The trees in the far background.
	makeLuaSprite('treesBack', 'justbfgames/TreesMidBack', -400, -250);
	setScrollFactor('treesBack', 0.4, 0.4);
	scaleObject('treesBack', 1.1, 1.1);

	-- The palm trees in the middle of the stage.
	makeLuaSprite('palmsMid', 'justbfgames/TreesMid', -300, -250);
	setScrollFactor('palmsMid', 0.5, 0.5);

	-- The palms around the middle ones.
	makeLuaSprite('palmsAround', 'justbfgames/TreesOuterMid1', -300, -250);
	setScrollFactor('palmsAround', 0.4, 0.4);

	-- The palms on the sides of the stage.
	makeLuaSprite('palmsSides', 'justbfgames/TreesOuterMid2', -300, -250);
	setScrollFactor('palmsSides', 0.6, 0.6);

	-- The pines on the left and right side of the stage.
	makeLuaSprite('treesLeft', 'justbfgames/TreesLeft', -600, -50);
	setScrollFactor('treesLeft', 0.75, 0.75);
	scaleObject('treesLeft', 1.3, 1.2);

	makeLuaSprite('treesRight', 'justbfgames/TreesRight', -470, -50);
	setScrollFactor('treesRight', 0.7, 0.7);
	scaleObject('treesRight', 1.2, 1.2);


	-- SASTER JUMPSCARE.
	makeLuaSprite('saster', 'SasterJumpscare', 0, 0);
	setObjectCamera('saster', 'other');
	scaleObject('saster', 2, 1.125);

	-- MONICUM JUMPSCARE.
	makeLuaSprite('monicum', 'Monicum', 200, 0);
	setObjectCamera('monicum', 'other');
	scaleObject('monicum', 4.5, 2.9);


	makeLuaSprite('skyWatch', 'sheWatches', -250, -130);
	setScrollFactor('skyWatch', 0.3, 0.3);
	scaleObject('skyWatch', 0.7, 0.6);



	-- The black fade-in at the beginning of the song for *atmosphere.*
	makeLuaSprite('black', 'Black', 0, 0);
	setObjectCamera('black', 'hud');

	addLuaSprite('sky', false);
	addLuaSprite('skyWatch', false);
	addLuaSprite('treesBack', false);
	addLuaSprite('palmsAround', false);
	addLuaSprite('palmsMid', false);
	addLuaSprite('palmsSides', false);
	addLuaSprite('treesLeft', false);
	addLuaSprite('treesRight', false);
	addLuaSprite('backGrass', false);
	addLuaSprite('bushTop', false);
	addLuaSprite('grass', false);
	addLuaSprite('yuri', false);
	addLuaSprite('arm', false);
	addLuaSprite('foreTrees', true);

	addLuaSprite('black', true);
	addLuaSprite('saster', true);
	addLuaSprite('monicum', true);
end

function onCreatePost()

	-- Hiding the "jumpscares."
	setProperty('saster.alpha', 0);

	setProperty('monicum.alpha', 0);


	setProperty('skyWatch.alpha', 0);

end


-- Removing the countdown for atmospheric reasons. Had to do a ton of digging in Playstate.hx to figure out how to do this in a Lua script. Feel free to use this in anything you want!

function onStartCountdown()

	setProperty('introSoundsSuffix', 'a');

	-- Fading the black screen at the beginning of the song. Be sure to remove this line of code and this note if you plan on using the countdown remover on its own!
	doTweenAlpha('blackFade', 'black', 0, 2, 'quadIn');

end

function onCountdownTick(swagCounter)

	if swagCounter == 1 then
		setProperty('countdownReady.visible', false);
	end

	if swagCounter == 2 then
		setProperty('countdownSet.visible', false);
	end

	if swagCounter == 3 then
		setProperty('countdownGo.visible', false);
	end

end

-- End of the countdown removal code. (For copy+paste convenience)


-- Making the Saster "jumpscare" a function that can be called on multiple times. Better to do this than have two sets of the same exact code. This way, you can change a value and have it change everywhere.
function saster()

	setProperty('saster.alpha', 1);

	cameraShake('other', 0.02, 0.2);

	doTweenAlpha('sasterFade', 'saster', 0, 0.8, 'sineIn');

end

stepHitFuncs = {

	[1] = function()
		-- Deleting the black screen at the beginning of the song. We don't need it anymore.
		removeLuaSprite('black', true)
	end,

	[793] = function()
		doTweenAlpha('skyFade', 'skyWatch', 1, 90, 'linear');
	end,

	[1306] = function()
		-- Playing the character animation, fading the HUD away, and zooming in a bit.
		triggerEvent('Play Animation', 'tip', 'dad');
		doTweenAlpha('hudFade', 'camHUD', 0, 0.6, 'linear');
		setProperty('defaultCamZoom', 0.9);
	end,

	[1337] = function()
		-- SASTER JUMPSCARE.
		saster()
	end,

	[1364] = function()
		-- MONICUM JUMPSCARE. We set the alpha to max to make it appear, shake the camera, and then fade it away.
		setProperty('monicum.alpha', 1);
		cameraShake('other', 0.01, 0.4);
		doTweenAlpha('monicumFade', 'monicum', 0, 1.1, 'sineIn');
	end,

	[1385] = function()
		-- Did you know that Mismatch is my undisputed favorite FNF song? It's actually so ridiculously good, give it a listen.
		saster()
	end,

	[1422] = function()
		-- HUD coming back.
		doTweenAlpha('hudReturn', 'camHUD', 1, 0.8, 'linear');
	end,

	[1433] = function()
		-- Zooming back out.
		setProperty('defaultCamZoom', 0.75);
	end

}


-- Executing the stepHitFuncs at the step they're assigned to.
function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

	--if curStep > 792 and curStep < 1049 then
	--	if curStep % 4 == 3 then
	--		triggerEvent('Add Camera Zoom', 0.03, 0.02);
	--	end
	--end
end