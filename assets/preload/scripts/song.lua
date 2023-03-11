local author = 'dregofugo'

function onCreate()
    makeLuaSprite('intro1','intro1',-1000,165)
    setObjectCamera('intro1','other')
    setProperty('intro1.alpha',0.7)
    addLuaSprite('intro1')

    makeLuaText('songtext',songName,400,0,200)
    setTextSize('songtext',40)
    setObjectCamera('songtext','other')
    setTextAlignment('songtext','center')
    addLuaText('songtext')

end
function onCreatePost()
    doTweenX('songtweenin','intro1',0,1,'cubeOut')
end

function onUpdate()
    setProperty('songtext.x',getProperty('intro1.x'))
    setProperty('authortext.x',getProperty('intro1.x'))
end

function onTweenCompleted(tag)
    if tag == 'songtweenin' then
        runTimer('tweentimer',5)
    end
    if tag == 'songtweenout' then
        removeLuaText('authortext')
        removeLuaText('songtext')
        removeLuaSprite('intro1')
    end
end

function onTimerCompleted(tag)
    if tag == 'tweentimer' then
        doTweenX('songtweenout','intro1',-1000,1,'cubeIn')
    end
end