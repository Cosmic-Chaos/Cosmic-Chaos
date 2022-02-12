import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;



var loc = "mbt:cloning_vat";

val cloning_vat = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            
            .aisle(
                "CCC",
                "CGC",
                "CGC",
                "IEI"
            )
            .aisle(
                "CGC",
                "G~G",
                "G~G",
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
            .where("~", CTPredicate.getAir())
			.where("G", <blockstate:contenttweaker:vat_glass>)
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
		FactoryRecipeMap.start("cloning_vat")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
cloning_vat.hasMaintenanceMechanics = false;
cloning_vat.hasMufflerMechanics = false;

// Controller Recipe
recipes.addShaped(
    <metaitem:mbt:cloning_vat>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Recipes	
	
cloning_vat
	.recipeMap
		.recipeBuilder()
    .duration(500)
    .EUt(8)
    .inputs(<fossil:sheep_dna>)
	.fluidInputs(<liquid:sludge> * 1000)
    .outputs(<minecraft:mutton> * 2,
			 <minecraft:wool> * 4,
	         <minecraft:bone> * 2,
	         <fossil:bio_goo> * 1)
    .buildAndRegister();
	