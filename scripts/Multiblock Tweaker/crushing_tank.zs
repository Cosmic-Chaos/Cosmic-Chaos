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
                        .maxOutputs(6)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
crushing_tank.hasMaintenanceMechanics = false;
crushing_tank.hasMufflerMechanics = false;

# [Station Recycler] from [tile.contenttweaker.controller_broken_south.name][+5]
craft.remake(<metaitem:mbt:crushing_tank>, ["pretty",
  "P r P",
  "G t G",
  "¤ ⌂ ¤"], {
  "P": <contenttweaker:station_component_4>,     # Primitive Crafting Storage
  "r": <ore:circuitPrimitive>,                   # Vacuum Tube
  "G": <ore:wireGtDoubleTin>,                    # 2x Tin Wire
  "t": <contenttweaker:controller_broken_south>, # tile.contenttweaker.controller_broken_south.name
  "¤": <ore:gearCopper>,                         # Copper Gear
  "⌂": <contenttweaker:station_casing>,          # Derelict Casing
});

// Recipes	

//Dense Hull Block
crushing_tank.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<chisel:laboratory:11>)
    .outputs(<contenttweaker:hull_plate_t3>*5)
	.chancedOutput(<contenttweaker:hull_plate_t3>*2, 7500, 1000)
	.chancedOutput(<contenttweaker:hull_plate_t3>, 5000, 1000)
	.chancedOutput(<contenttweaker:internals_t1>*2, 7500, 1000)
	.chancedOutput(<contenttweaker:internals_t1>, 5000, 1000)
.buildAndRegister();
	
    
//Heavy Hull Block
crushing_tank.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<chisel:technicalnew:2>)
    .outputs(<contenttweaker:broken_hull_plate_t1>*3, <contenttweaker:broken_hull_plate_t3>*3)
	.chancedOutput(<contenttweaker:broken_hull_plate_t1>, 7500, 1000)
	.chancedOutput(<contenttweaker:broken_hull_plate_t3>, 7500, 1000)
	.chancedOutput(<contenttweaker:internals_t1>*2, 7500, 1000)
	.chancedOutput(<contenttweaker:internals_t1>, 5000, 1000)
.buildAndRegister();
	
    
//Light Hull Block
crushing_tank.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<chisel:factory:9>)
    .outputs(<contenttweaker:broken_hull_plate_t2>*5)
	.chancedOutput(<contenttweaker:broken_hull_plate_t2>*4, 7500, 1000)
	.chancedOutput(<contenttweaker:broken_hull_plate_t2>*2, 5000, 1000)
	.chancedOutput(<contenttweaker:broken_hull_plate_t3>, 5000, 1000)
	.chancedOutput(<contenttweaker:internals_t1>*2, 7500, 1000)
	.chancedOutput(<contenttweaker:internals_t1>, 5000, 1000)
.buildAndRegister();
	
//Simple Internals
crushing_tank.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(8)
    .inputs(<contenttweaker:internals_t1>)
    .outputs(<minecraft:redstone>*4)
	.chancedOutput(<metaitem:dustGlass>*2, 7500, 1000)
	.chancedOutput(<contenttweaker:scrap_rubber>*2, 5000, 1000)
.buildAndRegister();



//Copper Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<contenttweaker:broken_hull_plate_t2>)
    .outputs(<metaitem:dustCopper>)
	.chancedOutput(<metaitem:dustCopper>, 5000, 1000)
	.chancedOutput(<metaitem:dustCopper>, 2500, 1000)
.buildAndRegister();
//Copper Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<metaitem:ingotCopper>)
    .outputs(<metaitem:dustCopper>)
.buildAndRegister();


//Iron Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<contenttweaker:broken_hull_plate_t1>)
    .outputs(<metaitem:dustIron>)
	.chancedOutput(<metaitem:dustIron>, 5000, 1000)
	.chancedOutput(<metaitem:dustIron>, 2500, 1000)
.buildAndRegister();

//Iron Ingot
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<minecraft:iron_ingot>)
    .outputs(<metaitem:dustIron>)
.buildAndRegister();


//Tin Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<contenttweaker:broken_hull_plate_t3>)
    .outputs(<metaitem:dustTin>)
	.chancedOutput(<metaitem:dustTin>, 5000, 1000)
	.chancedOutput(<metaitem:dustTin>, 2500, 1000)
.buildAndRegister();

//Tin Ingot
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<metaitem:ingotTin>)
    .outputs(<metaitem:dustTin>)
.buildAndRegister();

//Crude Steel Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<contenttweaker:hull_plate_t3>)
    .outputs(<metaitem:dustCrudeSteel>)
	.chancedOutput(<metaitem:dustCrudeSteel>, 5000, 1000)
	.chancedOutput(<metaitem:dustCrudeSteel>, 2500, 1000)
.buildAndRegister();

//Crude Steel Ingot
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<ore:ingotCrudeSteel>)
    .outputs(<metaitem:dustCrudeSteel>)
.buildAndRegister();


//Green Crystal
crushing_tank.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(<actuallyadditions:item_crystal_shard:4>*2)
    .outputs(<contenttweaker:dust_crystal_green>)
	.chancedOutput(<contenttweaker:dust_crystal_green>, 2500, 1000)
.buildAndRegister();