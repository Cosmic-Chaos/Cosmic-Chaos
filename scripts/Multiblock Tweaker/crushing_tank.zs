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
                        //.setProgressBar(<texture_area:progress_bar_energy>, MoveType.HORIZONTAL) // found at \resources\multiblocktweaker\textures\gui/progress_bar_energy.png
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
crushing_tank.hasMaintenanceMechanics = false;
crushing_tank.hasMufflerMechanics = false;



// Just above the controller
val getCenter = function (pos as IBlockPos, facing as IFacing) as IBlockPos[] {
    return [
        pos.getOffset(IFacing.up(), 1),
    ] as IBlockPos[];
};

        //if (!(world.getPickedBlock(pos, null, null) has <contenttweaker:crystal_green_glass>))
        //if (<contenttweaker:crystal_green_glass> in world.getPickedBlock(pos, null, null))
        //server.commandManager.executeCommand(server, "msg @p Bio-Organic Fabricator needs cleaning!");

val blocksToCheck =
[
    <contenttweaker:crystal_cluster_blue_1>,
    <contenttweaker:crystal_cluster_blue_2>,
    <contenttweaker:crystal_cluster_blue_3>,
    <contenttweaker:crystal_cluster_blue_4>,
    <contenttweaker:crystal_cluster_blue_5>,
    <contenttweaker:crystal_cluster_blue_6>,
    <contenttweaker:crystal_cluster_blue_7>,
    <contenttweaker:crystal_cluster_green_1>,
    <contenttweaker:crystal_cluster_green_2>,
    <contenttweaker:crystal_cluster_green_3>,
    <contenttweaker:crystal_cluster_green_4>,
    <contenttweaker:crystal_cluster_green_5>,
    <contenttweaker:crystal_cluster_green_6>,
    <contenttweaker:crystal_cluster_green_7>,
    <contenttweaker:crystal_cluster_red_1>,
    <contenttweaker:crystal_cluster_red_2>,
    <contenttweaker:crystal_cluster_red_3>,
    <contenttweaker:crystal_cluster_red_4>,
    <contenttweaker:crystal_cluster_red_5>,
    <contenttweaker:crystal_cluster_red_6>,
    <contenttweaker:crystal_cluster_red_7>,
]
 as IItemStack[];

static baseCrystals as IBlockState[] = [
	<blockstate:contenttweaker:crystal_cluster_blue_1>,
	<blockstate:contenttweaker:crystal_cluster_red_1>,
	<blockstate:contenttweaker:crystal_cluster_green_1>
] as IBlockState[];

static crystalMap as IBlockState[IBlockState] = {
	//////////////////// BLUE ///////////////
    <blockstate:contenttweaker:crystal_cluster_blue_1>:
		<blockstate:contenttweaker:crystal_cluster_blue_2>,
    <blockstate:contenttweaker:crystal_cluster_blue_2>:
		<blockstate:contenttweaker:crystal_cluster_blue_3>,
	<blockstate:contenttweaker:crystal_cluster_blue_3>:
		<blockstate:contenttweaker:crystal_cluster_blue_4>,
	<blockstate:contenttweaker:crystal_cluster_blue_4>:
		<blockstate:contenttweaker:crystal_cluster_blue_5>,
	<blockstate:contenttweaker:crystal_cluster_blue_5>:
		<blockstate:contenttweaker:crystal_cluster_blue_6>,
	<blockstate:contenttweaker:crystal_cluster_blue_6>:
		<blockstate:contenttweaker:crystal_cluster_blue_7>,
	<blockstate:contenttweaker:crystal_cluster_blue_7>:
		<blockstate:actuallyadditions:block_crystal_cluster_lapis:facing=up>,
    //////////////////// RED ///////////////
    <blockstate:contenttweaker:crystal_cluster_red_1>:
		<blockstate:contenttweaker:crystal_cluster_red_2>,
    <blockstate:contenttweaker:crystal_cluster_red_2>:
		<blockstate:contenttweaker:crystal_cluster_red_3>,
    <blockstate:contenttweaker:crystal_cluster_red_3>:
		<blockstate:contenttweaker:crystal_cluster_red_4>,
    <blockstate:contenttweaker:crystal_cluster_red_4>:
		<blockstate:contenttweaker:crystal_cluster_red_5>,
    <blockstate:contenttweaker:crystal_cluster_red_5>:
		<blockstate:contenttweaker:crystal_cluster_red_6>,
	<blockstate:contenttweaker:crystal_cluster_red_6>:
		<blockstate:contenttweaker:crystal_cluster_red_7>,
	<blockstate:contenttweaker:crystal_cluster_red_7>:
		<blockstate:actuallyadditions:block_crystal_cluster_redstone:facing=up>,
    //////////////////// GREEN ///////////////
    <blockstate:contenttweaker:crystal_cluster_green_1>:
		<blockstate:contenttweaker:crystal_cluster_green_2>,
	<blockstate:contenttweaker:crystal_cluster_green_2>:
		<blockstate:contenttweaker:crystal_cluster_green_3>,
	<blockstate:contenttweaker:crystal_cluster_green_3>:
		<blockstate:contenttweaker:crystal_cluster_green_4>,
	<blockstate:contenttweaker:crystal_cluster_green_4>:
		<blockstate:contenttweaker:crystal_cluster_green_5>,
	<blockstate:contenttweaker:crystal_cluster_green_5>:
		<blockstate:contenttweaker:crystal_cluster_green_6>,
	<blockstate:contenttweaker:crystal_cluster_green_6>:
		<blockstate:contenttweaker:crystal_cluster_green_7>,
	<blockstate:contenttweaker:crystal_cluster_green_7>:
		<blockstate:actuallyadditions:block_crystal_cluster_emerald:facing=up>
} as IBlockState[IBlockState];

