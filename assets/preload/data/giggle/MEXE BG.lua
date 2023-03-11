function onEvent(name, value1, value2)
    if name == "MEXE BG" then
    choose = tonumber(value1);
    if (choose == 0) then
    doTweenAlpha('dokidoki', 'dokidoki', 1, 0.25, 'linear'); 
    doTweenAlpha('BG', 'BG', 0, 0.25, 'linear'); 
    doTweenAlpha('BLOOD', 'BLOOD', 0, 0.25, 'linear'); 
    doTweenAlpha('BGSayori', 'BGSayori', 0, 0.25, 'linear'); 
    doTweenAlpha('black', 'black', 0, 0.25, 'linear'); 
    doTweenAlpha('godrays', 'godrays', 0, 0.25, 'linear'); 
    doTweenAlpha('yuribg', 'yuribg', 0, 0.25, 'linear');
    doTweenAlpha('desks', 'desks', 0, 0.25, 'linear'); 
end
    choose = tonumber(value1);
    if (choose == 1) then
    doTweenAlpha('dokidoki', 'dokidoki', 0, 0.25, 'linear'); 
    doTweenAlpha('BG', 'BG', 1, 0.25, 'linear'); 
    doTweenAlpha('BLOOD', 'BLOOD', 1, 0.25, 'linear'); 
    doTweenAlpha('BGSayori', 'BGSayori', 1, 0.25, 'linear'); 
    doTweenAlpha('black', 'black', 0.4, 0.25, 'linear'); 
    doTweenAlpha('godrays', 'godrays', 0.6, 0.25, 'linear'); 
    doTweenAlpha('yuribg', 'yuribg', 1, 0.25, 'linear');
    doTweenAlpha('desks', 'desks', 1, 0.25, 'linear'); 
end
    choose = tonumber(value1);
    if (choose == red) then
    doTweenAlpha('dokidoki', 'dokidoki', 1, 12, 'linear');
    runTimer('red', 5);
    doTweenAlpha('BG', 'BG', 0, 12, 'linear'); 
    doTweenAlpha('BLOOD', 'BLOOD', 0, 12, 'linear'); 
    doTweenAlpha('BGSayori', 'BGSayori', 0, 12, 'linear'); 
    doTweenAlpha('black', 'black', 0, 12, 'linear'); 
    doTweenAlpha('godrays', 'godrays', 0, 12, 'linear'); 
    doTweenAlpha('yuribg', 'yuribg', 0, 12, 'linear');
    doTweenAlpha('desks', 'desks', 0, 1, 'linear'); 
end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'red' then
    doTweenColor('dokidoki1','dokidoki','FF0000',76)
end
end