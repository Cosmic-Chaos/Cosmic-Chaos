#priority 6
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
import mods.gregtech.multiblock.IPatternMatchContext;
import mods.gregtech.multiblock.functions.ICheckRecipeFunction;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.multiblock.functions.IUpdateFormedValidFunction;
import mods.gregtech.multiblock.functions.IFormStructureFunction;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.functions.ICompleteRecipeFunction;
import mods.gregtech.recipe.IRecipe;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.InputIngredient;
import mods.gregtech.recipe.ChancedEntry;
import mods.gregtech.predicate.IMTEPredicate;
import mods.gregtech.IMetaTileEntity;

import scripts.g.stationCrystalStatsMap;
import scripts.g.stationCrystalsByStats;
import scripts.g.aaCrystalShardColorMap;
import scripts.g.primaryColors;

var loc = "mbt:crystal_grower";

val crystal_grower = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
				"   ",
				"   ",
                "NEN"
            )
            .aisle(
				"   ",
				"   ",
                "ICI"
            )
            .aisle(
                "   ",
                "   ",
                "III"
            )
            .where("E", controller.self())
			.where("C", <blockstate:contenttweaker:crystal_core>)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
				  | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>)
				  | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("crystal_grower")
						.maxInputs(4)
                        .maxOutputs(1)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
crystal_grower.hasMaintenanceMechanics = false;
crystal_grower.hasMufflerMechanics = false;

# [Crystal Grower] from [Derelict Casing][+3]
recipes.addShaped("crystal_grower", <metaitem:mbt:crystal_grower>, [
	[<ore:stickLongPotin>, <projecte:item.pe_covalence_dust>, <ore:stickLongPotin>],
	[<projecte:item.pe_covalence_dust>, <contenttweaker:station_casing>, <projecte:item.pe_covalence_dust>],
	[<ore:circuitLv>, <ore:circuitLv>, <ore:circuitLv>]
]);

<metaitem:mbt:crystal_grower>.addTooltip(format.red("Make sure to enable voiding items in the controller!"));
<metaitem:mbt:crystal_grower>.addTooltip(format.red("Grows crystals on top of the crystal core."));
<metaitem:mbt:crystal_grower>.addTooltip(format.red("8 tiny dusts fully grow, and you get 27 back."));
<metaitem:mbt:crystal_grower>.addTooltip(format.red("Can only be used in the space station"));

# [Crystal Core] from [Block of Firestone][+4]
recipes.addShaped("crystal_core", <contenttweaker:crystal_core>, [
	[<contenttweaker:dust_crystal_green_glass>, <ore:springSmallTin>, <contenttweaker:dust_crystal_purple_glass>],
	[<metaitem:springSmallCopper>, <ore:blockRedCrystalAlloy>, <metaitem:springSmallCopper>],
	[<contenttweaker:dust_crystal_purple_glass>, <ore:springSmallTin>, <contenttweaker:dust_crystal_green_glass>]
]);

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_red>)
	.inputs(<ore:dustTinyRedCrystal>)
	.chancedOutput(<ore:gemRedCrystal>.firstItem.withTag({display:{Lore:["Grows a Red Crystal on the crystal core by one stage"]}}), 1250, 0)
	.duration(20).EUt(4).buildAndRegister();

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_green>)
	.inputs(<ore:dustTinyGreenCrystal>)
	.chancedOutput(<ore:gemGreenCrystal>.firstItem.withTag({display:{Lore:["Grows a Green Crystal on the crystal core by one stage"]}}), 1250, 0)
	.duration(20).EUt(4).buildAndRegister();

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_blue>)
	.inputs(<ore:dustTinyBlueCrystal>)
	.chancedOutput(<ore:gemBlueCrystal>.firstItem.withTag({display:{Lore:["Grows a Blue Crystal on the crystal core by one stage"]}}), 1250, 0)
	.duration(20).EUt(4).buildAndRegister();

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_cyan>)
	.inputs(<ore:dustTinyGreenCrystal>, <ore:dustTinyBlueCrystal>)
	.chancedOutput(<ore:gemCyanCrystal>.firstItem.withTag({display:{Lore:["Grows a Cyan Crystal on the crystal core by two stages"]}}), 2500, 0)
	.duration(40).EUt(6).buildAndRegister();

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_magenta>)
	.inputs(<ore:dustTinyRedCrystal>, <ore:dustTinyBlueCrystal>)
	.chancedOutput(<ore:gemMagentaCrystal>.firstItem.withTag({display:{Lore:["Grows a Magenta Crystal on the crystal core by two stages"]}}), 2500, 0)
	.duration(40).EUt(6).buildAndRegister();

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_yellow>)
	.inputs(<ore:dustTinyRedCrystal>, <ore:dustTinyGreenCrystal>)
	.chancedOutput(<ore:gemYellowCrystal>.firstItem.withTag({display:{Lore:["Grows a Yellow Crystal on the crystal core by two stages"]}}), 2500, 0)
	.duration(40).EUt(6).buildAndRegister();

