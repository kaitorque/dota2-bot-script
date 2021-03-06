X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_glimmer_cape",
-- 	"item_ultimate_scepter",
-- 	"item_shivas_guard",
-- 	"item_refresher",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core",
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_travel_boots",
}

transItem = {
	"item_force_staff",
	"item_aether_lens",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_blink",
	"item_glimmer_cape",
	"item_lotus_orb",
	"item_octarine_core",
	"item_refresher",
	"item_sheepstick",
	"item_shivas_guard",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Warlock Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,1,2,4,2,1,1,3,4,3,3,3,4},
	{2,1,2,1,2,4,1,2,1,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8}, talents
);


return X