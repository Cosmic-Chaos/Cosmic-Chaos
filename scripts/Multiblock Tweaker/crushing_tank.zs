import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;


var loc = "mbt:crushing_tank";

val crushing_tank = Builder.start(loc)
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
			.where("S", CTPredicate.blocks(<metastate:advancedrocketry:sawblade>.block))
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)

                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("crushing_tank")
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
crushing_tank.hasMaintenanceMechanics = false;
crushing_tank.hasMufflerMechanics = false;

// Controller Recipe
recipes.addShaped(
    <metaitem:mbt:crushing_tank>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Recipes	
	
crushing_tank
	.recipeMap
		.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<chisel:laboratory:11>)
	.chancedOutput(<contenttweaker:hull_plate_t3>*2, 9000, 1000)
	.chancedOutput(<contenttweaker:hull_plate_t3>, 7500, 1000)
	.chancedOutput(<contenttweaker:internals_t1>*2, 7500, 1000)
	.chancedOutput(<contenttweaker:internals_t1>, 5000, 1000)
    .buildAndRegister();
	