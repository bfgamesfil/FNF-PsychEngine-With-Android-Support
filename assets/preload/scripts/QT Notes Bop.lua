local strumLinePlayer
local strumLineOpponent
local sicks
local goods
local bads
local shits
local moveAmount = 20
function onCreatePost()
    for i = 0, 3 do
        strumLinePlayer = getPropertyFromGroup('strumLineNotes', i + 4, 'y')
        strumLineOpponent = getPropertyFromGroup('strumLineNotes', i, 'y')
    end
    sicks = getProperty("sicks")
    goods = getProperty("goods")
    bads = getProperty("bads")
    shits = getProperty("shits")
end

function onUpdatePost(elapsed)
    if downscroll then
        if sicks then
            moveAmount = 20
        elseif goods then
            moveAmount = 15
        elseif bads then
            moveAmount = 10
        elseif shits then
            moveAmount = 5
        end
    else
        if sicks then
            moveAmount = -20
        elseif goods then
            moveAmount = -15
        elseif bads then
            moveAmount = -10
        elseif shits then
            moveAmount = -5
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    for i = 0, 3 do
        if noteData == i and not isSustainNote then
            noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer + moveAmount, 0.1, 'circOut')
            runTimer('returnPlayer' .. i, 0.1, 1)
        end
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    for i = 0, 3 do
        if noteData == i and not isSustainNote then
            noteTweenY('moveOpponent' .. i, i, strumLineOpponent + moveAmount, 0.1, 'circOut')
            runTimer('returnOpponent' .. i, 0.1, 1)
        end
    end
end

function onTimerCompleted(tag, loop, loopsLeft)
    for i = 0, 3 do
        if tag == 'returnPlayer' .. i then
            noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer, 0.1, 'circOut')
        elseif tag == 'returnOpponent' .. i then
            noteTweenY('moveOpponent' .. i, i, strumLineOpponent, 0.1, 'circOut')
        end
    end
end