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
# [Trash Compactor] from [tile.contenttweaker.controller_broken_north.name][+5]
craft.remake(<metaitem:mbt:trash_compactor>, ["pretty",
  "¤ P ¤",
  "L t L",
  "* ⌂ *"], {
  "¤": <ore:gearSmallBronze>,                    # Small Bronze Gear
  "P": <ore:circuitPrimitive>,                   # Vacuum Tube
  "L": <metaitem:electric.motor.lv>,               # LV Electric Motor
  "t": <contenttweaker:controller_broken_north>, # tile.contenttweaker.controller_broken_north.name
  "*": <ore:wireGtDoubleGreenCrystalAlloy>,      # 2x Green Crystal Alloy Wire
  "⌂": <contenttweaker:station_casing>,          # Derelict Casing
});

# [Small Plate Presser] from [Crude Steel Frame Box][+4]
craft.remake(<advancedrocketry:platepress>, ["pretty",
  "□ □ □",
  "¤ ◙ ¤",
  "W L W"], {
  "□": <ore:plateTin>,             # Tin Plate
  "¤": <ore:gearSmallBronze>,      # Small Bronze Gear
  "◙": <ore:frameGtCrudeSteel>,    # Crude Steel Frame Box
  "W": <ore:screwWroughtIron>,     # Wrought Iron Screw
  "L": <metaitem:electric.piston.lv>, # LV Electric Piston
});


// Recipes	
	

val trashCompactorPlateMap as IItemStack[IOreDictEntry] = {
    <ore:ingotIron>:<ore:plateIron>.firstItem,
    <ore:ingotWroughtIron>:<ore:plateWroughtIron>.firstItem,
    <ore:ingotTin>:<ore:plateTin>.firstItem,
    <ore:ingotCopper>:<ore:plateCopper>.firstItem,
    <ore:ingotBronze>:<ore:plateBronze>.firstItem,
    <ore:ingotCrudeSteel>:<ore:plateCrudeSteel>.firstItem,
    <ore:ingotRedAlloy>:<ore:plateRedAlloy>.firstItem,
    <ore:ingotGreenCrystalAlloy>:<ore:plateGreenCrystalAlloy>.firstItem,
} as IItemStack[IOreDictEntry];
for ingot, plate in trashCompactorPlateMap {
trash_compactor.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(8)
    .inputs(ingot*3)
    .outputs(plate*2)
.buildAndRegister();
}
