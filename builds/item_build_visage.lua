X = {};

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_medallion_of_courage",
-- 	"item_hood_of_defiance",
-- 	"item_rod_of_atos",
-- 	"item_solar_crest",
-- 	"item_pipe",
-- 	"item_ultimate_scepter",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };	

earlyItem = {
	"item_boots",
	"item_hand_of_midas",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_tranquil_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_helm_of_the_dominator",
	"item_hood_of_defiance",
	"item_medallion_of_courage",
	"item_rod_of_atos",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_lotus_orb",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_pipe",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Visage Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,3,2,2,4,2,3,3,3,4,1,1,1,4},
	{1,2,3,2,3,4,2,3,2,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8}, talents
);

return X