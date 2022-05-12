#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.IItemColorSupplier;
import mods.contenttweaker.IBlockColorSupplier;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Color;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.DropHandler;

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
casingStation.setToolClass("wrench");
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

/*
var crystalHatch = VanillaFactory.createBlock("crystal_grower", <blockmaterial:iron>);
crystalHatch.setBlockHardness(5.0);
crystalHatch.setBlockResistance(5.0);
crystalHatch.setToolClass("pickaxe");
crystalHatch.setToolLevel(1);
crystalHatch.setBlockSoundType(<soundtype:metal>);
crystalHatch.register();
*/

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

var glassCrystal = VanillaFactory.createBlock("crystal_green_glass", <blockmaterial:ice>);
glassCrystal.setLightValue(0.2);
glassCrystal.setBlockHardness(2.0);
glassCrystal.setBlockResistance(2.0);
glassCrystal.setToolClass("pickaxe");
glassCrystal.setToolLevel(1);
glassCrystal.setBlockSoundType(<soundtype:glass>);
//glassCrystal.setFullBlock(false);
glassCrystal.setTranslucent(true);
glassCrystal.setBlockLayer("CUTOUT_MIPPED");
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


///////////////////////////////////////////////////////////
//////////////////////    BLUE    /////////////////////////
///////////////////////////////////////////////////////////

var crystalClusterBlueColorItem = (itemColor(0x514aff));
var crystalClusterBlueColorBlock = (blockColor(0x514aff));

var crystalClusterBlue1 = VanillaFactory.createBlock("crystal_cluster_blue_1", <blockmaterial:glass>);
crystalClusterBlue1.setBlockHardness(1.0);
crystalClusterBlue1.setToolLevel(1);
crystalClusterBlue1.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue1.setFullBlock(false);
crystalClusterBlue1.setTranslucent(true);
crystalClusterBlue1.setBlockLayer("TRANSLUCENT"); //CUTOUT_MIPPED
crystalClusterBlue1.setEntitySpawnable(false);
crystalClusterBlue1.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue1.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue1.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<item:actuallyadditions:item_crystal_shard:1> % 50);
	return;
});
crystalClusterBlue1.register();

var crystalClusterBlue2 = VanillaFactory.createBlock("crystal_cluster_blue_2", <blockmaterial:glass>);
crystalClusterBlue2.setBlockHardness(1.0);
crystalClusterBlue2.setToolLevel(1);
crystalClusterBlue2.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue2.setFullBlock(false);
crystalClusterBlue2.setTranslucent(true);
crystalClusterBlue2.setBlockLayer("TRANSLUCENT");
crystalClusterBlue2.setEntitySpawnable(false);
crystalClusterBlue2.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue2.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue2.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:1>);
	return;
});
crystalClusterBlue2.register();

var crystalClusterBlue3 = VanillaFactory.createBlock("crystal_cluster_blue_3", <blockmaterial:glass>);
crystalClusterBlue3.setBlockHardness(1.0);
crystalClusterBlue3.setToolLevel(1);
crystalClusterBlue3.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue3.setFullBlock(false);
crystalClusterBlue3.setTranslucent(true);
crystalClusterBlue3.setBlockLayer("TRANSLUCENT");
crystalClusterBlue3.setEntitySpawnable(false);
crystalClusterBlue3.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue3.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue3.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:1>);
  drops.add(<item:actuallyadditions:item_crystal_shard:1> % 50);
	return;
});
crystalClusterBlue3.register();

var crystalClusterBlue4 = VanillaFactory.createBlock("crystal_cluster_blue_4", <blockmaterial:glass>);
crystalClusterBlue4.setBlockHardness(1.0);
crystalClusterBlue4.setToolLevel(1);
crystalClusterBlue4.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue4.setFullBlock(false);
crystalClusterBlue4.setTranslucent(true);
crystalClusterBlue4.setBlockLayer("TRANSLUCENT");
crystalClusterBlue4.setEntitySpawnable(false);
crystalClusterBlue4.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue4.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue4.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:1>*2);
	return;
});
crystalClusterBlue4.register();

