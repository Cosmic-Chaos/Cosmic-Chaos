#loader gregtech
#priority 1001
import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;
print("==================== loading new_materials.zs ====================");
##########################################################################################


val ingotPrefix = OrePrefix.getPrefix("ingot");
val gemPrefix = OrePrefix.getPrefix("gem");
val platePrefix = OrePrefix.getPrefix("plate");
val gearPrefix = OrePrefix.getPrefix("gear");
val blockPrefix = OrePrefix.getPrefix("block");
val dustPrefix = OrePrefix.getPrefix("dust");
val nuggetPrefix = OrePrefix.getPrefix("nugget");

//Unification stuff
<material:gold>.addFlags("generate_gear");
<material:tin>.addFlags("generate_gear");
<material:copper>.addFlags("generate_gear");
<material:iron>.addFlags("generate_frame");
<material:wrought_iron>.addFlags("generate_frame");

###################################################
################## NEW MATS #######################
###################################################

/*

  "≡": <theaurorian:aurorianiteingot>, # Aurorianite Ingot
  "≡": <theaurorian:umbraingot>,               # Umbra Ingot
  "Ξ": <theaurorian:crystallineingot>, # Crystalline Ingot
  "=": <ore:ingotCerulean>,            # Cerulean Ingot
  "≡": <ore:ingotMoonstone>,       # Moonstone Ingot

  "‗": <midnight:tenebrum_ingot>,      # Tenebrum Ingot
  "N": <midnight:nagrilite_ingot>,   # Nagrilite Ingot

  "_": <mm:chasmium_ingot>,            # Chasmium Ingot

  "_": <ore:ingot_dark_soularium>, # Dark Soularium Ingot

  "▬": <ore:ingotDemonicMetal>,                # Demon Ingot
  "‗": <ore:ingotEvilMetal>,            # Evil Infused Iron Ingot

  "Ξ": <ore:ingotFluixSteel>,                  # Fluix Steel Ingot

  "=": <industrialforegoing:pink_slime_ingot>, # Pink Slime Ingot
  "Ξ": <randomthings:ingredient:3>,     # Spectre Ingot
  "≡": <nyx:meteor_ingot>,              # Meteor Ingot

  "T": <ore:ingotTough>,           # Tough Alloy Ingot
  "=": <ore:ingotSuperAlloy>,      # Super Alloy Ingot
  "▬": <ore:ingotHardCarbon>,        # Hard Carbon Alloy Ingot
  "-": <ore:ingotExtreme>,           # Extreme Alloy Ingot
  "T": <ore:ingotThermoconducting>,     # Thermoconducting Alloy Ingot

  "▬": <ore:ingotIronCompressed>,  # Compressed Iron Ingot
  "Ξ": <ore:ingotNetherite>,       # Netherite Ingot
  "‗": <ore:ingotEnchantedMetal>,  # Enchanted Ingot

  "‗": <ore:ingotCrystalized>,       # Crystalized Ingot

  "_": <ore:ingotGoldTitaniumAlloy>, # Gold-Titanium-Alloy Ingot
  "-": <ore:ingotIntertium>,       # Intertium Ingot

});*/

//Elements.add: Elements.add(long protons, long neutrons, long halfLifeSeconds, String decayTo, String name, String symbol, boolean isIsotope)
//Elements.add(8, 8, -1, null, "Crude Steel", "CS", false); // create a new element.


/////////////////////////////////////////////////////////
////////////////       Ender IO         /////////////////
/////////////////////////////////////////////////////////


//Crude Steel
var crude_steel = MaterialBuilder(32002, "crude_steel") // name
    .fluid("fluid", true) // fluid with block
    .ingot(1) // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x9e9e9e) // can also use colorAverage()
    .iconSet("dull") // "NONE", "METALLIC", "DULL", "MAGNETIC", "QUARTZ", "DIAMOND", "EMERALD", "SHINY", "ROUGH", "FINE", "SAND", "FLINT", "RUBY", "LAPIS", "FLUID", "GAS", "LIGNITE", "OPAL", "GLASS", "WOOD", "GEM_HORIZONTAL", "GEM_VERTICAL", "PAPER", "NETHERSTAR", "BRIGHT".
    .flags(["generate_plate", "generate_rod", "generate_gear", "generate_frame"]) // add flags
    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
