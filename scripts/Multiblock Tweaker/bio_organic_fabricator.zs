import crafttweaker.block.IBlockState;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
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
import crafttweaker.command.ICommandSender;
import crafttweaker.command.ICommandManager;

var loc = "mbt:bio_organic_fabricator";

val bio_organic_fabricator = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            
            .aisle(
                "CCC",
                "CGC",
                "CGC",
                "IEI"
            )
            .aisle(
                "CCC",
                "G G",
                "G G",
                "ICI"
            )
            .aisle(
                "CCC",
                "CGC",
                "CGC",
                "III"
            )

            .where("E", controller.self())
			.where("C", <blockstate:contenttweaker:station_casing>)
            //.where(" ", CTPredicate.getAir()) // Anything
			.where("G", CTPredicate.blocks(<contenttweaker:crystal_green_glass>) | CTPredicate.blocks(<contenttweaker:vat_glass>))
            //.where("S", CTPredicate.liquids(<liquid:sludge>))
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
            
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("bio_organic_fabricator")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(3)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
bio_organic_fabricator.hasMaintenanceMechanics = false;
bio_organic_fabricator.hasMufflerMechanics = false;


// Where Blocks go
val getSurround = function (pos as IBlockPos, facing as IFacing) as IBlockPos[] {
    val center as IBlockPos = pos.getOffset(facing.opposite, 1);
    return [
        // Layer 1
        center.getOffset(IFacing.up(), 1).getOffset(IFacing.north(), 1),
        center.getOffset(IFacing.up(), 1).getOffset(IFacing.south(), 1),
        center.getOffset(IFacing.up(), 1).getOffset(IFacing.east(), 1),
        center.getOffset(IFacing.up(), 1).getOffset(IFacing.west(), 1),
        
        // Layer 2
        center.getOffset(IFacing.up(), 2).getOffset(IFacing.north(), 1),
        center.getOffset(IFacing.up(), 2).getOffset(IFacing.south(), 1),
        center.getOffset(IFacing.up(), 2).getOffset(IFacing.east(), 1),
        center.getOffset(IFacing.up(), 2).getOffset(IFacing.west(), 1),
        
        // Layer 3
        //center.getOffset(IFacing.up(), 3)
    ] as IBlockPos[];
};

val getCenter = function (pos as IBlockPos, facing as IFacing) as IBlockPos[] {
    val center as IBlockPos = pos.getOffset(facing.opposite, 1);
    return [
        center.getOffset(IFacing.up(), 1),
        center.getOffset(IFacing.up(), 2)
    ] as IBlockPos[];
};


        //if (!(world.getPickedBlock(pos, null, null) has <contenttweaker:crystal_green_glass>))
        //if (<contenttweaker:crystal_green_glass> in world.getPickedBlock(pos, null, null))
        //server.commandManager.executeCommand(server, "msg @p Bio-Organic Fabricator needs cleaning!");

// check if any glass is cleam, if so, start.
bio_organic_fabricator.checkRecipeFunction = function(controller as IControllerTile, recipe as IRecipe, consumeIfSuccess as bool) as bool {
    val world as IWorld = controller.world;
    for pos in getSurround(controller.pos, controller.frontFacing) 
    {
        if (world.getPickedBlock(pos, null, null) has <contenttweaker:crystal_green_glass>) {
            return true;
        }
    }
return false;
} as ICheckRecipeFunction;


// if the machine is working --- Add Sludge. if the machine is not working and not active (have a recipe but not working, e.g. hasEnergyProblem) --- Remove Sludge.
bio_organic_fabricator.updateFormedValidFunction = function(controller as IControllerTile) {
    val world as IWorld = controller.world;
    if (controller.offsetTimer % 20 == 0) {
        if (controller.recipeLogic.isWorking) {
            for pos in getCenter(controller.pos, controller.frontFacing) {
                    world.setBlockState(<blockstate:industrialforegoing:sludge>, pos); // SLUDGE
            }
        } else if (!controller.recipeLogic.isActive) { //Clear interior so next recipe can run
            for pos in getCenter(controller.pos, controller.frontFacing) {
                if (!world.isAirBlock(pos)) {
                    world.setBlockState(<blockstate:minecraft:air>, pos);
                    return;
                }
            }
        }
    }
} as IUpdateFormedValidFunction;


// 1/10 chance for one of the glass to get dirty
bio_organic_fabricator.completeRecipeFunction = function (recipeLogic as IRecipeLogic) as bool {
    val controller as IControllerTile = recipeLogic.metaTileEntity;
    val world as IWorld = controller.world;
    for pos in getSurround(controller.pos, controller.frontFacing) {
         if (world.getRandom().nextInt(10) == 0) {
             world.setBlockState(<blockstate:contenttweaker:vat_glass>, pos);
         }
    }
    for pos in getCenter(controller.pos, controller.frontFacing) { // Remove Sludge
             world.setBlockState(<blockstate:minecraft:air>, pos);
    }
    return true;
} as ICompleteRecipeFunction;

// Controller Recipe
recipes.addShaped(
    <metaitem:mbt:bio_organic_fabricator>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Recipes	
	
bio_organic_fabricator
	.recipeMap
		.recipeBuilder()
    .duration(500)
    .EUt(8)
    .inputs(<fossil:sheep_dna>)
	.fluidInputs(<liquid:sludge> * 1000)
    .outputs(<minecraft:mutton> * 2,
			 <minecraft:wool> * 4,
	         <minecraft:bone> * 2)
    .buildAndRegister();
	