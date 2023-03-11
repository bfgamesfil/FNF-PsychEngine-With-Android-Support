
function onUpdatePost()
	setProperty('iconP1.x', screenWidth - 445)
	setProperty('iconP2.x', 285)
end

function noteMiss()

	setProperty('iconP1.color', getColorFromHex('5f1ea4'))
	doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.4, 'linear')
end