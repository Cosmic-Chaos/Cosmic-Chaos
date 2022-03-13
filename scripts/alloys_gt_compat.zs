import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//fused_quartz
electrolyzer.recipeBuilder()
	.outputs(<enderio:block_fused_quartz>)
    .inputs(<minecraft:quartz_block>)
	.EUt(20)
	.duration(60)
	.buildAndRegister();

//Bimetal Gear
alloy_smelter.recipeBuilder()
	.outputs(<enderio:item_material:11>)
    .inputs(<metaitem:gearIron>)
    .inputs(<enderio:item_material:20>*4)
	.EUt(32)
	.duration(120)
	.buildAndRegister();
	
//Dark Gear
chemical_reactor.recipeBuilder()
	.outputs(<enderio:item_material:73>)
    .fluidInputs([<liquid:dark_steel> * 576])
    .inputs(<enderio:item_material:11>)
	.EUt(32)
	.duration(120)
	.buildAndRegister();

//Energized Gear
chemical_reactor.recipeBuilder()
	.outputs(<enderio:item_material:12>)
    .fluidInputs([<liquid:energetic_alloy> * 576])
    .inputs(<enderio:item_material:11>)
	.EUt(32)
	.duration(120)
	.buildAndRegister();

//Vibrant Gear
chemical_reactor.recipeBuilder()
	.outputs(<enderio:item_material:13>)
    .fluidInputs([<liquid:vibrant_alloy> * 576])
    .inputs(<enderio:item_material:11>)
	.EUt(32)
	.duration(120)
	.buildAndRegister();

##########################################################################################
print("==================== end of mods blank.zs ====================");
