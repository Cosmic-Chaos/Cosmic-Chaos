import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<refinedstorage:quartz_enriched_iron>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//quartz_enriched_iron
alloy_smelter.recipeBuilder()
	.outputs(<refinedstorage:quartz_enriched_iron>*4)
    .inputs(<ore:ingotIron>*3)
    .inputs(<minecraft:quartz>)
	.EUt(16)
	.duration(80)
	.buildAndRegister();

//Steel
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotSteel>)
    .inputs(<metaitem:ingotCrudeSteel>)
    .inputs(<calculator:enrichedcoal>*2)
	.EUt(32)
	.duration(120)
	.buildAndRegister();
/*
//Dark Steel
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotDarkSteel>)
    .inputs(<metaitem:ingotSteel>)
    .inputs(<minecraft:obsidian>)
	.EUt(32)
	.duration(160)
	.buildAndRegister();
	
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotDarkSteel>)
    .inputs(<metaitem:ingotSteel>)
    .inputs(<metaitem:dustObsidian>*4)
	.EUt(32)
	.duration(240)
	.buildAndRegister();

//Conductive Iron
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotConductiveIron>)
    .inputs(<ore:ingotIron>)
    .inputs(<ore:dustRedstone>*4)
	.EUt(20)
	.duration(160)
	.buildAndRegister();

//Electrical Steel
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotElectricalSteel>)
    .inputs(<metaitem:ingotSteel>)
    .inputs(<ore:itemSilicon>)
	.EUt(32)
	.duration(160)
	.buildAndRegister();

//EnergeticAlloy
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotEnergeticAlloy>)
    .inputs(<ore:ingotGold>)
    .inputs(<ore:dustEnergetic>)
	.EUt(32)
	.duration(120)
	.buildAndRegister();

//VibrantAlloy
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotVibrantAlloy>)
    .inputs(<metaitem:ingotEnergeticAlloy>)
    .inputs(<minecraft:ender_pearl>)
	.EUt(32)
	.duration(160)
	.buildAndRegister();

//PulsatingIron
alloy_smelter.recipeBuilder()
	.outputs(<metaitem:ingotPulsatingIron>)
    .inputs(<minecraft:iron_ingot>)
    .inputs(<minecraft:ender_pearl>)
	.EUt(20)
	.duration(160)
	.buildAndRegister();
*/
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
