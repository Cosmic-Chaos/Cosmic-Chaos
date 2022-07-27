import crafttweaker.item.IItemStack;
print("==================== loading general_recipes.zs ====================");
##########################################################################################
mods.jei.JEI.hideCategory("Painter");
mods.jei.JEI.hideCategory("EIOWC");
mods.jei.JEI.hideCategory("EIOWO");
//mods.jei.JEI.hideCategory("EIOTank");

/*
val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}


val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}
*/

# [Fishing Rod] from [LV Electric Motor][+2]
recipes.removeByRecipeName("minecraft:fishing_rod");
craft.make(<minecraft:fishing_rod>, ["pretty",
  "    #",
  "  L s",
  "#   s"], {
  "#": <ore:stickLongWood>,           # Long Wood Stick
  "L": <metaitem:electric.motor.lv>,    # LV Electric Motor
  "s": <ore:string>, # String
});

# [Fishing Rod of Misadventure] from [LV Electric Motor][+2]
recipes.removeByRecipeName("tombstone:fishing_rod_of_misadventure");
craft.make(<tombstone:fishing_rod_of_misadventure>, ["pretty",
  "    b",
  "  L ▲",
  "b   ▲"], {
  "b": <ore:bone>, # Bone
  "L": <metaitem:electric.motor.lv>,   # LV Electric Motor
  "▲": <ore:dustGrave>,              # Grave's Dust
});

# [Ground Trap] from [Hay Bale][+5]
recipes.removeByRecipeName("harvestcraft:groundtrap");
craft.make(<harvestcraft:groundtrap>, ["pretty",
  "C ╱ C",
  "T H S",
  "C ╱ #"], {
  "C": <minecraft:web>,          # Cobweb
  "╱": <ore:stickLongSteel>,     # Long Steel Rod
  "T": <ore:craftingToolScrewdriver>, # Neutronium Screwdriver
  "H": <minecraft:hay_block>,    # Hay Bale
  "S": <ore:springSteel>,        # Steel Spring
  "#": <ore:frameGtTreatedWood>, # Treated Wood Frame Box
});

# [Honey Block] from [Honey]
craft.shapeless(<futuremc:honey_block>, "HHHHHHHHH", {
  "H": <ore:dropHoney>, # Honey
});

# [Honey]*9 from [Honey Block]
recipes.removeByRecipeName("harvestcraft:honeyitem_x9_honey");
craft.make(<harvestcraft:honeyitem> * 9, [
  "■"], {
  "■": <futuremc:honey_block>, # Honey Block
});

# [Honey Drip] from [Honey]
craft.shapeless(<erebus:materials:20>, "H", {
  "H": <harvestcraft:honeyitem>, # Honey
});

# [Honeycomb Block] from [Honeycomb]
recipes.removeByRecipeName("futuremc:else/honeycomb_block");
craft.shapeless(<futuremc:honeycomb_block>, "HHHHHHHHH", {
  "H": <futuremc:honeycomb>, # Honeycomb
});

# [Honeycomb]*9 from [Honeycomb Block]
craft.make(<futuremc:honeycomb> * 9, [
  "■"], {
  "■": <futuremc:honeycomb_block>, # Honeycomb Block
});

##########################################################################################
print("==================== end of general_recipes.zs ====================");
