X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_aether_lens",
-- 	"item_force_staff",
-- 	"item_glimmer_cape",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter",
-- 	"item_hurricane_pike",
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
	"item_tranquil_boots"
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_cyclone",
	"item_force_staff",
	"item_ghost",
	"item_rod_of_atos",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_blink",
	"item_glimmer_cape",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_shivas_guard",
	"item_sphere",
	"item_aeon_disk",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Crystal Maiden Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,2,3,3,4,3,1,1,1,4,2,2,2,4},
	{2,3,1,3,3,4,3,1,1,1,4,2,2,2,4},
	{2,3,1,3,3,4,3,1,2,1,4,2,1,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X