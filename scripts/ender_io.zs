import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
print("==================== loading ender_io.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<enderio:item_basic_capacitor>,
	<enderio:item_capacitor_silver>,
	<enderio:item_material:11>,
	<enderio:item_material:12>,
	<enderio:item_material:13>,
	<enderio:item_material:73>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}
val basicCapacitorInput as IIngredient = (<enderio:item_capacitor_grainy>|<enderio:item_material:20>*2) as IIngredient;

//First Stack is second in the list
val capacaitorMap as IOreDictEntry[IItemStack] = {
<enderio:item_capacitor_silver>:<ore:wireFineSilver>,
<enderio:item_basic_capacitor>:<ore:wireFineGold>,
} as IOreDictEntry[IItemStack];

for output, input in capacaitorMap {
	assembler.recipeBuilder()
	.outputs(output)
    .inputs(basicCapacitorInput)
    .inputs(<metaitem:component.resistor>)
    .inputs(input*8)
    .fluidInputs([<liquid:soldering_alloy> * 72])
	.EUt(30)
	.duration(120)
	.buildAndRegister();

	assembler.recipeBuilder()
	.outputs(output)
    .inputs(basicCapacitorInput)
    .inputs(<metaitem:component.resistor>)
    .inputs(input*8)
    .fluidInputs([<liquid:tin> * 144])
	.EUt(30)
	.duration(120)
	.buildAndRegister();
}





##########################################################################################
print("==================== end of ender_io.zs ====================");
