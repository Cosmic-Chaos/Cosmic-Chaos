
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import crafttweaker.block.IBlockState;

import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.gregtech.multiblock.functions.ICheckRecipeFunction;
import mods.gregtech.multiblock.functions.IUpdateFormedValidFunction;
import mods.gregtech.recipe.functions.ICompleteRecipeFunction;

import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;


var loc = "mbt:oxygen_collector";

val oxygen_collector = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
                "CCCCC", 
                "CGGGC",
                "CGGGC",
                "CGGGC",
                "IIEII"
            )
            .aisle(
                "CCCCC", 
                "G   G", 
                "G   G", 
                "G   G", 
                "ITCTI"
            )
            .aisle(
                "CCCCC", 
                "G L G", 
                "G L G", 
                "G L G", 
                "ICCCI"
            )
            .aisle(
                "CCCCC", 
                "G   G", 
                "G   G", 
                "G   G", 
                "ITCTI"
            )
            .aisle(
                "CCCCC", 
                "CGGGC",
                "CGGGC",
                "CGGGC",
                "IIIII"
            )


            .where("E", controller.self())
			.where("C", <blockstate:contenttweaker:station_casing>)
			.where("T", <blockstate:advancedrocketry:liquidtank>)
			.where("G", CTPredicate.blocks(<contenttweaker:crystal_green_glass>))
			.where("L", <blockstate:contenttweaker:organic_overloader>)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("oxygen_collector")
                        .minInputs(1)
						.maxInputs(1)
						.minFluidOutputs(1)
                        .maxFluidOutputs(1)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
oxygen_collector.hasMaintenanceMechanics = false;
oxygen_collector.hasMufflerMechanics = false;

// Where Blocks go
val getSurround = function (pos as IBlockPos, facing as IFacing) as IBlockPos[] {
    val center as IBlockPos = pos.getOffset(facing.opposite, 2);
    return [
        // Layer 1
        center.getOffset(IFacing.north(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.north(), 1).getOffset(IFacing.west(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.west(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.west(), 1).getOffset(IFacing.south(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.south(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.south(), 1).getOffset(IFacing.east(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.east(), 1).getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.east(), 1).getOffset(IFacing.north(), 1).getOffset(IFacing.up(), 1),
        
        // Layer 2
        center.getOffset(IFacing.north(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.north(), 1).getOffset(IFacing.west(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.west(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.west(), 1).getOffset(IFacing.south(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.south(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.south(), 1).getOffset(IFacing.east(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.east(), 1).getOffset(IFacing.up(), 2),
        center.getOffset(IFacing.east(), 1).getOffset(IFacing.north(), 1).getOffset(IFacing.up(), 2),
        
        // Layer 3
        center.getOffset(IFacing.north(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.north(), 1).getOffset(IFacing.west(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.west(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.west(), 1).getOffset(IFacing.south(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.south(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.south(), 1).getOffset(IFacing.east(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.east(), 1).getOffset(IFacing.up(), 3),
        center.getOffset(IFacing.east(), 1).getOffset(IFacing.north(), 1).getOffset(IFacing.up(), 3),
    ] as IBlockPos[];
};

// check current recipe available, and place inputs bocks.
oxygen_collector.checkRecipeFunction = function(controller as IControllerTile, recipe as IRecipe, consumeIfSuccess as bool) as bool {
    val world as IWorld = controller.world;
    for pos in getSurround(controller.pos, controller.frontFacing) {
        if (!world.isAirBlock(pos)) {
            return false;
        }
    }
    val inputs = (recipe.getInputs() as IIngredient[])[0].items as IItemStack[];
    val blockstate as IBlockState = inputs[0].asBlock().definition.getStateFromMeta(inputs[0].metadata);
    for pos in getSurround(controller.pos, controller.frontFacing) {
        world.setBlockState(blockstate, pos);
    }
    return true;
} as ICheckRecipeFunction;

// if the machine is working --- Sweet. if the machine is not working and not active (have a recipe but not working, e.g. hasEnergyProblem) --- Remove Leaves.
oxygen_collector.updateFormedValidFunction = function(controller as IControllerTile) {
    val world as IWorld = controller.world;
    if (controller.offsetTimer % 20 == 0) {
        if (controller.recipeLogic.isWorking) {
            //Cool beans
        } else if (!controller.recipeLogic.isActive) { //Clear interior so next recipe can run
            for pos in getSurround(controller.pos, controller.frontFacing) {
                if (!world.isAirBlock(pos)) {
                    world.setBlockState(<blockstate:minecraft:air>, pos);
                    return;
                }
            }
        }
    }
} as IUpdateFormedValidFunction;


// When the recipe is complete, remove leaves
oxygen_collector.completeRecipeFunction = function (recipeLogic as IRecipeLogic) as bool {
    val controller as IControllerTile = recipeLogic.metaTileEntity;
    val world as IWorld = controller.world;
    for pos in getSurround(controller.pos, controller.frontFacing) {
         world.setBlockState(<blockstate:minecraft:air>, pos);
    }
    recipeLogic.itemOutputs = ([] as IItemStack[]); // we have collected outputs ourselves, so remove the recipe outputs.
    return true;
} as ICompleteRecipeFunction;


// Controller Recipe
recipes.addShaped(
    <metaitem:mbt:oxygen_collector>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Recipes	
	
oxygen_collector
	.recipeMap
		.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<ore:treeLeaves>*24)
	.fluidOutputs([<liquid:oxygen> * 1000])
    .buildAndRegister();
	