var crystalClusterBlue5 = VanillaFactory.createBlock("crystal_cluster_blue_5", <blockmaterial:glass>);
crystalClusterBlue5.setBlockHardness(1.0);
crystalClusterBlue5.setToolLevel(1);
crystalClusterBlue5.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue5.setFullBlock(false);
crystalClusterBlue5.setTranslucent(true);
crystalClusterBlue5.setBlockLayer("TRANSLUCENT");
crystalClusterBlue5.setEntitySpawnable(false);
crystalClusterBlue5.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue5.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue5.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:1>*2);
  drops.add(<item:actuallyadditions:item_crystal_shard:1> % 50);
	return;
});
crystalClusterBlue5.register();

var crystalClusterBlue6 = VanillaFactory.createBlock("crystal_cluster_blue_6", <blockmaterial:glass>);
crystalClusterBlue6.setBlockHardness(1.0);
crystalClusterBlue6.setToolLevel(1);
crystalClusterBlue6.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue6.setFullBlock(false);
crystalClusterBlue6.setTranslucent(true);
crystalClusterBlue6.setBlockLayer("TRANSLUCENT");
crystalClusterBlue6.setEntitySpawnable(false);
crystalClusterBlue6.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue6.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue6.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:1>*3);
	return;
});
crystalClusterBlue6.register();

var crystalClusterBlue7 = VanillaFactory.createBlock("crystal_cluster_blue_7", <blockmaterial:glass>);
crystalClusterBlue7.setBlockHardness(1.0);
crystalClusterBlue7.setToolLevel(1);
crystalClusterBlue7.setBlockSoundType(<soundtype:glass>);
crystalClusterBlue7.setFullBlock(false);
crystalClusterBlue7.setTranslucent(true);
crystalClusterBlue7.setBlockLayer("TRANSLUCENT");
crystalClusterBlue7.setEntitySpawnable(false);
crystalClusterBlue7.blockColorSupplier = crystalClusterBlueColorBlock;
crystalClusterBlue7.itemColorSupplier = crystalClusterBlueColorItem;
crystalClusterBlue7.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:1>*3);
  drops.add(<item:actuallyadditions:item_crystal_shard:1> % 50);
	return;
});
crystalClusterBlue7.register();

///////////////////////////////////////////////////////////
/////////////////////    GREEN    /////////////////////////
///////////////////////////////////////////////////////////

var crystalClusterGreenColorItem = (itemColor(0x38ff3f));
var crystalClusterGreenColorBlock = (blockColor(0x38ff3f));

var crystalClusterGreen1 = VanillaFactory.createBlock("crystal_cluster_green_1", <blockmaterial:glass>);
crystalClusterGreen1.setBlockHardness(1.0);
crystalClusterGreen1.setToolLevel(1);
crystalClusterGreen1.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen1.setFullBlock(false);
crystalClusterGreen1.setTranslucent(true);
crystalClusterGreen1.setBlockLayer("TRANSLUCENT"); //CUTOUT_MIPPED
crystalClusterGreen1.setEntitySpawnable(false);
crystalClusterGreen1.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen1.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen1.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<item:actuallyadditions:item_crystal_shard:4> % 50);
	return;
});
crystalClusterGreen1.register();

var crystalClusterGreen2 = VanillaFactory.createBlock("crystal_cluster_green_2", <blockmaterial:glass>);
crystalClusterGreen2.setBlockHardness(1.0);
crystalClusterGreen2.setToolLevel(1);
crystalClusterGreen2.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen2.setFullBlock(false);
crystalClusterGreen2.setTranslucent(true);
crystalClusterGreen2.setBlockLayer("TRANSLUCENT");
crystalClusterGreen2.setEntitySpawnable(false);
crystalClusterGreen2.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen2.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen2.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:4>);
	return;
});
crystalClusterGreen2.register();

var crystalClusterGreen3 = VanillaFactory.createBlock("crystal_cluster_green_3", <blockmaterial:glass>);
crystalClusterGreen3.setBlockHardness(1.0);
crystalClusterGreen3.setToolLevel(1);
crystalClusterGreen3.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen3.setFullBlock(false);
crystalClusterGreen3.setTranslucent(true);
crystalClusterGreen3.setBlockLayer("TRANSLUCENT");
crystalClusterGreen3.setEntitySpawnable(false);
crystalClusterGreen3.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen3.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen3.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:4>);
  drops.add(<item:actuallyadditions:item_crystal_shard:4> % 50);
	return;
});
crystalClusterGreen3.register();

