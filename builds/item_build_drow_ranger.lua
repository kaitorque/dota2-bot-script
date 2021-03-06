X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_invis_sword",
-- 	"item_dragon_lance",
-- 	"item_manta",
-- 	"item_black_king_bar",
-- 	"item_hurricane_pike",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly",
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
	"item_invis_sword",
	"item_maelstrom",
	"item_yasha",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_blink",
	"item_butterfly",
	"item_ethereal_blade",
	"item_greater_crit",
	"item_hurricane_pike",
	"item_manta",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_satanic",
	"item_silver_edge",
	"item_skadi",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Drow Ranger Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4},
	{3,1,3,1,2,4,3,3,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8}, talents
);

return X