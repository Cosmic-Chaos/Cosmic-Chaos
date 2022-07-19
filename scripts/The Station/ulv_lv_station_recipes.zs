import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.industrialforegoing.SludgeRefiner;
import crafttweaker.oredict.IOreDictEntry;

print("==================== loading The Station/ulv_lv_station_recipes.zs ====================");
##########################################################################################

##=======================================================
## FURNACE RECIPES
##=======================================================

//Cooking Ingots
furnace.addRecipe(<minecraft:iron_ingot>, <metaitem:hull.plate.broken.0>, 0.0);
furnace.addRecipe(<metaitem:ingotCopper>, <metaitem:hull.plate.broken.1>, 0.0);
furnace.addRecipe(<metaitem:ingotTin>, <metaitem:hull.plate.broken.2>, 0.0);
furnace.addRecipe(<metaitem:ingotSilver>, <metaitem:hull.plate.3>, 0.0);

furnace.addRecipe(<minecraft:iron_ingot>, <contenttweaker:heavy_dust>, 0.0);

furnace.addRecipe(<metaitem:ingotCopper>, <contenttweaker:light_dust>, 0.0);

furnace.addRecipe(<ore:ingotCrudeSteel>.firstItem, <contenttweaker:dense_dust>, 0.0);

//Rubber
furnace.addRecipe(<metaitem:ingotRubber>, <metaitem:dustRubber>, 0.0);

//Resin
furnace.addRecipe(<metaitem:rubber_drop> * 4, <fossil:bio_goo>, 0.0);


SludgeRefiner.add(<fossil:bio_goo>, 5);
SludgeRefiner.add(<minecraft:grass>, 3);


//Iron + Tin
electromagnetic_separator.recipeBuilder()
  .inputs(<contenttweaker:heavy_dust>)
	.outputs(<metaitem:dustIron>)
	.chancedOutput(<metaitem:dustSmallTin>, 6000, 1000)
	.chancedOutput(<metaitem:dustSmallTin>, 4000, 1000)
	.EUt(2)
	.duration(100)
	.buildAndRegister();

//Copper + Tin
electromagnetic_separator.recipeBuilder()
  .inputs(<contenttweaker:light_dust>)
	.outputs(<metaitem:dustCopper>)
	.chancedOutput(<metaitem:dustSmallTin>, 6000, 1000)
	.chancedOutput(<metaitem:dustSmallTin>, 4000, 1000)
	.EUt(2)
	.duration(100)
	.buildAndRegister();

//Crude Steel + Lead
electromagnetic_separator.recipeBuilder()
  .inputs(<contenttweaker:dense_dust>)
	.outputs(<metaitem:dustCrudeSteel>)
	.chancedOutput(<metaitem:dustSmallLead>, 6000, 1000)
	.chancedOutput(<metaitem:dustSmallLead>, 4000, 1000)
	.EUt(2)
	.duration(100)
	.buildAndRegister();
//Crude Steel is blast furnace only?
//furnace.remove(<enderio:item_alloy_endergy_ingot>);

<recipemap:water_electrolyzer>.recipeBuilder()
	.fluidInputs(<liquid:water>*3000)
	.fluidOutputs(<liquid:hydrogen>*2000, <liquid:oxygen>*1000)
.duration(1500).EUt(8).buildAndRegister();

// Move ulv transformer to assembler only so that it cannot be abused to create explosions and hence compressed iron on the space station
recipes.removeByRecipeName("gregtech:gregtech.machine.transformer.ulv");
<recipemap:assembler>.recipeBuilder()
	.inputs(<metaitem:gregtech:hull.ulv>, <ore:cableGtSingleTin>, <ore:cableGtSingleRedAlloy>*4)
	.outputs(<metaitem:gregtech:transformer.ulv>)
.duration(100).EUt(5).buildAndRegister();


##########################################################################################
print("==================== end of The Station/ulv_lv_station_recipes.zs ====================");