var crystalClusterGreen4 = VanillaFactory.createBlock("crystal_cluster_green_4", <blockmaterial:glass>);
crystalClusterGreen4.setBlockHardness(1.0);
crystalClusterGreen4.setToolLevel(1);
crystalClusterGreen4.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen4.setFullBlock(false);
crystalClusterGreen4.setTranslucent(true);
crystalClusterGreen4.setBlockLayer("TRANSLUCENT");
crystalClusterGreen4.setEntitySpawnable(false);
crystalClusterGreen4.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen4.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen4.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:4>*2);
	return;
});
crystalClusterGreen4.register();

var crystalClusterGreen5 = VanillaFactory.createBlock("crystal_cluster_green_5", <blockmaterial:glass>);
crystalClusterGreen5.setBlockHardness(1.0);
crystalClusterGreen5.setToolLevel(1);
crystalClusterGreen5.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen5.setFullBlock(false);
crystalClusterGreen5.setTranslucent(true);
crystalClusterGreen5.setBlockLayer("TRANSLUCENT");
crystalClusterGreen5.setEntitySpawnable(false);
crystalClusterGreen5.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen5.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen5.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:4>*2);
  drops.add(<item:actuallyadditions:item_crystal_shard:4> % 50);
	return;
});
crystalClusterGreen5.register();

var crystalClusterGreen6 = VanillaFactory.createBlock("crystal_cluster_green_6", <blockmaterial:glass>);
crystalClusterGreen6.setBlockHardness(1.0);
crystalClusterGreen6.setToolLevel(1);
crystalClusterGreen6.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen6.setFullBlock(false);
crystalClusterGreen6.setTranslucent(true);
crystalClusterGreen6.setBlockLayer("TRANSLUCENT");
crystalClusterGreen6.setEntitySpawnable(false);
crystalClusterGreen6.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen6.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen6.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:4>*3);
	return;
});
crystalClusterGreen6.register();

var crystalClusterGreen7 = VanillaFactory.createBlock("crystal_cluster_green_7", <blockmaterial:glass>);
crystalClusterGreen7.setBlockHardness(1.0);
crystalClusterGreen7.setToolLevel(1);
crystalClusterGreen7.setBlockSoundType(<soundtype:glass>);
crystalClusterGreen7.setFullBlock(false);
crystalClusterGreen7.setTranslucent(true);
crystalClusterGreen7.setBlockLayer("TRANSLUCENT");
crystalClusterGreen7.setEntitySpawnable(false);
crystalClusterGreen7.blockColorSupplier = crystalClusterGreenColorBlock;
crystalClusterGreen7.itemColorSupplier = crystalClusterGreenColorItem;
crystalClusterGreen7.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard:4>*3);
  drops.add(<item:actuallyadditions:item_crystal_shard:4> % 50);
	return;
});
crystalClusterGreen7.register();


///////////////////////////////////////////////////////////
//////////////////////    RED    //////////////////////////
///////////////////////////////////////////////////////////

var crystalClusterRedColorItem = (itemColor(0xff1f1f));
var crystalClusterRedColorBlock = (blockColor(0xff1f1f));

var crystalClusterRed1 = VanillaFactory.createBlock("crystal_cluster_red_1", <blockmaterial:glass>);
crystalClusterRed1.setBlockHardness(1.0);
crystalClusterRed1.setToolLevel(1);
crystalClusterRed1.setBlockSoundType(<soundtype:glass>);
crystalClusterRed1.setFullBlock(false);
crystalClusterRed1.setTranslucent(true);
crystalClusterRed1.setBlockLayer("TRANSLUCENT"); //CUTOUT_MIPPED
crystalClusterRed1.setEntitySpawnable(false);
crystalClusterRed1.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed1.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed1.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<item:actuallyadditions:item_crystal_shard> % 50);
	return;
});
crystalClusterRed1.register();

