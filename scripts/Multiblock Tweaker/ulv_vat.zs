import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlock;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;
import mods.contenttweaker.Random;
import mods.contenttweaker.World;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.functions.ICheckRecipeFunction;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.multiblock.functions.IUpdateFormedValidFunction;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.functions.ICompleteRecipeFunction;
import mods.gregtech.recipe.IRecipe;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.RecipeMap;


var loc = "mbt:ulv_vat";

val ulv_vat = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
                "CEC", 
                "III"
            )
            .aisle(
                "CSC", 
                "ICI"
            ).setRepeatable(2)
            .aisle(
                "CCC", 
                "III"
            )


            .where("E", controller.self())
			.where("C", <blockstate:contenttweaker:station_casing>)
			.where("S", <blockstate:contenttweaker:crystal_green_glass>)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
				  | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(2).setPreviewCount(2)
				  | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
				  | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
				  | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
				  | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("ulv_vat")
						.maxInputs(2)
						.maxFluidInputs(3)
                        .maxOutputs(2)
                        .maxFluidOutputs(2)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
ulv_vat.hasMaintenanceMechanics = false;
ulv_vat.hasMufflerMechanics = false;

# ULV Vat Controller Recipe
craft.remake(<metaitem:mbt:ulv_vat>, ["pretty",
  "P r P",
  "G t G",
  "¤ ⌂ ¤"], {
  "P": <contenttweaker:station_component_4>,
  "r": <metaitem:circuit.vacuum_tube>,
  "G": <ore:wireGtDoubleTin>,
  "t": <ore:rotorTin>,
  "¤": <ore:gearCopper>,
  "⌂": <contenttweaker:station_casing>,
});

// Recipes

// Nutrient Distillation
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:listAllmushroom>)
	.fluidInputs(<liquid:water>*1000)
	.fluidOutputs(<liquid:nutrient_distillation>*1000)
	.duration(128).EUt(2).buildAndRegister();

// All 9 lubricant recipes
val lubeItems as IIngredient[] = [
	<ore:dustRedstone>,
	<ore:dustSoapstone>,
	<ore:dustTalc>
] as IIngredient[];

val lubeFluids as ILiquidStack[] = [
	<liquid:creosote>*1000,
	<liquid:oil>*1000,
	<liquid:seed_oil>*1000
] as ILiquidStack[];

for lubeItem in lubeItems {
	for lubeFluid in lubeFluids {
		ulv_vat.recipeMap.recipeBuilder()
			.inputs(lubeItem)
			.fluidInputs(lubeFluid)
			.fluidOutputs(<liquid:lubricant>*1000)
			.duration(128).EUt(4).buildAndRegister();
	}
}

// Biomass from Nutrient Distillation + Bio Chaff
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<metaitem:bio_chaff>)
	.fluidInputs(<liquid:nutrient_distillation>*1000)
	.fluidOutputs(<liquid:biomass>*1000)
	.duration(128).EUt(4).buildAndRegister();

// Biomass from Water + Bio Chaff
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<metaitem:bio_chaff>)
	.fluidInputs(<liquid:water>*500)
	.fluidOutputs(<liquid:biomass>*500)
	.duration(128).EUt(4).buildAndRegister();

// Biomass from Water + Sapling
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:treeSapling>)
	.fluidInputs(<liquid:water>*100)
	.fluidOutputs(<liquid:biomass>*100)
	.duration(128).EUt(4).buildAndRegister();

// Biomass from Nutrient Distillation + Sapling
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:treeSapling>)
	.fluidInputs(<liquid:nutrient_distillation>*200)
	.fluidOutputs(<liquid:biomass>*200)
	.duration(128).EUt(4).buildAndRegister();

// Biomass from Nutrient Distillation + Sapling (for the GT brewery)
<recipemap:brewery>.recipeBuilder()
	.inputs(<ore:treeSapling>)
	.fluidInputs(<liquid:nutrient_distillation>*200)
	.fluidOutputs(<liquid:biomass>*200)
	.duration(128).EUt(4).buildAndRegister();


