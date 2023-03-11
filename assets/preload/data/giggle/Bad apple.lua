function onEvent(name, value1, value2)
    if name == "Bad Apple" then
    choose = tonumber(value1);
    if (choose == 1) then
    doTweenColor('bfb','boyfriend','000000',0.25)
    doTweenColor('dadb','dad','000000',0.25)
end
    choose = tonumber(value1);
    if (choose == 0) then
    doTweenColor('bfb','boyfriend','FFFFFF',0.25)
    doTweenColor('dadb','dad','FFFFFF',0.25)
end
    choose = tonumber(value1);
    if (choose == Final) then
    doTweenColor('bfb','boyfriend','000000',12)
    doTweenColor('dadb','dad','000000',12)
end
end
end