X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_aether_lens",
-- 	"item_cyclone",
-- 	"item_blink",
-- 	"item_ultimate_scepter",
-- 	"item_dagon_5",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_cyclone",
	"item_force_staff",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_blink",
	"item_dagon_5",
	"item_ethereal_blade",
	"item_lotus_orb",
	"item_meteor_hammer",
	"item_octarine_core",
	"item_sheepstick",
	"item_spirit_vessel",
}

randItem = KUtil.getItem(item, 5, 0, 1, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Nyx Assassin Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8}, talents
);

return X