#loader gregtech
#priority 1001
import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.gtadditions.recipe.Utils;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDictEntry;
print("==================== loading new_materials.zs ====================");
##########################################################################################

###################################################
################## NEW MATS #######################
###################################################

/*
MaterialRegistry.createFluidMaterial(int metaItemSubId, String name, int color, String iconSet, @Optional MaterialStack[] materialComponents);

MaterialRegistry.createDustMaterial(int metaItemSubId, String name, int color, String iconSet, int harvestLevel, @Optional MaterialStack[] materialComponents);

MaterialRegistry.createGemMaterial(int metaItemSubId, String name, int color, String iconSet, int harvestLevel, @Optional MaterialStack[] materialComponents, @Optional float toolSpeed, @Optional int toolDurability);

MaterialRegistry.createIngotMaterial(int metaItemSubId, String name, int color, String iconSet, int harvestLevel, @Optional MaterialStack[] materialComponents, @Optional float toolSpeed, @Optional int toolDurability, @Optional int blastFurnaceTemperature);

setCableProperties(long voltage, int baseAmperage, int lossPerBlock)

setFluidPipeProperties(int throughput, int maxTemperature, boolean gasProof)

Utils.registerItem("skystone", 1000, 0x414647, "GEM_HORIZONTAL", "lens");
Utils.registerItem("fluix", 1001, 0x6a4887, "SHINY", "plate");
Utils.registerItem("resonating_crystal", 1002, 0x6146c2, "GEM_VERTICAL", "dust");
Utils.registerItem("end_steel", 1005, 0xece7b6, "METALLIC", "stick");
Utils.registerItem("end_steel", 1006, 0xece7b6, "METALLIC", "plate");
Utils.registerItem("end_steel", 1007, 0xece7b6, "METALLIC", "bolt");
Utils.registerItem("end_steel", 1008, 0xece7b6, "METALLIC", "screw");
Utils.registerItem("stellar_alloy", 1014, 0xc4ccbf, "SHINY", "plate");
Utils.registerItem("charged_certus", 1017, 0xD2D2E6, "QUARTZ", "dust");
Utils.registerItem("ferroboron", 1019, 0x646464, "DULL", "ingotHot");

<material:copper>.addFlags(["GENERATE_SPRING_SMALL"]);
<material:vanadium>.addFlags(["GENERATE_LONG_ROD", "GENERATE_SPRING", "GENERATE_DENSE"]);
<material:iron>.addFlags(["GENERATE_SMALL_GEAR"]);
<material:magnesium>.addFlags(["GENERATE_FINE_WIRE"]);
<material:gold>.addFlags(["GENERATE_RING"]);
    NONE
    METALLIC
    DULL
    MAGNETIC
    QUARTZ
    DIAMOND
    EMERALD
    SHINY
    SHARDS
    ROUGH
    FINE
    SAND
    FLINT
    RUBY
    LAPIS
    POWDER
    FLUID
    GAS
    LIGNITE
    OPAL
    GLASS
    WOOD
    LEAF
    GEM_HORIZONTAL
    GEM_VERTICAL
    PAPER
    NETHERSTAR

    // Set toolDurability to 0 if ingot cannot be used as tool
// Note that an @Optional parameter can be left out, and it's replaced by default 0.
// Means Gem and Ingot material cannot be used as tool by default.
MaterialRegistry.createFluidMaterial(int metaItemSubId, String name, int color, String iconSet, @Optional MaterialStack[] materialComponents);

MaterialRegistry.createDustMaterial(int metaItemSubId, String name, int color, String iconSet, int harvestLevel, @Optional MaterialStack[] materialComponents);

MaterialRegistry.createGemMaterial(int metaItemSubId, String name, int color, String iconSet, int harvestLevel, @Optional MaterialStack[] materialComponents, @Optional float toolSpeed, @Optional int toolDamage);

MaterialRegistry.createIngotMaterial(int metaItemSubId, String name, int color, String iconSet, int toolLevel, @Optional MaterialStack[] materialComponents, @Optional float toolSpeed, @Optional int toolDamage, @Optional int Durability);


*/