// check if the crystal can grow more, if so, start.
crushing_tank.checkRecipeFunction = function(controller as IControllerTile, recipe as IRecipe, consumeIfSuccess as bool) as bool {
    val world as IWorld = controller.world;
    for pos in getCenter(controller.pos, controller.frontFacing) {
        if (world.isAirBlock(pos)) {
            return true;
        } else {
			val block as IBlockState = world.getBlockState(pos);
			if (crystalMap has block) {
                return true;
            }
        }
    }
	return false;
} as ICheckRecipeFunction;

// 1/4 chance to progress crystal growth
crushing_tank.completeRecipeFunction = function (recipeLogic as IRecipeLogic) as bool {
    val controller as IControllerTile = recipeLogic.metaTileEntity;
    val world as IWorld = controller.world;

    for pos in getCenter(controller.pos, controller.frontFacing) {
        if (world.getRandom().nextInt(4) == 0) {
            if (world.isAirBlock(pos)) {
				val crystalType as int = world.getRandom().nextInt(baseCrystals.length);
                world.setBlockState(baseCrystals[crystalType], pos);
            } else {
				val block as IBlockState = world.getBlockState(pos);
				if (crystalMap has block) {
					world.setBlockState(crystalMap[block], pos);
				}
			}
        }
    }
    return true;
} as ICompleteRecipeFunction;

# [Station Recycler] from [tile.contenttweaker.controller_broken_south.name][+5]
craft.remake(<metaitem:mbt:crushing_tank>, ["pretty",
  "P r P",
  "G t G",
  "¤ ⌂ ¤"], {
  "P": <contenttweaker:station_component_4>,     # Primitive Crafting Storage
  "r": <metaitem:circuit.vacuum_tube>,                   # Vacuum Tube
  "G": <ore:wireGtDoubleTin>,                    # 2x Tin Wire
  "t": <contenttweaker:controller_broken_south>, # tile.contenttweaker.controller_broken_south.name
  "¤": <ore:gearCopper>,                         # Copper Gear
  "⌂": <contenttweaker:station_casing>,          # Derelict Casing
});

// Recipes	

//Dense Hull Block
crushing_tank.recipeMap.recipeBuilder()
    .duration(80)
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
    .duration(80)
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
    .duration(80)
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
    .duration(40)
    .EUt(8)
    .inputs(<contenttweaker:internals_t1>)
    .outputs(<minecraft:redstone>*4,<contenttweaker:scrap_rubber>)
	.chancedOutput(<contenttweaker:scrap_rubber>, 7500, 1000)
	.chancedOutput(<contenttweaker:scrap_rubber>, 5000, 1000)
	.chancedOutput(<contenttweaker:scrap_rubber>, 2500, 1000)
	.chancedOutput(<metaitem:dustGlass>*2, 7500, 1000)
.buildAndRegister();



//Copper Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(40)
    .EUt(8)
    .inputs(<contenttweaker:broken_hull_plate_t2>)
    .outputs(<metaitem:dustCopper>)
	.chancedOutput(<metaitem:dustCopper>, 5000, 1000)
	.chancedOutput(<metaitem:dustCopper>, 2500, 1000)
