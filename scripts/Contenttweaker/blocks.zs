#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

#priority 104

print("==================== loading blocks.zs ====================");
##########################################################################################

var casingStation = VanillaFactory.createBlock("station_casing", <blockmaterial:iron>);
casingStation.setLightOpacity(3);
casingStation.setLightValue(0);
casingStation.setBlockHardness(5.0);
casingStation.setBlockResistance(5.0);
casingStation.setToolClass("pickaxe");
casingStation.setToolLevel(1);
casingStation.setBlockSoundType(<soundtype:metal>);
casingStation.register();


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