// Calcium Phosphide Dust
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustIndiumPhosphide>*2, <ore:dustCalcium>)
	.outputs(<metaitem:dustIndium>, <metaitem:dustCalciumPhosphide>*2)
	.duration(30).EUt(7).buildAndRegister();

// Carbon Dioxide from Carbon Dust
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustCarbon>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:2}))
	.fluidInputs(<liquid:oxygen>*2000)
	.fluidOutputs(<liquid:carbon_dioxide>*1000)
	.duration(40).EUt(7).buildAndRegister();

// Carbon Monoxide from Carbon Dust
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustCarbon>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:1}))
	.fluidInputs(<liquid:oxygen>*1000)
	.fluidOutputs(<liquid:carbon_monoxide>*1000)
	.duration(40).EUt(7).buildAndRegister();

/*
// Splitting 1,2-Dichloroethane
ulv_vat.recipeMap.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:1}))
	.fluidInputs(<liquid:dichloroethane>*1000)
	.fluidOutputs(<liquid:vinyl_chloride>*1000, <liquid:hydrochloric_acid>*1000)
	.duration(40).EUt(7).buildAndRegister();
*/
// Sulfur Dioxide
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustSulfur>)
	.fluidInputs(<liquid:oxygen>*2000)
	.fluidOutputs(<liquid:sulfur_dioxide>*1000)
	.duration(60).EUt(7).buildAndRegister();

// Remove Sulfur Dioxide recipe with unneeded circuit from GT chem reactor
<recipemap:chemical_reactor>.findRecipe(7, [<metaitem:dustSulfur>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:oxygen>*2000]).remove();

// Sulfur Dioxide (for the GT chem reactor)
<recipemap:chemical_reactor>.recipeBuilder()
	.inputs(<ore:dustSulfur>)
	.fluidInputs(<liquid:oxygen>*2000)
	.fluidOutputs(<liquid:sulfur_dioxide>*1000)
	.duration(60).EUt(7).buildAndRegister();

// Hydrogen Sulfide
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustSulfur>)
	.fluidInputs(<liquid:hydrogen>*2000)
	.fluidOutputs(<liquid:hydrogen_sulfide>*1000)
	.duration(60).EUt(7).buildAndRegister();

// Hydrochloric Acid
ulv_vat.recipeMap.recipeBuilder()
	.fluidInputs(<liquid:hydrogen>*1000)
	.fluidInputs(<liquid:chlorine>*1000)
	.fluidOutputs(<liquid:hydrochloric_acid>*1000)
	.duration(60).EUt(7).buildAndRegister();

// Antimony Trioxide
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustAntimony>)
	.fluidInputs(<liquid:oxygen>*3000)
	.outputs(<metaitem:dustAntimonyTrioxide>*5)
	.duration(60).EUt(7).buildAndRegister();

// Hydrofluoric Acid
ulv_vat.recipeMap.recipeBuilder()
	.fluidInputs(<liquid:hydrogen>*1000)
	.fluidInputs(<liquid:fluorine>*1000)
	.fluidOutputs(<liquid:hydrofluoric_acid>*1000)
	.duration(60).EUt(7).buildAndRegister();

// Ammonium Chloride
ulv_vat.recipeMap.recipeBuilder()
	.fluidInputs(<liquid:hydrochloric_acid>*1000)
	.fluidInputs(<liquid:ammonia>*1000)
	.outputs(<metaitem:dustAmmoniumChloride>*2)
	.duration(60).EUt(7).buildAndRegister();

// Carbon Monoxide from coal/charcoal
val carbonMonoxideItems as IOreDictEntry[] = [
	<ore:gemCoal>,
	<ore:gemCharcoal>,
	<ore:dustCoal>,
	<ore:dustCharcoal>
] as IOreDictEntry[];

