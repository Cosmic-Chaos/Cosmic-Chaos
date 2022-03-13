import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading mods blank.zs ====================");
##########################################################################################
/*
val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//First Stack is second in the list
val clusterFluidMap as ILiquidStack[IOreDictEntry] = {
val tinyDustMap as IItemStack[IItemStack] = {


} as IItemStack[IItemStack];
for tinyDust, material in tinyDustMap {

	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


val basicCapacitorInput as IIngredient = (<enderio:item_capacitor_grainy>|<enderio:item_material:20>*2) as IIngredient;

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/

val anyFluix as IIngredient = (<appliedenergistics2:material:12>|<appliedenergistics2:material:7>) as IIngredient;

recipes.removeShaped(<appliedenergistics2:fluix_block>, [[<appliedenergistics2:material:12>, <appliedenergistics2:material:12>, <appliedenergistics2:material:12>],[<appliedenergistics2:material:12>, null, <appliedenergistics2:material:12>], [<appliedenergistics2:material:12>, <appliedenergistics2:material:12>, <appliedenergistics2:material:12>]]);
recipes.removeShaped(<appliedenergistics2:fluix_block>, [[<appliedenergistics2:material:7>, <appliedenergistics2:material:7>, null],[<appliedenergistics2:material:7>, <appliedenergistics2:material:7>, null], [null, null, null]]);
recipes.addShaped(<appliedenergistics2:fluix_block>, [[anyFluix, anyFluix, anyFluix],[anyFluix, anyFluix, anyFluix], [anyFluix, anyFluix, anyFluix]]);

##########################################################################################
print("==================== end of mods blank.zs ====================");
