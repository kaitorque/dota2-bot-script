X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	-- "item_boots",
-- 	-- "item_rod_of_atos",
-- 	-- "item_guardian_greaves",
-- 	-- "item_ultimate_scepter",
-- 	-- "item_black_king_bar",
-- 	-- "item_butterfly"
-- 	"item_power_treads_agi",
-- 	"item_dragon_lance",
-- 	"item_maelstrom",
-- 	"item_black_king_bar",
-- 	"item_hurricane_pike",
-- 	"item_manta",
-- 	"item_mjollnir",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
}

transItem = {
	"item_dragon_lance",
	"item_maelstrom",
	"item_rod_of_atos",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_butterfly",
	"item_eternal_shroud",
	"item_ethereal_blade",
	"item_guardian_greaves",
	"item_gungir",
	"item_hurricane_pike",
	"item_manta",
	"item_mjollnir",
	"item_pipe",
	"item_silver_edge",
	"item_sphere",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Viper Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,1,4,1,2,2,2,4,2,3,3,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,2,3,4,1,3,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X