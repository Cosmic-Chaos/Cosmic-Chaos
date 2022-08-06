#priority 6
import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlock;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
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
import mods.gregtech.predicate.IMTEPredicate;
import mods.gregtech.IMetaTileEntity;

var loc = "mbt:ulv_assembler";

val ulv_assembler = Builder.start(loc, ulv_assembler_id)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.DOWN, RelativeDirection.FRONT)
            .aisle(
				" C ",
				" S ",
				" S ",
                "IEI"
            )
            .aisle(
                "C C",
                "R R",
                "RWR",
                "III"
            )
            .aisle(
                " C ",
                " S ",
                " S ",
                "III"
            )


            .where("E", controller.self())
			.where("C", <blockstate:contenttweaker:station_casing>)
			.where("S", <blockstate:cosmic_core:station_glass>)
			.where("R", <blockstate:industrialrenewal:frame>)
			.where("W", IMetaTileEntity.byId("gregtech:workbench") as CTPredicate)
            .where("I", CTPredicate.states(<blockstate:contenttweaker:station_casing>)
				  | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
				  | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
				  | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("ulv_assembler")
						.maxInputs(4)
                        .maxOutputs(1)
                        .build())
		.withBaseTexture(<contenttweaker:station_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
ulv_assembler.hasMaintenanceMechanics = false;
ulv_assembler.hasMufflerMechanics = false;

# [Flexible Organic Panel] from [Grass][+2]
craft.shapeless(<contenttweaker:flexible_organic_panel>, "#GB", {
  "#": <ore:plateCaveRoot>,                   # Wood Plank
  "G": <minecraft:tallgrass:1>,           # Grass
  "B": <quark:root_dye:1>,                    # Black Dye
});

# [Crafting Station] from [ULV Machine Casing][+3]
craft.make(<metaitem:mbt:ulv_assembler>, ["pretty",
  "L C L",
  "# ⌂ #",
  "L # L"], {
  "L": <ore:circuitLv>,                   # Electronic Circuit
  "C": <gregtech:machine:1647>,           # Crafting Station
  "#": <contenttweaker:flexible_organic_panel>, # Flexible Organic Panel
  "⌂": <gregtech:machine_casing:0>,         # ULV Machine Casing
});

<metaitem:mbt:ulv_assembler>.addTooltip(format.red("Can only be used in the space station"));

# [Basic Polarizer] from [Magnetic Iron Rod]*2[+4]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:wireGtDoubleGreenCrystalAlloy>*4, # 2x Green Crystal Alloy Wire
		<ore:stickIronMagnetic>*2,             # Magnetic Iron Rod
//		<metaitem:hull.plate.3>,       # Fancy Hull Plate
		<metaitem:hull.lv>,               # LV Machine Hull
		<ore:cableGtDoubleTin>               # 2x Tin Cable
	)
	.outputs(<gregtech:machine:545>)
.duration(600).EUt(14).buildAndRegister();

# [Basic Compressor] from [Heavy Hull Plate][+5]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<metaitem:electric.piston.ulv>*4,   # ULV Electric Piston
		<ore:circuitLv>*2,                # Electronic Circuit
//		<metaitem:hull.plate.3>, # Fancy Hull Plate
		<metaitem:hull.lv>,         # LV Machine Hull
		<ore:cableGtDoubleTin>         # 2x Tin Cable
//		<metaitem:hull.plate.0> # Heavy Hull Plate
	)
	.outputs(<gregtech:machine:230>)
.duration(600).EUt(14).buildAndRegister();

# [Basic Wiremill] from [ULV Conveyor Module][+4]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<metaitem:conveyor.module.ulv>*4,     # ULV Conveyor Module
		<ore:circuitLv>*2,                # Electronic Circuit
//		<metaitem:hull.plate.3>, # Fancy Hull Plate
		<metaitem:hull.lv>,         # LV Machine Hull
		<ore:cableGtDoubleTin>         # 2x Tin Cable
	)
	.outputs(<gregtech:machine:620>)
.duration(600).EUt(14).buildAndRegister();

# [Basic Alloy Smelter] from [8x Green Crystal Alloy Wire][+4]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:circuitLv>*4,                    # Electronic Circuit
		<ore:wireGtOctalGreenCrystalAlloy>*2|<metaitem:cableGtOctalRedAlloy>*2, # 8x Green Crystal Alloy Wire
//		<metaitem:hull.plate.3>,     # Fancy Hull Plate
		<metaitem:hull.lv>*2,             # LV Machine Hull
		<ore:cableGtQuadrupleTin>          # 4x Tin Cable
	)
	.outputs(<gregtech:machine:80>)
.duration(600).EUt(14).buildAndRegister();

# [Basic Lathe] from [Complex Internals][+6]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:circuitLv>*3,                # Electronic Circuit
		<metaitem:electric.piston.ulv>*2,   # ULV Electric Piston
//		<metaitem:hull.plate.3>, # Fancy Hull Plate
		<metaitem:hull.lv>,         # LV Machine Hull
		<ore:cableGtQuadrupleTin>      # 4x Tin Cable
//		<ore:gemRedCrystalAlloy>,       # Fire Gem
//		<metaitem:internal.components.1>   # Complex Internals
	)
	.outputs(<gregtech:machine:440>)
.duration(600).EUt(14).buildAndRegister();