//    .cableProperties(8, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .components([<material:iron> * 4, <material:carbon> * 1]) // set the components
//    .element("Iron")
//    .blastTemp(2900) // (int temp, @Optional gasTier - Available options are: "LOW", "MID", "HIGH", "HIGHER", "HIGHEST, @Optional int eutOverride, @Optional int durationOverride)
//    .ore() // (@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .washedIn(Material material, @Optional int washedAmount)
//    .separatedInto: separatedInto(Material... materials)
//    .addOreByproducts(<material:gold>, <material:copper>)
//    .oreSmeltInto(Material material)
//    .polarizesInto(Material material)
//    .arcSmeltInto(Material material)
//    .macerateInto(Material material)
//    .fluidTemp(int temp)
//    .fluidPipeProperties(int maxTemp, int throughput, boolean gasProof)
//    .itemPipeProperties(int priority, float stacksPerSec)
//    .addDefaultEnchant(IEnchantment enchantment)
    .build(); // build the actual material
ingotPrefix.setIgnored(<material:crude_steel>);

// End Steel
var end_steel = MaterialBuilder(32003, "end_steel")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xdbd986) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:end_steel>);

// Electrical Steel
var electrical_steel = MaterialBuilder(32004, "electrical_steel")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xa7b5b4) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:electrical_steel>);

// Dark Steel
var dark_steel = MaterialBuilder(32005, "dark_steel")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x363636) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:dark_steel>);
gearPrefix.setIgnored(<material:dark_steel>);

// Pulsating Iron
var pulsating_iron = MaterialBuilder(32006, "pulsating_iron")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x96d996) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:pulsating_iron>);

//Conductive Iron
var conductive_iron = MaterialBuilder(32007, "conductive_iron")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xe3b1b8) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:conductive_iron>);

// Redstone Alloy
var redstone_alloy = MaterialBuilder(32008, "redstone_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xa31d1d) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:redstone_alloy>);

// Vibrant Alloy
var vibrant_alloy = MaterialBuilder(32009, "vibrant_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xaade52) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:vibrant_alloy>);
gearPrefix.setIgnored(<material:vibrant_alloy>);

// Energetic Alloy
var energetic_alloy = MaterialBuilder(32010, "energetic_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xdb8246) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:energetic_alloy>);
gearPrefix.setIgnored(<material:energetic_alloy>);

// Soularium
var soularium = MaterialBuilder(32011, "soularium")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x6e4d2d) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:soularium>);

// Crystalline Alloy
var crystalline_alloy = MaterialBuilder(32012, "crystalline_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xadd7db) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:crystalline_alloy>);

// Melodic Alloy
var melodic_alloy = MaterialBuilder(32013, "melodic_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xc796d4) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:melodic_alloy>);

// Stellar Alloy
var stellar_alloy = MaterialBuilder(32014, "stellar_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xfffcd1) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:stellar_alloy>);

// Crystalline Pink Slime
var crystalline_pink_slime = MaterialBuilder(32015, "crystalline_pink_slime")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xdf8be0) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:crystalline_pink_slime>);

// Energetic Silver
var energetic_silver = MaterialBuilder(32016, "energetic_silver")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x73afc7) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:energetic_silver>);

// Vivid Alloy
var vivid_alloy = MaterialBuilder(32017, "vivid_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x46b4db) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:vivid_alloy>);



/////////////////////////////////////////////////////////
/////////////////       Lucidcraft      /////////////////
/////////////////////////////////////////////////////////


// Uru
Elements.add(800, 850, -1, null, "Uru", "Ur", false); // create a new element.
var uru = MaterialBuilder(32051, "uru")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xa3acad) // can also use colorAverage() if using components
    .iconSet("metallic")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
    .element("Uru")
    .blastTemp(5400, "HIGH") // (int temp, @Optional gasTier - Available options are: "LOW", "MID", "HIGH", "HIGHER", "HIGHEST, @Optional int eutOverride, @Optional int durationOverride)
