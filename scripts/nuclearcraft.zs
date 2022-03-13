import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;
print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}
val itemstoRemoveAndHide =
[
	<nuclearcraft:manufactory>,
]
 as IItemStack[];

for item in itemstoRemoveAndHide {
	JEI.removeAndHide(item);
}

/*
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
##########################################################################################
print("==================== end of mods blank.zs ====================");
