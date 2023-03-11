local a = 228;

function onUpdate()

if getProperty('dokidoki.x') == -1500 and getProperty('dokidoki.y') == -1000 then
	doTweenX('dokidoki.x','dokidoki',-1500-a,4,'linear')
	doTweenY('dokidoki.y','dokidoki',-1000-a,4,'linear')
end
	if getProperty('dokidoki.x') == -1500-a and getProperty('dokidoki.y') == -1000-a then
	setProperty('dokidoki.x', -1500)
	setProperty('dokidoki.y', -1000)
end
end