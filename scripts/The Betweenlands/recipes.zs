import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading The Betweenlands/recipes.zs ====================");
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
val clusterFluidMap as int[string] = {
val clusterFluidMap as ILiquidStack[IOreDictEntry] = {
val tinyDustMap as IItemStack[IItemStack] = {


} as IItemStack[IItemStack];
for tinyDust, material in tinyDustMap {

	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}

val sinteringMapULV as IItemStack[][IOreDictEntry] = {
    <ore:dustIron>:[<ore:ingotIron>.firstItem, <ore:rodIron>.firstItem],
} as IItemStack[][IOreDictEntry];

for dust, output in sinteringMapULV {
<recipemap:sintering_furnace>.recipeBuilder().duration(40).EUt(7)
	.notConsumable(<metaitem:shape.mold.ingot>)
	.inputs(dust)
	.outputs(output[0])
.buildAndRegister();


val basicCapacitorInput as IIngredient = (<enderio:item_capacitor_grainy>|<enderio:item_material:20>*2) as IIngredient;

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));

<fossil:bio_goo>.addTooltip(format.yellow(n ~ "% chance to give " + output.displayName + " when analyzed."));
*/

//Raw Rubber Pulp
	macerator.recipeBuilder()
		.inputs(<thebetweenlands:items_misc:23>) //Rubber Ball
		.outputs(<metaitem:dustRawRubber>*3)
	.duration(5*20).EUt(4).buildAndRegister();
##########################################################################################
print("==================== end of The Betweenlands/recipes.zs ====================");
