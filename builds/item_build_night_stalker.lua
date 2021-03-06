X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_urn_of_shadows",
-- 	"item_medallion_of_courage",
-- 	"item_spirit_vessel",
-- 	"item_black_king_bar",
-- 	"item_solar_crest",
-- 	"item_ultimate_scepter",
-- 	"item_heart",
-- 	"item_ultimate_scepter_2"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
}

transItem = {
	"item_armlet",
	"item_basher",
	"item_medallion_of_courage",
	"item_orb_of_corrosion",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_black_king_bar",
	"item_blink",
	"item_crimson_guard",
	"item_desolator",
	"item_heart",
	"item_heavens_halberd",
	"item_lotus_orb",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_pipe",
	"item_satanic",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 1, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Night Stalker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,3,1,4,1,2,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8}, talents
);

return X