## Crude Steel ##
/*
Utils.registerItem("crude_steel", 1001, 0x52bfa8, "DULL", "stick");
Utils.registerItem("crude_steel", 1002, 0x52bfa8, "DULL", "plate");
Utils.registerItem("crude_steel", 1003, 0x52bfa8, "DULL", "gear");
*/

/*
val crystalized = MaterialRegistry.createIngotMaterial(600, "crystalized", 0x52bfa8, "shiny", 1);
crystalized.setCableProperties(128, 2, 0);
crystalized.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);
*/

//Ender IO
val crudeSteel = MaterialRegistry.createIngotMaterial(601, "crude_steel", 0x9e9e9e, "metallic", 1);
crudeSteel.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR", "GENERATE_SMALL_GEAR"]);
crudeSteel.setCableProperties(8, 1, 1);

val end_steel = MaterialRegistry.createIngotMaterial(602, "end_steel", 0xdbd986, "metallic", 1);
//end_steel.addFlags(["GENERATE_ROD","GENERATE_PLATE","GENERATE_GEAR",]);

val electrical_steel = MaterialRegistry.createIngotMaterial(603, "electrical_steel", 0xa7b5b4, "shiny", 1);
electrical_steel.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);


val dark_steel = MaterialRegistry.createIngotMaterial(604, "dark_steel", 0x363636, "metallic", 2, [], 3.5, 4, 1000);
//val dark_steel = MaterialRegistry.createIngotMaterial(604, "dark_steel", 0x363636, "metallic", 1);
//dark_steel.addFlags(["GENERATE_ROD", "GENERATE_PLATE"]);


val pulsating_iron = MaterialRegistry.createIngotMaterial(605, "pulsating_iron", 0x96d996, "metallic", 1);
//pulsating_iron.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val conductive_iron = MaterialRegistry.createIngotMaterial(606, "conductive_iron", 0xe3b1b8	, "metallic", 1);
conductive_iron.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val redstone_alloy = MaterialRegistry.createIngotMaterial(607, "redstone_alloy", 0xa31d1d, "metallic", 1);
//redstone_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val vibrant_alloy = MaterialRegistry.createIngotMaterial(608, "vibrant_alloy", 0xaade52, "shiny", 1);
//vibrant_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE"]);

val energetic_alloy = MaterialRegistry.createIngotMaterial(609, "energetic_alloy", 0xe3914d, "shiny", 1);
//energetic_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE"]);
energetic_alloy.setCableProperties(32, 1, 0);

val soularium = MaterialRegistry.createIngotMaterial(610, "soularium", 0x6e4d2d, "metallic", 1);
//soularium.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val crystalline_alloy = MaterialRegistry.createIngotMaterial(611, "crystalline_alloy", 0xadd7db, "metallic", 1);
//crystalline_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val melodic_alloy = MaterialRegistry.createIngotMaterial(612, "melodic_alloy", 0xc796d4, "metallic", 1);
//melodic_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val stellar_alloy = MaterialRegistry.createIngotMaterial(613, "stellar_alloy", 0xfffcd1, "metallic", 1);
//stellar_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val crystalline_pink_slime = MaterialRegistry.createIngotMaterial(614, "crystalline_pink_slime", 0xdf8be0, "metallic", 1);
//crystalline_pink_slime.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val energetic_silver = MaterialRegistry.createIngotMaterial(615, "energetic_silver", 0x73afc7, "metallic", 1);
//energetic_silver.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);

val vivid_alloy = MaterialRegistry.createIngotMaterial(616, "vivid_alloy", 0x72caed, "metallic", 1);
//vivid_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);


//Lucraft
val dwarf_star_alloy = MaterialRegistry.createIngotMaterial(617, "dwarf_star_alloy", 0x445956, "shiny", 1);
dwarf_star_alloy.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);



/*
val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/
##########################################################################################
print("==================== end of new_materials.zs ====================");
