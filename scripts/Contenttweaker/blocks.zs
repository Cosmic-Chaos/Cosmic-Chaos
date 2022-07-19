#debug
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
import mods.contenttweaker.ItemList;

import crafttweaker.world.IBlockAccess;
import crafttweaker.world.IBlockPos;

#priority 90

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

val stationBackbone = VanillaFactory.createBlock("station_backbone", <blockmaterial:iron>);
stationBackbone.setLightValue(4);
stationBackbone.blockHardness = -1;
stationBackbone.blockResistance = 18000000;
stationBackbone.witherProof = true;
stationBackbone.register();

val crystalCore = VanillaFactory.createBlock("crystal_core", <blockmaterial:iron>);
crystalCore.setBlockHardness(5.0);
crystalCore.setBlockResistance(5.0);
crystalCore.setToolClass("pickaxe");
crystalCore.setToolLevel(1);
crystalCore.setBlockSoundType(<soundtype:metal>);
crystalCore.register();

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

val stationGlass = VanillaFactory.createBlock("station_glass", <blockmaterial:glass>);
stationGlass.blockHardness = 5.0;
stationGlass.setToolLevel(1);
stationGlass.setFullBlock(false);
stationGlass.setTranslucent(true);
stationGlass.setBlockLayer("TRANSLUCENT");
stationGlass.setLightOpacity(0);
stationGlass.register();

var organicOverloader = VanillaFactory.createBlock("organic_overloader", <blockmaterial:iron>);
organicOverloader.setLightValue(1);
organicOverloader.setBlockHardness(3.0);
organicOverloader.setBlockResistance(3.0);
organicOverloader.setToolClass("axe");
organicOverloader.setToolLevel(1);
organicOverloader.setBlockSoundType(<soundtype:wood>);
organicOverloader.register();

var reactionChamber = VanillaFactory.createBlock("reaction_chamber", <blockmaterial:iron>);
reactionChamber.setBlockHardness(3.0);
reactionChamber.setBlockResistance(3.0);
reactionChamber.setToolClass("wrench");
reactionChamber.setToolLevel(1);
reactionChamber.setBlockSoundType(<soundtype:metal>);
reactionChamber.register();

var perfect_sample_ruby_itemColor = (itemColor(0xdb001d));
var perfect_sample_ruby_blockColor = (blockColor(0xdb001d));

var perfect_sample_ruby = VanillaFactory.createBlock("perfect_sample_ruby", <blockmaterial:glass>);
perfect_sample_ruby.setLightValue(0);
perfect_sample_ruby.setBlockHardness(1.0);
perfect_sample_ruby.setBlockResistance(1.0);
perfect_sample_ruby.setToolClass("pickaxe");
perfect_sample_ruby.setToolLevel(1);
perfect_sample_ruby.setBlockSoundType(<soundtype:glass>);
perfect_sample_ruby.setFullBlock(false);
perfect_sample_ruby.setTranslucent(true);
perfect_sample_ruby.setBlockLayer("TRANSLUCENT");
perfect_sample_ruby.setLightOpacity(0);
perfect_sample_ruby.blockColorSupplier = perfect_sample_ruby_blockColor;
perfect_sample_ruby.itemColorSupplier = perfect_sample_ruby_itemColor;
perfect_sample_ruby.register();
/*
var caveRoots = VanillaFactory.createBlock("roots", <blockmaterial:vine>);
caveRoots.passable = true;
caveRoots.replaceable = true;
caveRoots.toolClass = "shears";
caveRoots.fullBlock = false;
caveRoots.setDropHandler(function(drops, world, position, state, fortune) {
	drops.clear();
	drops.add(<item:quark:root:1>);
});
caveRoots.blockSoundType = <soundtype:plant>;
caveRoots.blockLayer = "CUTOUT_MIPPED";
caveRoots.register();
*/

var sulfurClusterColorItem = (itemColor(0xfcdb03));
var sulfurClusterColorBlock = (blockColor(0xfcdb03));

var ventClean = VanillaFactory.createBlock("vent_clean", <blockmaterial:iron>);
ventClean.setBlockHardness(2.0);
ventClean.setBlockResistance(2.0);
ventClean.setToolClass("wrench");
ventClean.setToolLevel(1);
ventClean.setBlockSoundType(<soundtype:metal>);
ventClean.setFullBlock(false);
ventClean.setBlockLayer("CUTOUT");
ventClean.register();

