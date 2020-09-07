X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_bloodstone",
-- 	"item_cyclone",
-- 	"item_black_king_bar",
-- 	"item_octarine_core",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_travel_boots"
}

transItem = {
	"item_urn_of_shadows",
	"item_ancient_janggo",
	"item_ghost"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_bloodstone",
	"item_cyclone",
	"item_black_king_bar",
	"item_octarine_core",
	"item_shivas_guard",
	"item_guardian_greaves",
	"item_lotus_orb",
	"item_glimmer_cape",
	"item_aether_lens",
	"item_sheepstick",
	"item_rod_of_atos",
	"item_kaya_and_sange",
	"item_yasha_and_kaya",
	"item_aeon_disk",
	"item_sphere",
	"item_blink"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Leshrac Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,3,4,3,1,1,2,4,2,2,2,4},
	{1,3,3,1,3,4,3,1,1,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8}, talents
);

return X