var crystalClusterRed2 = VanillaFactory.createBlock("crystal_cluster_red_2", <blockmaterial:glass>);
crystalClusterRed2.setBlockHardness(1.0);
crystalClusterRed2.setToolLevel(1);
crystalClusterRed2.setBlockSoundType(<soundtype:glass>);
crystalClusterRed2.setFullBlock(false);
crystalClusterRed2.setTranslucent(true);
crystalClusterRed2.setBlockLayer("TRANSLUCENT");
crystalClusterRed2.setEntitySpawnable(false);
crystalClusterRed2.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed2.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed2.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard>);
	return;
});
crystalClusterRed2.register();

var crystalClusterRed3 = VanillaFactory.createBlock("crystal_cluster_red_3", <blockmaterial:glass>);
crystalClusterRed3.setBlockHardness(1.0);
crystalClusterRed3.setToolLevel(1);
crystalClusterRed3.setBlockSoundType(<soundtype:glass>);
crystalClusterRed3.setFullBlock(false);
crystalClusterRed3.setTranslucent(true);
crystalClusterRed3.setBlockLayer("TRANSLUCENT");
crystalClusterRed3.setEntitySpawnable(false);
crystalClusterRed3.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed3.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed3.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard>);
  drops.add(<item:actuallyadditions:item_crystal_shard> % 50);
	return;
});
crystalClusterRed3.register();

var crystalClusterRed4 = VanillaFactory.createBlock("crystal_cluster_red_4", <blockmaterial:glass>);
crystalClusterRed4.setBlockHardness(1.0);
crystalClusterRed4.setToolLevel(1);
crystalClusterRed4.setBlockSoundType(<soundtype:glass>);
crystalClusterRed4.setFullBlock(false);
crystalClusterRed4.setTranslucent(true);
crystalClusterRed4.setBlockLayer("TRANSLUCENT");
crystalClusterRed4.setEntitySpawnable(false);
crystalClusterRed4.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed4.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed4.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard>*2);
	return;
});
crystalClusterRed4.register();

var crystalClusterRed5 = VanillaFactory.createBlock("crystal_cluster_red_5", <blockmaterial:glass>);
crystalClusterRed5.setBlockHardness(1.0);
crystalClusterRed5.setToolLevel(1);
crystalClusterRed5.setBlockSoundType(<soundtype:glass>);
crystalClusterRed5.setFullBlock(false);
crystalClusterRed5.setTranslucent(true);
crystalClusterRed5.setBlockLayer("TRANSLUCENT");
crystalClusterRed5.setEntitySpawnable(false);
crystalClusterRed5.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed5.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed5.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard>*2);
  drops.add(<item:actuallyadditions:item_crystal_shard> % 50);
	return;
});
crystalClusterRed5.register();

var crystalClusterRed6 = VanillaFactory.createBlock("crystal_cluster_red_6", <blockmaterial:glass>);
crystalClusterRed6.setBlockHardness(1.0);
crystalClusterRed6.setToolLevel(1);
crystalClusterRed6.setBlockSoundType(<soundtype:glass>);
crystalClusterRed6.setFullBlock(false);
crystalClusterRed6.setTranslucent(true);
crystalClusterRed6.setBlockLayer("TRANSLUCENT");
crystalClusterRed6.setEntitySpawnable(false);
crystalClusterRed6.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed6.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed6.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard>*3);
	return;
});
crystalClusterRed6.register();

var crystalClusterRed7 = VanillaFactory.createBlock("crystal_cluster_red_7", <blockmaterial:glass>);
crystalClusterRed7.setBlockHardness(1.0);
crystalClusterRed7.setToolLevel(1);
crystalClusterRed7.setBlockSoundType(<soundtype:glass>);
crystalClusterRed7.setFullBlock(false);
crystalClusterRed7.setTranslucent(true);
crystalClusterRed7.setBlockLayer("TRANSLUCENT");
crystalClusterRed7.setEntitySpawnable(false);
crystalClusterRed7.blockColorSupplier = crystalClusterRedColorBlock;
crystalClusterRed7.itemColorSupplier = crystalClusterRedColorItem;
crystalClusterRed7.setDropHandler(function(drops, world, position, state, fortune) {
  drops.clear();
	drops.add(<item:actuallyadditions:item_crystal_shard>*3);
  drops.add(<item:actuallyadditions:item_crystal_shard> % 50);
	return;
});
crystalClusterRed7.register();
##########################################################################################
print("==================== end of blocks.zs ====================");