var ventClean2 = VanillaFactory.createBlock("vent_very_clean", <blockmaterial:iron>);
ventClean2.setBlockHardness(2.0);
ventClean2.setBlockResistance(2.0);
ventClean2.setToolClass("wrench");
ventClean2.setToolLevel(1);
ventClean2.setBlockSoundType(<soundtype:metal>);
ventClean2.setFullBlock(false);
ventClean2.setBlockLayer("CUTOUT");
ventClean2.register();

var ventDirtySulfur = VanillaFactory.createBlock("vent_dirty_1", <blockmaterial:iron>);
ventDirtySulfur.setBlockHardness(2.0);
ventDirtySulfur.setBlockResistance(2.0);
ventDirtySulfur.setToolClass("wrench");
ventDirtySulfur.setToolLevel(1);
ventDirtySulfur.setBlockSoundType(<soundtype:metal>);
ventDirtySulfur.setFullBlock(false);
ventDirtySulfur.setBlockLayer("CUTOUT");
ventDirtySulfur.blockColorSupplier = sulfurClusterColorBlock;
ventDirtySulfur.itemColorSupplier = sulfurClusterColorItem;
ventDirtySulfur.register();

var ventDirtySulfur2 = VanillaFactory.createBlock("vent_dirty_2", <blockmaterial:iron>);
ventDirtySulfur2.setBlockHardness(2.0);
ventDirtySulfur2.setBlockResistance(2.0);
ventDirtySulfur2.setToolClass("wrench");
ventDirtySulfur2.setToolLevel(1);
ventDirtySulfur2.setBlockSoundType(<soundtype:metal>);
ventDirtySulfur2.setFullBlock(false);
ventDirtySulfur2.setBlockLayer("CUTOUT");
ventDirtySulfur2.blockColorSupplier = sulfurClusterColorBlock;
ventDirtySulfur2.itemColorSupplier = sulfurClusterColorItem;
ventDirtySulfur2.register();

var ventDirtySulfur3 = VanillaFactory.createBlock("vent_dirty_3", <blockmaterial:iron>);
ventDirtySulfur3.setBlockHardness(2.0);
ventDirtySulfur3.setBlockResistance(2.0);
ventDirtySulfur3.setToolClass("wrench");
ventDirtySulfur3.setToolLevel(1);
ventDirtySulfur3.setBlockSoundType(<soundtype:metal>);
ventDirtySulfur3.setFullBlock(false);
ventDirtySulfur3.setBlockLayer("CUTOUT");
ventDirtySulfur3.blockColorSupplier = sulfurClusterColorBlock;
ventDirtySulfur3.itemColorSupplier = sulfurClusterColorItem;
ventDirtySulfur3.register();



var carbonClusterColorItem = (itemColor(0x1f1f1f));
var carbonClusterColorBlock = (blockColor(0x1f1f1f));

var ventDirtyCarbon = VanillaFactory.createBlock("vent_dirty_carbon_1", <blockmaterial:iron>);
ventDirtyCarbon.setBlockHardness(2.0);
ventDirtyCarbon.setBlockResistance(2.0);
ventDirtyCarbon.setToolClass("wrench");
ventDirtyCarbon.setToolLevel(1);
ventDirtyCarbon.setBlockSoundType(<soundtype:metal>);
ventDirtyCarbon.setFullBlock(false);
ventDirtyCarbon.setBlockLayer("CUTOUT");
ventDirtyCarbon.blockColorSupplier = carbonClusterColorBlock;
ventDirtyCarbon.itemColorSupplier = carbonClusterColorItem;
ventDirtyCarbon.register();

var ventDirtyCarbon2 = VanillaFactory.createBlock("vent_dirty_carbon_2", <blockmaterial:iron>);
ventDirtyCarbon2.setBlockHardness(2.0);
ventDirtyCarbon2.setBlockResistance(2.0);
ventDirtyCarbon2.setToolClass("wrench");
ventDirtyCarbon2.setToolLevel(1);
ventDirtyCarbon2.setBlockSoundType(<soundtype:metal>);
ventDirtyCarbon2.setFullBlock(false);
ventDirtyCarbon2.setBlockLayer("CUTOUT");
ventDirtyCarbon2.blockColorSupplier = carbonClusterColorBlock;
ventDirtyCarbon2.itemColorSupplier = carbonClusterColorItem;
ventDirtyCarbon2.register();

var ventDirtyCarbon3 = VanillaFactory.createBlock("vent_dirty_carbon_3", <blockmaterial:iron>);
ventDirtyCarbon3.setBlockHardness(2.0);
ventDirtyCarbon3.setBlockResistance(2.0);
ventDirtyCarbon3.setToolClass("wrench");
ventDirtyCarbon3.setToolLevel(1);
ventDirtyCarbon3.setBlockSoundType(<soundtype:metal>);
ventDirtyCarbon3.setFullBlock(false);
ventDirtyCarbon3.setBlockLayer("CUTOUT");
ventDirtyCarbon3.blockColorSupplier = carbonClusterColorBlock;
ventDirtyCarbon3.itemColorSupplier = carbonClusterColorItem;
ventDirtyCarbon3.register();