/*
# [Hull Block] from [Rubber Ring]*32[+5]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<minecraft:compass>*3,    # Compass
		<ore:plateDoubleTin> * 4, # Double Tin Plate
		<ore:dustRedstone> * 5,   # Redstone
		<ore:dustGlass> * 4,      # Glass Dust
		<ore:ringRubber> * 32    # Rubber Ring
	)
	.outputs(<chisel:technicalnew:2>)
.duration(60).EUt(4).buildAndRegister();

# [Rusty Hull] from [Glass Dust]*6[+5]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:ingotCopper> * 10,      # Copper Ingot
		<ore:gearBronze>,            # Bronze Gear
		<ore:wireFineRedAlloy> * 24, # Fine Red Alloy Wire
		<ore:gearRubber> * 3,      # Rubber Gear
		<ore:dustGlass> * 6        # Glass Dust
	)
	.outputs(<chisel:factory:9>)
.duration(60).EUt(4).buildAndRegister();

# [Factory Block] from [Rubber Foil]*32[+3]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:dustRedstone> * 8,    # Redstone
		<ore:foilRubber> * 32,     # Rubber Foil
		<ore:dustGlass> # Glass Dust
	)
	.outputs(<chisel:technical>)
.duration(60).EUt(4).buildAndRegister();

# [Tough Hull] from [Coal Dust]*3[+4]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<gregtech:steam_casing:2> * 3, # Steel Hull
		<ore:dustRedstone> * 12,   # Redstone
		<ore:plateRubber> * 24,    # Rubber Sheet
		<ore:dustGlass> * 6       # Glass Dust
	)
	.outputs(<chisel:laboratory:11>)
.duration(60).EUt(4).buildAndRegister();

# [Factory Block] from [Tin Plate]*4
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:plateTin> * 4 # Tin Plate
	)
	.outputs(<chisel:technical:14>)
.duration(60).EUt(4).buildAndRegister();

# [Tough Hull] from [Tough Hull][+1]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:screwSilver> * 24, # Silver Screw
		<chisel:laboratory:15> # Tough Hull
	)
	.outputs(<chisel:laboratory:5>)
.duration(60).EUt(4).buildAndRegister();

# [Tough Hull] from [Diamond]*2
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:gemDiamond>*2 # Diamond
	)
	.outputs(<chisel:laboratory:15>)
.duration(60).EUt(4).buildAndRegister();
*/

# [Steel Hull] from [Steel Plate]*8
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:plateSteel> * 8 # Steel Plate
	)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:8}))
	.outputs(<gregtech:steam_casing:2>)
.duration(60).EUt(4).buildAndRegister();

# [ULV Conveyor Module] from [Rubber Sheet]*2[+3]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:cableGtSingleGreenCrystalAlloy>|<metaitem:cableGtSingleRedAlloy>, # 1x Green Crystal Alloy Cable
		<ore:plateRubber>,           # Rubber Sheet
		<metaitem:electric.motor.ulv>,         # ULV Electric Motor
		<ore:plateBronze>                   # Bronze Plate
	)
	.outputs(<metaitem:conveyor.module.ulv>)
.duration(200).EUt(4).buildAndRegister();

# [ULV Electric Pump] from [Rubber Ring][+3]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:cableGtSingleGreenCrystalAlloy>|<metaitem:cableGtSingleRedAlloy>, # 1x Green Crystal Alloy Cable
		<ore:ringRubber>,                     # Rubber Ring
		<ore:rotorBronze>,                    # Bronze Rotor
		<ore:screwBronze>                   # Bronze Screw
	)
	.outputs(<metaitem:electric.pump.ulv>)
.duration(200).EUt(4).buildAndRegister();

# [ULV Electric Motor] from [Magnetic Iron Rod][+2]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<ore:cableGtSingleGreenCrystalAlloy>*2|<metaitem:cableGtSingleRedAlloy>*2, # 1x Green Crystal Alloy Cable
		<ore:stickIronMagnetic>,       # Magnetic Iron Rod
		<ore:stickIron>              # Iron Rod
	)
	.outputs(<metaitem:electric.motor.ulv>)
.duration(200).EUt(4).buildAndRegister();

# [ULV Electric Piston] from [Bronze Rod][+1]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<metaitem:electric.motor.ulv>, # ULV Electric Motor
		<ore:plateBronze>,     # Bronze Plate
		<ore:gearSmallBronze>, # Small Bronze Gear
		<ore:stickBronze>     # Bronze Rod
	)
	.outputs(<metaitem:electric.piston.ulv>)
.duration(200).EUt(4).buildAndRegister();


# [Basic Centrifuge] from [ULV Electric Motor][+3]
ulv_assembler.recipeMap.recipeBuilder()
	.inputs(
		<metaitem:hull.lv>, 				# LV Machine Hull
		<metaitem:electric.motor.ulv>*4,   # ULV Electric Motor
		<ore:circuitLv>*4, 					# Electronic Circuit
		<ore:cableGtDoubleTin>    			# 2x Tin Cable
	)
	.outputs(<metaitem:centrifuge.lv>)
.duration(200).EUt(4).buildAndRegister();


// Check correct dimension
ulv_assembler.formStructureFunction = function(controller as IControllerTile, context as IPatternMatchContext){
	if(controller.getWorld().getDimension() != 33){
		controller.invalidateStructure();
	}
} as IFormStructureFunction;

