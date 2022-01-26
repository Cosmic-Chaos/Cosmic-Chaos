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
	<enderio:block_sag_mill>,
	<enderio:block_vat>,
	<enderio:item_material:11>,
	<enderio:item_material:12>,
	<enderio:item_material:13>,
	<enderio:item_material:73>,
	<enderio:block_simple_sag_mill>,
	<enderio:block_simple_stirling_generator>,
	<enderio:block_simple_alloy_smelter>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Simple Sag
recipes.addShaped(<enderio:block_simple_sag_mill>, [
	[<ore:gearSmallCrudeSteel>, <ore:gearSmallCrudeSteel>, <ore:gearSmallCrudeSteel>],
	[<ore:circuitPrimitive>, <gregtech:machine:500>, <ore:circuitPrimitive>], 
	[<ore:plateLead>, <ore:wireGtDoubleCopper>, <ore:plateLead>]
]);

//Gen
recipes.addShaped(<enderio:block_simple_stirling_generator>, [
	[<ore:plateIron>, <furnaceoverhaul:iron_furnace>, <ore:plateIron>],
	[<ore:plateIron>, <gregtech:machine:500>, <ore:plateIron>], 
	[<ore:gearCopper>, <ore:circuitPrimitive>, <ore:gearCopper>]
]);
/*
//Alloy Smeltery
recipes.addShaped(<enderio:block_simple_alloy_smelter>, [
	[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
	[<furnaceoverhaul:iron_furnace>, <gregtech:machine:500>, <furnaceoverhaul:iron_furnace>], 
	[<ore:gearLead>, <ore:circuitPrimitive>, <ore:gearLead>]
]);
*/

//Vat
recipes.addShaped(<enderio:block_vat>, [
	[<ore:plateBrass>, <minecraft:cauldron>, <ore:plateBrass>],
	[<enderio:block_tank>, <gregtech:machine:501>, <enderio:block_tank>], 
	[<ore:plateBrass>, <furnaceoverhaul:iron_furnace>, <ore:plateBrass>]
]);

//Sag Mill
recipes.addShaped(<enderio:block_sag_mill>, [
	[<ore:ingotDarkSteel>, <enderio:block_simple_sag_mill>, <ore:ingotDarkSteel>], 
	[<ore:gearDark>, <gregtech:meta_item_1:32600>, <ore:gearDark>]
]);

recipes.addShaped(<enderio:block_sag_mill>, [
	[<ore:gearSmallSteel>, <ore:gearSmallSteel>, <ore:gearSmallSteel>],
	[<ore:ingotDarkSteel>, <gregtech:machine:501>, <ore:ingotDarkSteel>], 
	[<ore:gearDark>, <gregtech:meta_item_1:32600>, <ore:gearDark>]
]);


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
    .inputs(Resistor)
    .inputs(input*8)
    .fluidInputs([<liquid:soldering_alloy> * 72])
	.EUt(30)
	.duration(120)
	.buildAndRegister();

	assembler.recipeBuilder()
	.outputs(output)
    .inputs(basicCapacitorInput)
    .inputs(Resistor)
    .inputs(input*8)
    .fluidInputs([<liquid:tin> * 144])
	.EUt(30)
	.duration(120)
	.buildAndRegister();
}





##########################################################################################
print("==================== end of ender_io.zs ====================");
