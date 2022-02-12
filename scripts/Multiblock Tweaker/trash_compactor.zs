import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;


var loc = "mbt:trash_compactor";

val trash_compactor = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
                "FCCF",
                "F~~F",
                "CCCC",
                "IEII"
            )
            .aisle(
                "CCCC",
                "~PP~",
                "C~~C",
                "ICCI"
            ).setRepeatable(2)
            .aisle(
                "FCCF",
                "F~~F",
                "CCCC",
                "IIII"
            )
            .where("E", controller.self())
            .where("~", CTPredicate.getAir())
			.where("C", <blockstate:contenttweaker:station_casing>)
			.where("P", <metastate:advancedrocketry:platepress:0>)
			//.where("P", CTPredicate.blocks(<metastate:advancedrocketry:platepress>.block))
			.where("F", <blockstate:industrialrenewal:frame>)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
            
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("trash_compactor")
                        .minInputs(1)
						.maxInputs(2)
						.minOutputs(1)
                        .maxOutputs(1)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
trash_compactor.hasMaintenanceMechanics = false;
trash_compactor.hasMufflerMechanics = false;

// Controller Recipe
recipes.addShaped(
    <metaitem:mbt:trash_compactor>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Recipes	
	
trash_compactor
	.recipeMap
		.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<contenttweaker:hull_plate_t3>*3,<contenttweaker:internals_t1>)
	.outputs(<chisel:laboratory:11>)
    .buildAndRegister();
	