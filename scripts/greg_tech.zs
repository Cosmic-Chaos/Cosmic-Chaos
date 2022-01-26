import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.enderio.AlloySmelter;
import mods.gtadditions.recipe.Utils;
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
recipes.addShaped(<gregtech:machine:825>, [[<ore:chestWood>, <minecraft:crafting_table>, <ore:chestWood>],[plateBronze, <gregtech:metal_casing>, plateBronze], [plateBronze, <gregtech:meta_tool:6>, plateBronze]]);

//Wood Plank
recipes.addShaped(plateWood, [[craftingHammer],[<ore:plankWood>]]);

//Glass Tube
recipes.addShaped(GlassTube, [[null, <ore:paneGlassColorless>, null],[<ore:paneGlassColorless>, null, <ore:paneGlassColorless>], [null, <ore:paneGlassColorless>, null]]);


//Autoclave
val anySteelPlate as IIngredient = (<ore:plateCrudeSteel>|<ore:plateSteel>) as IIngredient;
recipes.addShaped(<gregtech:machine:110>, [
	[anySteelPlate, <ore:blockGlassColorless>, anySteelPlate], 
	[anySteelPlate, <gregtech:machine:501>, anySteelPlate], 
	[<ore:circuitBasic>, <gregtech:meta_item_1:32610>, <ore:circuitBasic>]
]);

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
