#priority 6
import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlock;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
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
import crafttweaker.liquid.ILiquidStack;

var loc = "mbt:station_generator";

val station_generator = Builder.start(loc, station_generator_id)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
                "III", 
                "IEI", 
                "III"
            )
            .aisle( 
                "III", 
                "I I", 
                "III"
            )
            .aisle(
                "III", 
                "III", 
                "III"
            )
            .where("E", controller.self())
			.where("C", <blockstate:contenttweaker:station_casing>)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
                | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("station_generator")
						.maxFluidInputs(1)
                        //.setProgressBar(<texture_area:progress_bar_energy>, MoveType.HORIZONTAL) // found at \resources\multiblocktweaker\textures\gui/progress_bar_energy.png
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
station_generator.hasMaintenanceMechanics = false;
station_generator.hasMufflerMechanics = false;



// Check correct dimension
station_generator.formStructureFunction = function(controller as IControllerTile, context as IPatternMatchContext){
	if(controller.getWorld().getDimension() != 33){
		controller.invalidateStructure();
	}
} as IFormStructureFunction;

// ULV Station Generator Controller Recipe
craft.remake(<metaitem:mbt:station_generator>, ["pretty",
  "¤ P ¤",
  "L t L",
  "* ⌂ *"], {
  "¤": <metaitem:gearCrudeSteel>,                    # Small Bronze Gear
  "P": <metaitem:circuit.vacuum_tube>,                   # Vacuum Tube
  "L": <metaitem:electric.motor.ulv>,               # LV Electric Motor
  "t": <contenttweaker:controller_broken_north>, # tile.contenttweaker.controller_broken_north.name
  "*": <ore:wireGtDoubleGreenCrystalAlloy>,      # 2x Green Crystal Alloy Wire
  "⌂": <contenttweaker:station_casing>,          # Derelict Casing
});

// Recipes	

////LIQUID FUEL
///NUMBER IS IN T/MB
val liquidBioFuelMap as int[ILiquidStack] = {
<liquid:biomass>:1,
} as int[ILiquidStack];

for input, dur in liquidBioFuelMap {
	<recipemap:station_generator>.recipeBuilder()
		.fluidInputs(input)
		.duration(dur).EUt(-16).buildAndRegister();
}