var glod_crystal_block = VanillaFactory.createBlock("glod_crystal_block", <blockmaterial:iron>);
glod_crystal_block.setBlockHardness(3);
glod_crystal_block.setBlockResistance(6);
glod_crystal_block.setToolClass("pickaxe");
glod_crystal_block.setToolLevel(2);
glod_crystal_block.setBlockSoundType(<soundtype:metal>);
glod_crystal_block.register();

var empowered_glod_crystal_block = VanillaFactory.createBlock("empowered_glod_crystal_block", <blockmaterial:iron>);
empowered_glod_crystal_block.setBlockHardness(3);
empowered_glod_crystal_block.setBlockResistance(6);
empowered_glod_crystal_block.setToolClass("pickaxe");
empowered_glod_crystal_block.setToolLevel(2);
empowered_glod_crystal_block.setBlockSoundType(<soundtype:metal>);
empowered_glod_crystal_block.register();

var quinturple_crystal_block = VanillaFactory.createBlock("quinturple_crystal_block", <blockmaterial:iron>);
quinturple_crystal_block.setBlockHardness(3);
quinturple_crystal_block.setBlockResistance(6);
quinturple_crystal_block.setToolClass("pickaxe");
quinturple_crystal_block.setToolLevel(2);
quinturple_crystal_block.setBlockSoundType(<soundtype:metal>);
quinturple_crystal_block.register();

var empowered_quinturple_crystal_block = VanillaFactory.createBlock("empowered_quinturple_crystal_block", <blockmaterial:iron>);
empowered_quinturple_crystal_block.setBlockHardness(3);
empowered_quinturple_crystal_block.setBlockResistance(6);
empowered_quinturple_crystal_block.setToolClass("pickaxe");
empowered_quinturple_crystal_block.setToolLevel(2);
empowered_quinturple_crystal_block.setBlockSoundType(<soundtype:metal>);
empowered_quinturple_crystal_block.register();


var space_crate = VanillaFactory.createBlock("space_crate", <blockmaterial:iron>);
space_crate.setBlockHardness(1);
space_crate.setBlockResistance(2);
space_crate.setToolClass("pickaxe");
space_crate.setToolLevel(1);
space_crate.setBlockSoundType(<soundtype:metal>);
space_crate.register();
///////////////////////////////////////////////////////////
//////////////////////    Crystals    /////////////////////
///////////////////////////////////////////////////////////

//atnegam
//der
//etihw
//eulb
//nayc
//neerg
//wolley

static crystalColorMap as int[string] = {
	"blue": 0x514aff,
	"green": 0x38ff3f,
	"red": 0xff1f1f,
	"cyan": 0x45ffff,
	"magenta": 0xff35ff,
	"yellow": 0xffff2f,
	"white": 0xffffff,
} as int[string];

val crystalClusterDropHandler as DropHandler = function(drops as ItemList, world as IBlockAccess, pos as IBlockPos, state as BlockState, fortune as int) {
	val block_id as string = state.block.definition.id;
	var drop as IItemStack;
	val len as int = block_id.length;
	val lastColorChar as int = block_id.codePointAt(len - 3);
	if (lastColorChar <= 101) { //101 == 'e'
		if (lastColorChar <= 100) { //100 == 'd'
			if (lastColorChar == 97) { //97 == 'a'
				drop = <item:contenttweaker:crystal_shard_magenta>; //magenta
			} else {
				drop = <item:actuallyadditions:item_crystal_shard:0>; //red
			}
		} else if (block_id.codePointAt(len - 4) == 116) { //116 == 't'
			drop = <item:actuallyadditions:item_crystal_shard:5>; //white
		} else {
			drop = <item:actuallyadditions:item_crystal_shard:1>; //blue
		}
	} else if (lastColorChar == 110) { //110 == 'n'
		if (block_id.codePointAt(len - 4) == 97) { //97 == 'a'
			drop = <item:actuallyadditions:item_crystal_shard:2>; //cyan
		} else {
			drop = <item:actuallyadditions:item_crystal_shard:4>; //green
		}
	} else {
		drop = <item:contenttweaker:crystal_shard_yellow>; //yellow
	}
	val level as int = block_id.codePointAt(len - 1) - 48; //48 == '0'
	val guaranteed as int = (level/2) as int;
	drops.clear();
	if (guaranteed != 0) {
		drops.add(drop*guaranteed);
	}
	if (guaranteed*2 != level) {
		drops.add(drop % 50);
	}
} as DropHandler;