crystal_grower.recipeMap.recipeBuilder()
	.notConsumable(<contenttweaker:crystal_seed_white>)
	.inputs(<ore:dustTinyRedCrystal>, <ore:dustTinyGreenCrystal>, <ore:dustTinyBlueCrystal>)
	.chancedOutput(<ore:gemWhiteCrystal>.firstItem.withTag({display:{Lore:["Grows a Yellow Crystal on the crystal core by up to three stages"]}}), 3750, 0)
	.duration(60).EUt(8).buildAndRegister();

val getCenter = function(pos as IBlockPos, facing as IFacing) as IBlockPos[] {
	return [pos.getOffset(facing.opposite, 1).getOffset(IFacing.up(), 1)] as IBlockPos[];
};

// Check correct dimension
crystal_grower.formStructureFunction = function(controller as IControllerTile, context as IPatternMatchContext){
	if(controller.getWorld().getDimension() != 33){
		controller.invalidateStructure();
	}
} as IFormStructureFunction;

// check if the given dust can grow a crystal
crystal_grower.checkRecipeFunction = function(controller as IControllerTile, recipe as IRecipe, consumeIfSuccess as bool) as bool {
    val world as IWorld = controller.world;
    for pos in getCenter(controller.pos, controller.frontFacing) {
		if (world.isAirBlock(pos)) {
			return true;
		}
		val block as IBlockState = world.getBlockState(pos);
        if (!(stationCrystalStatsMap has block)) {
            continue;
        }
        var output as IItemStack = recipe.getChancedOutputs()[0].output;
        output = output.definition.makeStack(output.metadata);
        if (!(aaCrystalShardColorMap has output)) {
			continue;
		}
		// because stats is stored as a {"Color": Level} map for each growing crystal block, this works
		if (stationCrystalStatsMap[block] has aaCrystalShardColorMap[output]) {
			return true;
		}
	}
	return false;
} as ICheckRecipeFunction;

crystal_grower.completeRecipeFunction = function (recipeLogic as IRecipeLogic) as bool {
	val controller as IControllerTile = recipeLogic.metaTileEntity;
	val world as IWorld = controller.world;
	val chancedOutput as ChancedEntry = recipeLogic.previousRecipe.getChancedOutputs()[0];
	val output = chancedOutput.output.definition.makeStack(chancedOutput.output.metadata);
	val color as string = aaCrystalShardColorMap[output];
	val growth as int = (chancedOutput.chance / 1250) as int;
	for pos in getCenter(controller.pos, controller.frontFacing) {
		if (world.isAirBlock(pos)) {
			val block as IBlockState = stationCrystalsByStats[color][growth - 1];
			world.setBlockState(block, pos);
			continue;
		}
		val block as IBlockState = world.getBlockState(pos);
		if (stationCrystalStatsMap has block) {
			val stats as int[string] = stationCrystalStatsMap[block];
			var level as int = stats[color] + growth;
			if (level >= stationCrystalsByStats[color].length) {
				level = stationCrystalsByStats[color].length - 1;
			}
			val block as IBlockState = stationCrystalsByStats[color][level];
			world.setBlockState(block, pos);
		}
	}
	recipeLogic.itemOutputs = [] as IItemStack[];
	return true;
} as ICompleteRecipeFunction;