.buildAndRegister();


//Iron Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(40)
    .EUt(8)
    .inputs(<contenttweaker:broken_hull_plate_t1>)
    .outputs(<metaitem:dustIron>)
	.chancedOutput(<metaitem:dustIron>, 5000, 1000)
	.chancedOutput(<metaitem:dustIron>, 2500, 1000)
.buildAndRegister();


//Tin Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(40)
    .EUt(8)
    .inputs(<contenttweaker:broken_hull_plate_t3>)
    .outputs(<metaitem:dustTin>)
	.chancedOutput(<metaitem:dustTin>, 5000, 1000)
	.chancedOutput(<metaitem:dustTin>, 2500, 1000)
.buildAndRegister();

//Crude Steel Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(40)
    .EUt(8)
    .inputs(<contenttweaker:hull_plate_t3>)
    .outputs(<metaitem:dustCrudeSteel>)
	.chancedOutput(<metaitem:dustCrudeSteel>, 5000, 1000)
	.chancedOutput(<metaitem:dustCrudeSteel>, 2500, 1000)
.buildAndRegister();


//Bio Chaff
crushing_tank.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(2)
    .inputs(<metaitem:plant_ball>*2)
    .outputs(<metaitem:bio_chaff>)
	.chancedOutput(<metaitem:bio_chaff>, 5000, 1000)
	.chancedOutput(<metaitem:bio_chaff>, 2500, 1000)
.buildAndRegister();


//Rubber
crushing_tank.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(4)
    .inputs(<contenttweaker:scrap_rubber>)
    .outputs(<metaitem:dustSmallRubber>)
	.chancedOutput(<metaitem:dustSmallRubber>, 5000, 1000)
	.chancedOutput(<metaitem:dustSmallRubber>, 3000, 1000)
	.chancedOutput(<metaitem:dustSmallRubber>, 1500, 1000)
.buildAndRegister();

//Rusty Batteries
crushing_tank.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(8)
    .inputs(<devtech:meta_item:2>.withTag({Charge: 0 as long}))
    .outputs(<metaitem:dustLead>*4)
	.chancedOutput(<metaitem:dustIron>, 7500, 1000)
	.chancedOutput(<metaitem:dustTin>, 5000, 1000)
	.chancedOutput(<metaitem:dustTin>, 2500, 1000)
.buildAndRegister();

//Wood Pulp
crushing_tank.recipeMap.recipeBuilder()
    .duration(40)
    .EUt(4)
    .inputs(<ore:logWood>)
    .outputs(<metaitem:dustWood>*3)
	.chancedOutput(<metaitem:dustWood>, 7500, 1000)
	.chancedOutput(<metaitem:dustWood>, 5000, 1000)
	.chancedOutput(<metaitem:dustWood>, 2500, 1000)
.buildAndRegister();


//Green Crystal
crushing_tank.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(6)
    .inputs(<actuallyadditions:item_crystal_shard:4>)
    .outputs(<metaitem:dustGreenCrystal>)
	.chancedOutput(<metaitem:dustGreenCrystal>, 5000, 1000)
.buildAndRegister();

//Red Crystal
crushing_tank.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(6)
    .inputs(<actuallyadditions:item_crystal_shard>)
    .outputs(<metaitem:dustRedCrystal>)
	.chancedOutput(<metaitem:dustRedCrystal>, 5000, 1000)
.buildAndRegister();

//Blue Crystal
crushing_tank.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(6)
    .inputs(<actuallyadditions:item_crystal_shard:1>)
    .outputs(<metaitem:dustBlueCrystal>)
	.chancedOutput(<metaitem:dustBlueCrystal>, 5000, 1000)
.buildAndRegister();


// 1:1 I/O
val ingotDustMap as IItemStack[IOreDictEntry] = {
<ore:ingotCrudeSteel>:<metaitem:dustCrudeSteel>,
<ore:ingotCopper>:<metaitem:dustCopper>,
<ore:ingotIron>:<metaitem:dustIron>,
<ore:ingotTin>:<metaitem:dustTin>,
<ore:ingotBronze>:<metaitem:dustBronze>,
<ore:frameGtWroughtIron>:<metaitem:dustWroughtIron>*2
} as IItemStack[IOreDictEntry];

for ingot, dust in ingotDustMap {
    crushing_tank.recipeMap.recipeBuilder()
        .duration(50)
        .EUt(8)
        .inputs(ingot)
        .outputs(dust)
    .buildAndRegister();
}

