import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IIngredient;
print("==================== loading gregtech.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<gregtech:machine:825>,
	<gregtech:machine:110>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Crafting Station
recipes.addShaped(<gregtech:machine:825>, [[<ore:chestWood>, <minecraft:crafting_table>, <ore:chestWood>],[<metaitem:plateBronze>, <gregtech:metal_casing>, <metaitem:plateBronze>], [<metaitem:plateBronze>, <gregtech:meta_tool:6>, <metaitem:plateBronze>]]);

//Wood Plank
recipes.addShaped(<metaitem:plateWood>, [[craftingHammer],[<ore:plankWood>]]);

//Glass Tube
recipes.addShaped(<metaitem:component.glass.tube>, [[null, <ore:paneGlassColorless>, null],[<ore:paneGlassColorless>, null, <ore:paneGlassColorless>], [null, <ore:paneGlassColorless>, null]]);


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
print("==================== end of gregtech.zs ====================");
