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
                        .minFluidOutputs(1)
                        .maxFluidOutputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(6)
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
                    world.setBlockState(<blockstate:enderio:block_fluid_nutrient_distillation>, pos); // SLUDGE
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

# [Bio-Organic Fabricator] from [ULV Machine Casing][+4]
craft.make(<metaitem:mbt:bio_organic_fabricator>, ["pretty",
  "§ A §",
  "M ⌂ M",
  "L A L"], {
  "§": <contenttweaker:internals_t2>,    # Complex Internals
  "A": <minecraft:sand>,
  "M": <minecraft:red_mushroom_block>,   # Mushroom
  "⌂": <gregtech:machine_casing>,        # ULV Machine Casing
  "L": <metaitem:circuit.vacuum_tube>,                  # Electronic Circuit
});

// Recipes	

val bioRecipeMap as IItemStack[][IItemStack] = {
    <minecraft:sapling:0>:[<minecraft:log:0> * 4,<minecraft:leaves:0> * 16, <metaitem:plant_ball>],
    <minecraft:sapling:1>:[<minecraft:log:1> * 4,<minecraft:leaves:1> * 16, <metaitem:plant_ball>],
    <minecraft:sapling:2>:[<minecraft:log:2> * 4,<minecraft:leaves:2> * 16, <metaitem:plant_ball>],
    <minecraft:sapling:3>:[<minecraft:log:3> * 4,<minecraft:leaves:3> * 16, <metaitem:plant_ball>],
    <minecraft:sapling:4>:[<minecraft:log2:0> * 4,<minecraft:leaves2:0> * 16, <metaitem:plant_ball>],
    <minecraft:sapling:5>:[<minecraft:log2:1> * 4,<minecraft:leaves2:1> * 16, <metaitem:plant_ball>],
    <fossil:sheep_dna>:[<minecraft:wool> * 4,<minecraft:mutton> * 2, <minecraft:bone> * 2],
} as IItemStack[][IItemStack];

for input, output in bioRecipeMap {
	bio_organic_fabricator.recipeMap.recipeBuilder()
		.duration(100)
		.EUt(6)
		.notConsumable(input)
		.fluidInputs(<liquid:nutrient_distillation> * 2000)
		.outputs(output[0], output[1])
		.chancedOutput(output[2], 5000, 0)
		.chancedOutput(input, 100, 0)
		.fluidOutputs(<liquid:sludge> * 1000)
	.buildAndRegister();
}

// Saplings from dead bushes
bio_organic_fabricator.recipeMap.recipeBuilder()
    .duration(120)
    .EUt(3)
    .inputs(<minecraft:deadbush>)
	.fluidInputs(<liquid:nutrient_distillation> * 2000)
	.chancedOutput(<minecraft:sapling:0>, 5000, 0) // Oak
	.chancedOutput(<minecraft:sapling:1>, 1000, 0) // Spruce
	.chancedOutput(<minecraft:sapling:2>, 1000, 0) // Birch
	.chancedOutput(<minecraft:sapling:3>, 200, 0) // Jungle
	.chancedOutput(<minecraft:sapling:4>, 200, 0) // Dark Oak
	.chancedOutput(<minecraft:sapling:5>, 200, 0) // Acacia
	.fluidOutputs(<liquid:sludge> * 1000)
.buildAndRegister();

// Quark Roots
bio_organic_fabricator.recipeMap.recipeBuilder()
	.notConsumable(<quark:root>)
	.fluidInputs(<liquid:nutrient_distillation> * 2000)
	.chancedOutput(<quark:root>, 2500, 500)
	.chancedOutput(<quark:root_flower:0>, 1800, 300)
	.chancedOutput(<quark:root_flower:1>, 1800, 300)
	.chancedOutput(<quark:root_flower:2>, 1800, 300)
	.fluidOutputs(<liquid:sludge> * 1000)
.duration(240).EUt(3).buildAndRegister();

// Rabbit
bio_organic_fabricator.recipeMap.recipeBuilder()
	.notConsumable(<fossil:rabbit_dna>)
	.fluidInputs(<liquid:nutrient_distillation> * 2000)
	.outputs(<minecraft:rabbit_hide>*4, <minecraft:rabbit>)
	.chancedOutput(<minecraft:rabbit_foot>, 2000, 0)
	.chancedOutput(<fossil:rabbit_dna>, 100, 0)
	.chancedOutput(<minecraft:bone>, 5000, 0)
	.fluidOutputs(<liquid:sludge> * 1000)
.duration(240).EUt(3).buildAndRegister();