for item in carbonMonoxideItems {
	ulv_vat.recipeMap.recipeBuilder()
		.inputs(item)
		.fluidInputs(<liquid:oxygen>*1000)
		.outputs(<metaitem:dustTinyAsh>)
		.fluidOutputs(<liquid:carbon_monoxide>*1000)
		.duration(80).EUt(7).buildAndRegister();
	<recipemap:chemical_reactor>.findRecipe(7, [item.firstItem, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:oxygen>*1000]).remove();
	<recipemap:chemical_reactor>.recipeBuilder()
		.inputs(item)
		.fluidInputs(<liquid:oxygen>*1000)
		.outputs(<metaitem:dustTinyAsh>)
		.fluidOutputs(<liquid:carbon_monoxide>*1000)
		.duration(80).EUt(7).buildAndRegister();
}

// Sulfur Trioxide
ulv_vat.recipeMap.recipeBuilder()
	.fluidInputs(<liquid:oxygen>*1000)
	.fluidInputs(<liquid:sulfur_dioxide>*1000)
	.fluidOutputs(<liquid:sulfur_trioxide>*1000)
	.duration(200).EUt(7).buildAndRegister();

// Hypochlorous Acid
ulv_vat.recipeMap.recipeBuilder()
	.fluidInputs(<liquid:chlorine>*10000)
	.fluidInputs(<liquid:water>*10000)
	.fluidInputs(<liquid:mercury>*1000)
	.fluidOutputs(<liquid:hypochlorous_acid>*10000)
	.duration(600).EUt(7).buildAndRegister();

ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustCarbon>)
	.fluidInputs(<liquid:carbon_dioxide>*1000)
	.fluidOutputs(<liquid:carbon_monoxide>*1000)
	.duration(80).EUt(7).buildAndRegister();

// Fix Carbon monoxide recipe which takes way longer than other carbon monoxide recipes
<recipemap:chemical_reactor>.findRecipe(7, [<metaitem:dustCarbon>], [<liquid:carbon_dioxide>*1000]).remove();
<recipemap:chemical_reactor>.recipeBuilder()
	.inputs(<ore:dustCarbon>)
	.fluidInputs(<liquid:carbon_dioxide>*1000)
	.fluidOutputs(<liquid:carbon_monoxide>*1000)
	.duration(80).EUt(7).buildAndRegister();

// Nutrient distillation recipes (a la the the vat)
val nutrientInputsA as double[IIngredient] = {
	<ore:listAllmeatraw>: 0.75 as double,
	<ore:itemSkull>: 2.0 as double,
	<minecraft:rotten_flesh>: 1.5 as double
} as double[IIngredient];

// Fix fermented spider eye to accept oredict
recipes.removeByRecipeName("minecraft:fermented_spider_eye");
<recipemap:mixer>.findRecipe(7, [<minecraft:sugar:0>, <minecraft:red_mushroom:0>, <minecraft:spider_eye:0>], null).remove();
<recipemap:mixer>.findRecipe(7, [<minecraft:sugar:0>, <minecraft:brown_mushroom:0>, <minecraft:spider_eye:0>], null).remove();
recipes.addShapeless("fermented_spider_eye", <minecraft:fermented_spider_eye>, [<minecraft:spider_eye>, <ore:listAllmushroom>, <ore:listAllsugar>]);
<recipemap:mixer>.recipeBuilder()
	.inputs(<minecraft:spider_eye>, <ore:listAllmushroom>, <ore:listAllsugar>)
	.outputs(<minecraft:fermented_spider_eye>)
	.duration(100).EUt(7).buildAndRegister();

val nutrientInputsB as double[IIngredient] = {
	<ore:listAllsugar>: 1.0 as double,
	<ore:listAllmushroom>: 1.5 as double,
	<ore:cropNetherWart>: 1.5 as double,
	<minecraft:fermented_spider_eye>: 2.0 as double
} as double[IIngredient];

for itemA, multA in nutrientInputsA {
	for itemB, multB in nutrientInputsB {
		val amount as double = (500 as double)*multA*multB;
		ulv_vat.recipeMap.recipeBuilder()
			.inputs(itemA, itemB)
			.fluidInputs(<liquid:water>*1000)
			.fluidOutputs(<liquid:nutrient_distillation>*(amount as int))
			.duration(100).EUt(7).buildAndRegister();
	}
}

