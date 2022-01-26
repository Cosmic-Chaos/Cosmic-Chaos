import crafttweaker.item.IItemStack;
print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
<projecte:item.pe_fuel>,
<projecte:item.pe_fuel:1>,
<projecte:item.pe_fuel:2>,
<equivadditions:zeitheron_fuel>,

]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

/*
val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/
##########################################################################################
print("==================== end of mods blank.zs ====================");
