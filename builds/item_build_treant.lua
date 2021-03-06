X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_medallion_of_courage",
-- 	"item_meteor_hammer",
-- 	"item_holy_locket",
-- 	"item_solar_crest",
-- 	"item_lotus_orb",
-- 	"item_ultimate_scepter_2",
-- 	"item_blink"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_orb_of_venom",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_tranquil_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_force_staff",
	"item_medallion_of_courage",
	"item_orb_of_corrosion",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_blink",
	"item_holy_locket",
	"item_lotus_orb",
	"item_meteor_hammer",
	"item_octarine_core",
	"item_refresher",
	"item_sheepstick",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Treant Protector Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,3,4,3,3,2,2,4,2,1,1,4},
	{1,3,3,2,2,4,2,2,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X