import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

print("==================== loading The Station/ulv_sintering.zs ====================");
##########################################################################################

/////////////////////////////////////////////////////////////////////
///////////////////////////// SINTERING /////////////////////////////
/////////////////////////////////////////////////////////////////////


# [Primitive Sintering Furnace] from [ULV Machine Hull][+5]
craft.remake(<metaitem:devtech:sintering_furnace.ulv>, ["pretty",
  "U S U",
  "* L *",
  "□ ¤ □"], {
  "U": <metaitem:circuit.vacuum_tube>,              # Vacuum Tube
  "S": <morefurnaces:furnaceblock:6>, # Silver Furnace
  "*": <ore:gemRedCrystalAlloy>,      # Firestone
  "L": <metaitem:hull.ulv>,        # ULV Machine Hull
  "□": <ore:plateBlueAlloy>,          # Blue Alloy Plate
  "¤": <ore:gearCrudeSteel>,          # Crude Steel Gear
});

val sinteringMapULV as IItemStack[][IOreDictEntry] = {
    <ore:dustIron>:[<ore:blockIron>.firstItem, <ore:stickIron>.firstItem],
    <ore:dustWroughtIron>:[<ore:blockWroughtIron>.firstItem, <ore:stickWroughtIron>.firstItem],
    <ore:dustTin>:[<ore:blockTin>.firstItem, <ore:stickTin>.firstItem],
    <ore:dustCopper>:[<ore:blockCopper>.firstItem, <ore:stickCopper>.firstItem],
    <ore:dustBronze>:[<ore:blockBronze>.firstItem, <ore:stickBronze>.firstItem],
    <ore:dustCrudeSteel>:[<ore:blockCrudeSteel>.firstItem, <ore:stickCrudeSteel>.firstItem],
    <ore:dustRedAlloy>:[<ore:blockRedAlloy>.firstItem, <ore:stickRedAlloy>.firstItem],
    <ore:dustGreenCrystalAlloy>:[<ore:blockGreenCrystalAlloy>.firstItem, null],
    <ore:dustSilver>:[<ore:blockSilver>.firstItem, <ore:stickSilver>.firstItem],
    <ore:dustLead>:[<ore:blockLead>.firstItem, <ore:stickLead>.firstItem],
    <ore:dustPotin>:[<ore:blockPotin>.firstItem, <ore:stickPotin>.firstItem],
    <ore:dustTinAlloy>:[<ore:blockTinAlloy>.firstItem, <ore:stickTinAlloy>.firstItem],
    <ore:dustBlueAlloy>:[<ore:blockBlueAlloy>.firstItem, <ore:stickBlueAlloy>.firstItem],
} as IItemStack[][IOreDictEntry];

for dust, output in sinteringMapULV {
<recipemap:sintering_furnace>.recipeBuilder().duration(320).EUt(8)
	.notConsumable(<metaitem:shape.mold.block>)
	.inputs(dust*9)
	.outputs(output[0])
.buildAndRegister();

	if (!(isNull(output[1]))) {
<recipemap:sintering_furnace>.recipeBuilder().duration(160).EUt(8)
	.notConsumable(<contenttweaker:mold_rod>)
	.inputs(dust*2)
	.outputs(output[1]*3)
.buildAndRegister();
	}
}

<recipemap:sintering_furnace>.recipeBuilder().duration(80).EUt(8)
	.notConsumable(<metaitem:shape.mold.block>)
	.inputs(<contenttweaker:dust_crystal_green_glass>)
	.outputs(<cosmic_core:crystal_green_glass>)
.buildAndRegister();

<recipemap:sintering_furnace>.recipeBuilder().duration(80).EUt(8)
	.notConsumable(<metaitem:shape.mold.block>)
	.inputs(<contenttweaker:dust_crystal_purple_glass>)
	.outputs(<cosmic_core:crystal_purple_glass>)
.buildAndRegister();


##########################################################################################
print("==================== end of The Station/ulv_sintering.zs ====================");