//    .ore(1, 1, true)
//    .addOreByproducts(<material:dwarf_star_alloy>, <material:rutile>, <material:gold>)
    .build();
ingotPrefix.setIgnored(<material:uru>);


// Dwarf Star Alloy
var dwarf_star_alloy = MaterialBuilder(32050, "dwarf_star_alloy")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x445956) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
    .blastTemp(5400, "HIGH") // (int temp, @Optional gasTier - Available options are: "LOW", "MID", "HIGH", "HIGHER", "HIGHEST, @Optional int eutOverride, @Optional int durationOverride)
    .ore(1, 1, false)
    .addOreByproducts(<material:uru>, <material:tungsten>, <material:rutile>, <material:cooperite>)
    .build();
ingotPrefix.setIgnored(<material:dwarf_star_alloy>);

// Vibranium
// Vibrainium would be placed under the main body of metals of the periodic table near our currently unnamed elements. Its symbol would be Vb, and its shorthand electron configuration would be [Rn]7s27f147d5
// Elements.add: Elements.add(long protons, long neutrons, long halfLifeSeconds, String decayTo, String name, String symbol, boolean isIsotope)
Elements.add(850, 900, -1, null, "Vibranium", "Vb", false); // create a new element.

var vibranium = MaterialBuilder(32052, "vibranium")
    .fluid("fluid", true) // fluid with block
    .ingot(10) // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x82c4cf) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
    .element("Vibranium")
    .blastTemp(5400, "HIGH") // (int temp, @Optional gasTier - Available options are: "LOW", "MID", "HIGH", "HIGHER", "HIGHEST, @Optional int eutOverride, @Optional int durationOverride)
    .ore(1, 1, true) // (@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .washedIn(Material material, @Optional int washedAmount)
//    .separatedInto: separatedInto(Material... materials)
    .addOreByproducts(<material:uru>, <material:rutile>)
//    .oreSmeltInto(Material material)
//    .polarizesInto(Material material)
//    .arcSmeltInto(Material material)
//    .macerateInto(Material material)
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .toolStats(20, 15, 256000, 12) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:vibranium>);

// Adamantium
var adamantium = MaterialBuilder(32053, "adamantium")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xc1c2c9) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, "generate_foil", "generate_fine_wire"
//    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
//    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .build();
ingotPrefix.setIgnored(<material:adamantium>);

/////////////////////////////////////////////////////////
////////////////////       AE 2      ////////////////////
/////////////////////////////////////////////////////////


// Fluix
var fluix = MaterialBuilder(32100, "fluix")
    .gem() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x713d82) // can also use colorAverage() if using components
    .iconSet("QUARTZ")
    .flags(["generate_plate", "generate_rod", "generate_gear","generate_foil", "generate_fine_wire","generate_lens"]) // add flags, 
    .cableProperties(32, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .build();
gemPrefix.setIgnored(<material:fluix>);
blockPrefix.setIgnored(<material:fluix>);
dustPrefix.setIgnored(<material:fluix>);

// Fluix Steel
var fluix_steel = MaterialBuilder(32101, "fluix_steel")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x713d82) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // add flags, 
    .cableProperties(128, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .build();
ingotPrefix.setIgnored(<material:fluix_steel>);


/////////////////////////////////////////////////////////
//////////////////       Custom         /////////////////
/////////////////////////////////////////////////////////

// Green Crystal Alloy
var green_crystal_alloy = MaterialBuilder(32150, "green_crystal_alloy") // name
    .fluid("fluid", true) // fluid with block
    .ingot(1) // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x21a343) // can also use colorAverage()
    .iconSet("SHINY")
    .flags(["generate_plate", "generate_foil", "generate_fine_wire"])
    .cableProperties(8, 2, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .components([<material:crude_steel> * 4, <material:beryllium> * 1])
    .build();

##########################################################################################
print("==================== end of new_materials.zs ====================");