for colorName in crystalColorMap {
	val colorHex as int = crystalColorMap[colorName] as int;
	val crystalClusterColorItem = itemColor(colorHex);
	val crystalClusterColorBlock = blockColor(colorHex);
	for i in 1 .. 8 {
		val crystalCluster = VanillaFactory.createBlock("crystal_cluster_"~colorName~"_"~i, <blockmaterial:glass>);
		crystalCluster.setBlockHardness(1.0);
		crystalCluster.setToolLevel(1);
		crystalCluster.setBlockSoundType(<soundtype:glass>);
		crystalCluster.setFullBlock(false);
		crystalCluster.setTranslucent(true);
		crystalCluster.setBlockLayer("TRANSLUCENT");
		crystalCluster.setEntitySpawnable(false);
		crystalCluster.blockColorSupplier = crystalClusterColorBlock;
		crystalCluster.itemColorSupplier = crystalClusterColorItem;
		crystalCluster.setDropHandler(crystalClusterDropHandler);
		crystalCluster.register();
	}
}

for colorName in (["magenta", "yellow"] as string[]) {
	val colorHex as int = crystalColorMap[colorName] as int;
	val crystalCluster = VanillaFactory.createBlock("crystal_cluster_"~colorName~"_8", <blockmaterial:glass>);
	crystalCluster.setBlockHardness(1.0);
	crystalCluster.setToolLevel(1);
	crystalCluster.setBlockSoundType(<soundtype:glass>);
	crystalCluster.setFullBlock(false);
	crystalCluster.setTranslucent(true);
	crystalCluster.setBlockLayer("TRANSLUCENT");
	crystalCluster.setEntitySpawnable(false);
	crystalCluster.blockColorSupplier = blockColor(colorHex);
	crystalCluster.itemColorSupplier = itemColor(colorHex);
	crystalCluster.setDropHandler(crystalClusterDropHandler);
	crystalCluster.register();
}
/*
var coilOctineColorItem = (itemColor(0xff8c19));
var coilOctineColorBlock = (blockColor(0xff8c19));
*/
var coilOctine = VanillaFactory.createBlock("machine_coil_octine", <blockmaterial:iron>);
coilOctine.setLightOpacity(3);
coilOctine.setLightValue(0);
coilOctine.setBlockHardness(5.0);
coilOctine.setBlockResistance(5.0);
coilOctine.setToolClass("wrench");
coilOctine.setToolLevel(2);
coilOctine.setBlockSoundType(<soundtype:metal>);/*
coilOctine.blockColorSupplier = coilOctineColorBlock;
coilOctine.itemColorSupplier = coilOctineColorItem;*/
coilOctine.register();

val dustAsteroid = VanillaFactory.createBlock("block_dust_asteroid", <blockmaterial:iron>);
dustAsteroid.setBlockHardness(1.0);
dustAsteroid.setBlockResistance(1.0);
dustAsteroid.setToolClass("shovel");
dustAsteroid.setToolLevel(0);
dustAsteroid.setBlockSoundType(<soundtype:sand>);
dustAsteroid.setDropHandler(function(drops, world, position, state, fortune) {
	drops.clear();
	drops.add(<item:gregtech:meta_dust:32160>);
	drops.add(<item:gregtech:meta_dust:32160> % 50);
	drops.add(<item:gregtech:meta_dust:32160> % 50);
	drops.add(<item:gregtech:meta_dust:32160> % 50);
});
dustAsteroid.register();

val rockAsteroid = VanillaFactory.createBlock("block_rock_asteroid", <blockmaterial:iron>);
rockAsteroid.setBlockHardness(2.0);
rockAsteroid.setBlockResistance(2.0);
rockAsteroid.setToolClass("pickaxe");
rockAsteroid.setToolLevel(0);
rockAsteroid.setBlockSoundType(<soundtype:stone>);
rockAsteroid.register();

val oreAsteroid = VanillaFactory.createBlock("block_ore_asteroid", <blockmaterial:iron>);
oreAsteroid.setBlockHardness(2.0);
oreAsteroid.setBlockResistance(2.0);
oreAsteroid.setToolClass("pickaxe");
oreAsteroid.setToolLevel(0);
oreAsteroid.setBlockSoundType(<soundtype:stone>);
oreAsteroid.register();
##########################################################################################
print("==================== end of blocks.zs ====================");