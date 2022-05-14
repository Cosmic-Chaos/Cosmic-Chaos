import crafttweaker.item.IItemStack;
print("==================== loading general_recipes.zs ====================");
##########################################################################################
mods.jei.JEI.hideCategory("Painter");
mods.jei.JEI.hideCategory("EIOWC");
mods.jei.JEI.hideCategory("EIOWO");
mods.jei.JEI.hideCategory("EIOTank");

/*
mods.unidict.removalByKind.get("Crafting").remove("plate");
mods.unidict.removalByKind.get("Crafting").remove("rod");
mods.unidict.removalByKind.get("Crafting").remove("gear");
*/





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

mods.fossils.recipes.addAnalyzerOutput(<fossil:bio_goo>, <fossil:rabbit_dna>, 0.1);

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/
##########################################################################################
print("==================== end of general_recipes.zs ====================");
