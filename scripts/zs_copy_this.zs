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


	macerator.recipeBuilder()
		.inputs(<thebetweenlands:items_misc:23>)
		.fluidInputs(<liquid:water>)
		.notConsumable(IIngredient[])
		.notConsumable(ILiquidStack[])
		.outputs(<metaitem:dustRawRubber>*3)
		.fluidOutputs(ILiquidStack[])
		.chancedOutput(IItemStack, 0-10000, 0-10000) // IItemStack output, intitial output chance, tier output chance boost. 10000 is 100% chance
		.circuit(int) // circuit number to use, from 0-32
		.hidden()
		.duration(5*20).EUt(4).buildAndRegister();


val basicCapacitorInput as IIngredient = (<enderio:item_capacitor_grainy>|<enderio:item_material:20>*2) as IIngredient;

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));

<techreborn:cloakingdevice>.maxStackSize = 64;
<fossil:bio_goo>.addTooltip(format.yellow(n ~ "% chance to give " + output.displayName + " when analyzed."));
*/
##########################################################################################
print("==================== end of mods blank.zs ====================");
