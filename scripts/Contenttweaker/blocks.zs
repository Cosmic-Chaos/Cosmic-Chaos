#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.IItemColorSupplier;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Color;
import crafttweaker.item.IItemStack;

import crafttweaker.world.IBlockAccess;

#priority 104

print("==================== loading blocks.zs ====================");
##########################################################################################

function itemColor(intColor as int) as IItemColorSupplier {
  return function(item as IItemStack, tint as int) as Color {
      return Color.fromInt(intColor);
  };
}
function blockColor(intColor as int) as IBlockColorSupplier {
  return function(state as BlockState, access as IBlockAccess, pos as BlockPos, tintIndex as int) as Color {
      return Color.fromInt(intColor);
  };
}


var casingStationColorItem = (itemColor(0xbfb3ac));
var casingStationColorBlock = (blockColor(0xbfb3ac));

var casingStation = VanillaFactory.createBlock("station_casing", <blockmaterial:iron>);
casingStation.setLightOpacity(3);
casingStation.setLightValue(0);
casingStation.setBlockHardness(5.0);
casingStation.setBlockResistance(5.0);
casingStation.setToolClass("pickaxe");
casingStation.setToolLevel(1);
casingStation.setBlockSoundType(<soundtype:metal>);
casingStation.blockColorSupplier = casingStationColorBlock;
casingStation.itemColorSupplier = casingStationColorItem;
casingStation.register();

var brokenControllerNorth = VanillaFactory.createBlock("controller_broken_north", <blockmaterial:iron>);
brokenControllerNorth.setLightValue(0);
brokenControllerNorth.setBlockHardness(4.0);
brokenControllerNorth.setBlockResistance(4.0);
brokenControllerNorth.setToolClass("wrench");
brokenControllerNorth.setToolLevel(1);
brokenControllerNorth.setBlockSoundType(<soundtype:metal>);
brokenControllerNorth.setFullBlock(false);
brokenControllerNorth.setTranslucent(true);
brokenControllerNorth.setBlockLayer("CUTOUT");
brokenControllerNorth.blockColorSupplier = casingStationColorBlock;
brokenControllerNorth.itemColorSupplier = casingStationColorItem;
brokenControllerNorth.register();

var brokenControllerSouth = VanillaFactory.createBlock("controller_broken_south", <blockmaterial:iron>);
brokenControllerSouth.setLightValue(0);
brokenControllerSouth.setBlockHardness(4.0);
brokenControllerSouth.setBlockResistance(4.0);
brokenControllerSouth.setToolClass("wrench");
brokenControllerSouth.setToolLevel(1);
brokenControllerSouth.setBlockSoundType(<soundtype:metal>);
brokenControllerSouth.setFullBlock(false);
brokenControllerSouth.setTranslucent(true);
brokenControllerSouth.setBlockLayer("CUTOUT");
brokenControllerSouth.blockColorSupplier = casingStationColorBlock;
brokenControllerSouth.itemColorSupplier = casingStationColorItem;
brokenControllerSouth.register();

var brokenControllerEast = VanillaFactory.createBlock("controller_broken_east", <blockmaterial:iron>);
brokenControllerEast.setLightValue(0);
brokenControllerEast.setBlockHardness(4.0);
brokenControllerEast.setBlockResistance(4.0);
brokenControllerEast.setToolClass("wrench");
brokenControllerEast.setToolLevel(1);
brokenControllerEast.setBlockSoundType(<soundtype:metal>);
brokenControllerEast.setFullBlock(false);
brokenControllerEast.setTranslucent(true);
brokenControllerEast.setBlockLayer("CUTOUT");
brokenControllerEast.blockColorSupplier = casingStationColorBlock;
brokenControllerEast.itemColorSupplier = casingStationColorItem;
brokenControllerEast.register();

var brokenControllerWest = VanillaFactory.createBlock("controller_broken_west", <blockmaterial:iron>);
brokenControllerWest.setLightValue(0);
brokenControllerWest.setBlockHardness(4.0);
brokenControllerWest.setBlockResistance(4.0);
brokenControllerWest.setToolClass("wrench");
brokenControllerWest.setToolLevel(1);
brokenControllerWest.setBlockSoundType(<soundtype:metal>);
brokenControllerWest.setFullBlock(false);
brokenControllerWest.setTranslucent(true);
brokenControllerWest.setBlockLayer("CUTOUT");
brokenControllerWest.blockColorSupplier = casingStationColorBlock;
brokenControllerWest.itemColorSupplier = casingStationColorItem;
brokenControllerWest.register();

var glassVat = VanillaFactory.createBlock("vat_glass", <blockmaterial:glass>);
glassVat.setLightValue(0);
glassVat.setBlockHardness(1.0);
glassVat.setBlockResistance(1.0);
glassVat.setToolClass("pickaxe");
glassVat.setToolLevel(1);
glassVat.setBlockSoundType(<soundtype:glass>);
glassVat.setFullBlock(false);
glassVat.setTranslucent(true);
glassVat.setBlockLayer("TRANSLUCENT");
glassVat.setLightOpacity(0);
glassVat.register();

var glassCrystal = VanillaFactory.createBlock("crystal_green_glass", <blockmaterial:glass>);
glassCrystal.setLightValue(0.2);
glassCrystal.setBlockHardness(2.0);
glassCrystal.setBlockResistance(2.0);
glassCrystal.setToolClass("pickaxe");
glassCrystal.setToolLevel(1);
glassCrystal.setBlockSoundType(<soundtype:glass>);
glassCrystal.setFullBlock(false);
glassCrystal.setTranslucent(true);
glassCrystal.setBlockLayer("TRANSLUCENT");
glassCrystal.setLightOpacity(0);
glassCrystal.register();

var organicOverloader = VanillaFactory.createBlock("organic_overloader", <blockmaterial:iron>);
organicOverloader.setLightOpacity(3);
organicOverloader.setLightValue(1);
organicOverloader.setBlockHardness(3.0);
organicOverloader.setBlockResistance(3.0);
organicOverloader.setToolClass("axe");
organicOverloader.setToolLevel(1);
organicOverloader.setBlockSoundType(<soundtype:wood>);
organicOverloader.register();
/*
var book_block = VanillaFactory.createBlock("book_block", <blockmaterial:wood>);
book_block.setLightValue(0);
book_block.setBlockHardness(1.0);
book_block.setBlockResistance(3.0);
book_block.setToolClass("axe");
book_block.setToolLevel(1);
book_block.setBlockSoundType(<soundtype:wood>);
book_block.setFullBlock(false);
book_block.setTranslucent(true);
book_block.setBlockLayer("CUTOUT"); CUTOUT_MIPPED
book_block.register();
*/



##########################################################################################
print("==================== end of blocks.zs ====================");