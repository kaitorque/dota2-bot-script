X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_int",
-- 	"item_hurricane_pike",
-- 	"item_glimmer_cape",
-- 	"item_ultimate_scepter",
-- 	"item_bloodthorn",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };			

earlyItem = {
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_int"
}

transItem = {
	"item_force_staff",
	"item_ancient_janggo"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_hurricane_pike",
	"item_glimmer_cape",
	"item_bloodthorn",
	"item_sheepstick",
	"item_shivas_guard",
	"item_vladimir",
	"item_solar_crest",
	"item_pipe",
	"item_lotus_orb",
	"item_heavens_halberd",
	"item_cyclone",
	"item_spirit_vessel",
	"item_monkey_king_bar"
}

randItem = KUtil.getItem(item, 5)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Enchantress Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{3,1,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X