// Dew of the Void
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:itemPulsatingPowder>, <ore:itemEnderCrystalPowder>)
	.fluidInputs(<liquid:nutrient_distillation>*1000)
	.fluidOutputs(<liquid:ender_distillation>*1000)
	.duration(150).EUt(7).buildAndRegister();

// Vapor of Levity
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:itemPulsatingPowder>, <ore:itemPrecientPowder>)
	.fluidInputs(<liquid:ender_distillation>*1000)
	.fluidOutputs(<liquid:vapor_of_levity>*1000)
	.duration(200).EUt(7).buildAndRegister();

// Hootch Recipes
val hootchInputsA as double[IIngredient] = {
	<ore:listAllseed>: 2.0 as double,
	<ore:foodFlour>: 3.0 as double,
	<ore:cropApple>: 3.5 as double,
	<ore:cropPotato>: 4.0 as double,
	<minecraft:poisonous_potato>: 8.0 as double
} as double[IIngredient];

val hootchInputsB as double[IIngredient] = {
	<minecraft:melon>: 0.2 as double,
	<ore:listAllsugar>: 1.0 as double
} as double[IIngredient];

for itemA, multA in hootchInputsA {
	for itemB, multB in hootchInputsB {
		val amount as double = (250 as double)*multA*multB;
		ulv_vat.recipeMap.recipeBuilder()
			.inputs(itemA, itemB)
			.fluidInputs(<liquid:water>*1000)
			.fluidOutputs(<liquid:hootch>*(amount as int))
			.duration(100).EUt(7).buildAndRegister();
	}
}

// Fire Water
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:dustBlaze>, <ore:dustRedstone>)
	.fluidInputs(<liquid:hootch>*1000)
	.fluidOutputs(<liquid:fire_water>*1000)
	.duration(100).EUt(7).buildAndRegister();

// Liquid Sunshine
ulv_vat.recipeMap.recipeBuilder()
	.inputs(<ore:blockGlowstone>, <minecraft:double_plant:0>)
	.fluidInputs(<liquid:fire_water>*1000)
	.fluidOutputs(<liquid:liquid_sunshine>*1000)
	.duration(100).EUt(7).buildAndRegister();

// Cloud Seed Recipes
val cloudseedInputsA as double[IIngredient] = {
	<ore:blockClay>: 2.0 as double,
	<ore:foodSalt>: 2.5 as double,
	<ore:dustSilver>: 3.5 as double
} as double[IIngredient];

val cloudseedInputsB as double[IIngredient] = {
	<minecraft:snow>: 0.5 as double,
	<minecraft:packed_ice>: 1.0 as double
} as double[IIngredient];

for itemA, multA in cloudseedInputsA {
	for itemB, multB in cloudseedInputsB {
		val amount as double = (1000 as double)*multA*multB;
		ulv_vat.recipeMap.recipeBuilder()
			.inputs(itemA, itemB)
			.fluidInputs(<liquid:water>*1000)
			.fluidOutputs(<liquid:cloud_seed>*(amount as int))
			.duration(100).EUt(7).buildAndRegister();
	}
}

// Concentrated Cloud Seed Recipes
val conccloudInputsA as double[IIngredient] = {
	<ore:blockClay>: 1.0 as double,
	<ore:foodSalt>: 1.5 as double,
	<ore:dustSilver>: 2.5 as double,
	<ore:dustGold>: 3.5 as double
} as double[IIngredient];

for itemA, multA in cloudseedInputsA {
	val amount as double = (500 as double)*multA;
	ulv_vat.recipeMap.recipeBuilder()
		.inputs(itemA)
		.fluidInputs(<liquid:cloud_seed>*1000)
		.fluidOutputs(<liquid:cloud_seed_concentrated>*(amount as int))
		.duration(100).EUt(7).buildAndRegister();
}

