import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;

var loc = "mbt:station_generator";

val station_generator = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
                "CCC",
                "CEC",
                "III"
            )
            .aisle(
                "CCC",
                "C~C",
                "III"
            )
            .aisle(
                "CCC",
                "CCC",
                "III"
            )
            .where("E", controller.self())
            .where("~", CTPredicate.getAir())
			.where("C", <blockstate:contenttweaker:station_casing>)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>) | controller.autoAbilities())
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("station_generator")
                        .minInputs(0)
						.maxInputs(1)
                        .minFluidInputs(0)
                        .maxFluidInputs(1)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
station_generator.hasMaintenanceMechanics = false;
station_generator.hasMufflerMechanics = false;

// Controller Recipe
# [Trash Compactor] from [tile.contenttweaker.controller_broken_north.name][+5]
craft.remake(<metaitem:mbt:station_generator>, ["pretty",
  "¤ P ¤",
  "L t L",
  "* ⌂ *"], {
  "¤": <ore:gearSmallBronze>,                    # Small Bronze Gear
  "P": <metaitem:circuit.vacuum_tube>,                   # Vacuum Tube
  "L": <contenttweaker:electric_motor_ulv>,               # LV Electric Motor
  "t": <contenttweaker:controller_broken_north>, # tile.contenttweaker.controller_broken_north.name
  "*": <ore:wireGtDoubleGreenCrystalAlloy>,      # 2x Green Crystal Alloy Wire
  "⌂": <contenttweaker:station_casing>,          # Derelict Casing
});


// Recipes	
station_generator.recipeMap.recipeBuilder()
    .duration(500)
    .EUt(8)
    .inputs(<fossil:sheep_dna>)
//	.fluidInputs(<liquid:nutrient_distillation> * 2000)
    .buildAndRegister();
