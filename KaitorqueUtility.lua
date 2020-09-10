KaitorqueModule = {}

--ArrayShuffle
function KaitorqueModule.FYShuffle( tInput )
    local tReturn = {}
    for i = #tInput, 1, -1 do
        local j = math.random(i)
        tInput[i], tInput[j] = tInput[j], tInput[i]
        table.insert(tReturn, tInput[i])
    end
    return tReturn
end

function KaitorqueModule.getNum(maxItem)
    return RandomInt( 0, maxItem );
end

function KaitorqueModule.getEarlyItem(tInput, maxItem)
	if next(tInput) ~= nil then
		while (#tInput > maxItem)
		do
			table.remove (tInput, RandomInt(1,#tInput));
		end
		local tReturn = KaitorqueModule.FYShuffle( tInput );
		return tReturn;
	end
	return {};
end

function KaitorqueModule.getBoot(tInput)
	bootNum = RandomInt(1,#tInput);
	return tInput[bootNum];
end

function KaitorqueModule.getItem(tInput, maxItem, rapier, gem, moon)
	while (#tInput > maxItem)
	do
		table.remove (tInput, RandomInt(1,#tInput));
	end
	table.insert(tInput, "item_ultimate_scepter");
	local tReturn = {}
	repeat
		tReturn = KaitorqueModule.FYShuffle( tInput );
	until(tReturn[6] ~= "item_ultimate_scepter")
	table.insert(tReturn, 6,"item_ultimate_scepter_2");
	if gem == 1 then
		if RandomInt(1,4) == 4 then
			table.insert(tReturn, RandomInt(1,#tReturn+1),"item_gem");
		end
	end
	if moon == 1 then
		if RandomInt(1,4) == 4 then
			table.insert(tReturn, RandomInt(1,#tReturn+1),"item_moon_shard");
		end
	end
	if rapier == 1 then
		if RandomInt(1,4) == 4 then
			table.insert(tReturn, RandomInt(6,#tReturn+1),"item_rapier");
		end
	end
	return tReturn;
end

function KaitorqueModule.getListItem(earlyItem, boot, transItem, item)
	local tReturn = {}
	for i=1, #earlyItem
	do
		table.insert(tReturn, earlyItem[i]);
	end
	table.insert(tReturn, boot);
	for i=1, #transItem
	do
		table.insert(tReturn, transItem[i]);
	end
	for i=1, #item
	do
		table.insert(tReturn, item[i]);
	end
	return tReturn;
end

teamItem  = {["item_ancient_janggo"] = "Drum of Endurance", ["item_mekansm"] = "Mekansm", ["item_vladmir"] = "Vladimir's Offering", ["item_urn_of_shadows"] = "Urn of Shadows",
["item__pipe"] = "Pipe of Insight", ["item_guardian_greaves"] = "Guardian Greaves", ["item_shivas_guard"] = "Shiva's Guard", ["item_assault"] = "Assault Cuirass",
["item_crimson_guard"] = "Crimson Guard", ["item_spirit_vessel"] = "Spirit Vessel"}
function KaitorqueModule.chatItem(bot, item)
	itemList = {}
	for i=1, #item
	do
		if teamItem[item[i]] ~= nil then
			table.insert(itemList, teamItem[item[i]]);
		end
	end
	if #itemList > 0 then
		bot:ActionImmediate_Chat("I will buy "..table.concat(itemList,", "), false); 
	end
end

return KaitorqueModule;