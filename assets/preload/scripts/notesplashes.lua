--Original By (•‿•)Nasrat02(•‿•)
--Optimized By DubstepEnderDragon
function onCreatePost()
    makeAnimatedLuaSprite('Left', 'noteSplashes', 0, 0)
    makeAnimatedLuaSprite('Down', 'noteSplashes', 0, 0)
    makeAnimatedLuaSprite('Up', 'noteSplashes', 0, 0)
    makeAnimatedLuaSprite('Right', 'noteSplashes', 0, 0)
    addAnimationByPrefix('Left', 'LeftS', 'note splash purple', 24, false)
    addAnimationByPrefix('Down', 'DownS', 'note splash blue', 24, false)
    addAnimationByPrefix('Up', 'UpS', 'note splash green', 24, false)
    addAnimationByPrefix('Right', 'RightS', 'note splash red', 24, false)
    setObjectCamera('Left', 'hud')
    setObjectCamera('Down', 'hud')
    setObjectCamera('Up', 'hud')
    setObjectCamera('Right', 'hud')
    addLuaSprite('Left', true)
    addLuaSprite('Down', true)
    addLuaSprite('Up', true)
    addLuaSprite('Right', true)
    setProperty('Left.alpha', 0)
    setProperty('Down.alpha', 0)
    setProperty('Up.alpha', 0)
    setProperty('Right.alpha', 0)
end

function onUpdate()
    LeftPosX = getPropertyFromGroup('opponentStrums', 0, 'x') - 125
    setProperty('Left.x', LeftPosX)
    LeftPosY = getPropertyFromGroup('opponentStrums', 0, 'y') - 125
    setProperty('Left.y', LeftPosY)
    DownPosX = getPropertyFromGroup('opponentStrums', 1, 'x') -125
    setProperty('Down.x', DownPosX)
    DownPosY = getPropertyFromGroup('opponentStrums', 1, 'y') -125
    setProperty('Down.y', DownPosY)
    UpPosX = getPropertyFromGroup('opponentStrums', 2, 'x') -125
    setProperty('Up.x', UpPosX)
    UpPosY = getPropertyFromGroup('opponentStrums', 2, 'y') -125
    setProperty('Up.y', UpPosY)
    RightPosX = getPropertyFromGroup('opponentStrums', 3, 'x') -125
    setProperty('Right.x', RightPosX)
    RightPosY = getPropertyFromGroup('opponentStrums', 3, 'y') -125
    setProperty('Right.y', RightPosY)
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
        if noteData == 0 then
            objectPlayAnimation('Left', 'LeftS', false)
            setProperty('Left.alpha', 0.5)
            runTimer('SLeft', 0.15, 1)
        end
        if noteData == 1 then
            objectPlayAnimation('Down', 'DownS', false)
            setProperty('Down.alpha', 0.5)
            runTimer('SDown', 0.15, 1)
        end
        if noteData == 2 then
            objectPlayAnimation('Up', 'UpS', false)
            setProperty('Up.alpha', 0.5)
            runTimer('SUp', 0.15, 1)
        end
        if noteData == 3 then
            objectPlayAnimation('Right', 'RightS', false)
            setProperty('Right.alpha', 0.5)
            runTimer('SRight', 0.15, 1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'SLeft' then
        setProperty('Left.alpha', 0)
    end
    if tag == 'SDown' then
        setProperty('Down.alpha', 0)
    end
    if tag == 'SUp' then
        setProperty('Up.alpha', 0)
    end
    if tag == 'SRight' then
        setProperty('Right.alpha', 0)
    end
end