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
import mods.gregtech.StoneType;
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

<material:silver>.addFlags("generate_spring");

//Color Changing
//<material:salt_water>.setMaterialRGB(0xFF1F5099);

###################################################
################## NEW MATS #######################
###################################################

/*

  "=": <industrialforegoing:pink_slime_ingot>, # Pink Slime Ingot
  "Ξ": <randomthings:ingredient:3>,     # Spectre Ingot
  "≡": <nyx:meteor_ingot>,              # Meteor Ingot


  "_": <mm:chasmium_ingot>,            # Chasmium Ingot

  "_": <ore:ingot_dark_soularium>, # Dark Soularium Ingot

  "▬": <ore:ingotDemonicMetal>,                # Demon Ingot
  "‗": <ore:ingotEvilMetal>,            # Evil Infused Iron Ingot

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
    .flags(["generate_plate", "generate_rod", "generate_gear", "generate_frame", "generate_bolt_screw"]) // add flags
    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
//    .cableProperties(8, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .components([<material:iron> * 4, <material:carbon>*1]) // set the components
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
///////////////       The Aurorian      /////////////////
/////////////////////////////////////////////////////////


// Cerulean
//Elements.add(800, 850, -1, null, "Cerulean", "Cr", false); // create a new element.
var cerulean = MaterialBuilder(32060, "cerulean")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x87e9ff) // can also use colorAverage() if using components
    .iconSet("SHINY")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Cerulean")
    .ore(1, 1, true) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
ingotPrefix.setIgnored(<material:cerulean>);


// Moonstone
//Elements.add(800, 850, -1, null, "Moonstone", "Mn", false); // create a new element.
var moonstone = MaterialBuilder(32061, "moonstone")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xdadbd3) // can also use colorAverage() if using components
    .iconSet("SHINY")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Moonstone")
    .ore(1, 1, true) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
ingotPrefix.setIgnored(<material:moonstone>);

// Aurorian Crystal
//Elements.add(800, 850, -1, null, "Aurorian Crystal", "Mn", false); // create a new element.
var aurorian_geode = MaterialBuilder(32062, "aurorian_geode")
    .gem() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xbe99c4) // can also use colorAverage() if using components
    .iconSet("diamond")
//    .element("Aurorian Crystal")
    .ore(2, 1, true) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
gemPrefix.setIgnored(<material:aurorian_geode>);

// Crystalline
var crystalline = MaterialBuilder(32063, "crystalline")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xbea9c2) // can also use colorAverage() if using components
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
    .iconSet("shiny")
    .build();
ingotPrefix.setIgnored(<material:crystalline>);

// Umbra
var umbra = MaterialBuilder(32064, "umbra")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x191a21) // can also use colorAverage() if using components
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
    .iconSet("metallic")
    .build();
ingotPrefix.setIgnored(<material:umbra>);

// Aurorianite
var aurorianite = MaterialBuilder(32065, "aurorianite")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x5c68bf) // can also use colorAverage() if using components
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
    .iconSet("shiny")
    .build();
ingotPrefix.setIgnored(<material:aurorianite>);

// Aurorian Steel
var aurorian_steel = MaterialBuilder(32066, "aurorian_steel")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x855cad) // can also use colorAverage() if using components
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
    .iconSet("shiny")
    .blastTemp(5400, "HIGH") // (int temp, @Optional gasTier - Available options are: "LOW", "MID", "HIGH", "HIGHER", "HIGHEST, @Optional int eutOverride, @Optional int durationOverride)
    .build();
ingotPrefix.setIgnored(<material:aurorian_steel>);


/////////////////////////////////////////////////////////
///////////////       The Midnight      /////////////////
/////////////////////////////////////////////////////////


// Tenebrum
//Elements.add(800, 850, -1, null, "Tenebrum", "Cr", false); // create a new element.
var tenebrum = MaterialBuilder(32070, "tenebrum")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x0f0f1c) // can also use colorAverage() if using components
    .iconSet("dull")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Tenebrum")
    .ore(1, 1, false) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
ingotPrefix.setIgnored(<material:tenebrum>);

// Nagrilite
//Elements.add(800, 850, -1, null, "Nagrilite", "Cr", false); // create a new element.
var nagrilite = MaterialBuilder(32071, "nagrilite")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x331d40) // can also use colorAverage() if using components
    .iconSet("dull")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Nagrilite")
    .ore(1, 1, false) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
ingotPrefix.setIgnored(<material:nagrilite>);

// Ebony
//Elements.add(800, 850, -1, null, "Ebony", "Cr", false); // create a new element.
var ebony = MaterialBuilder(32072, "ebony")
    .fluid("fluid", true) // fluid with block
    .gem() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x120d0a) // can also use colorAverage() if using components
    .iconSet("diamond")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Ebony")
    .ore(1, 1, false) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
gemPrefix.setIgnored(<material:ebony>);

// Archaic Shard
//Elements.add(800, 850, -1, null, "Archaic Shard", "Cr", false); // create a new element.
var archaic_shard = MaterialBuilder(32073, "archaic_shard")
    .fluid("fluid", true) // fluid with block
    .gem() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x6950a6) // can also use colorAverage() if using components
    .iconSet("diamond")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Archaic Shard")
    .ore(1, 1, true) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
gemPrefix.setIgnored(<material:archaic_shard>);


/////////////////////////////////////////////////////////
/////////////       The Betweenlands      ///////////////
/////////////////////////////////////////////////////////


// Octine
//Elements.add(800, 850, -1, null, "Octine", "Cr", false); // create a new element.
var octine = MaterialBuilder(32080, "octine")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xed822f) // can also use colorAverage() if using components
    .iconSet("shiny")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Octine")
    .ore(1, 1, true) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
ingotPrefix.setIgnored(<material:octine>);

// Syrmorite
//Elements.add(800, 850, -1, null, "Syrmorite", "Cr", false); // create a new element.
var syrmorite = MaterialBuilder(32081, "syrmorite")
    .fluid("fluid", true) // fluid with block
    .ingot() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x3d48db) // can also use colorAverage() if using components
    .iconSet("dull")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Syrmorite")
    .ore(1, 1, false) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
ingotPrefix.setIgnored(<material:syrmorite>);

// Valonite
//Elements.add(800, 850, -1, null, "Valonite", "Cr", false); // create a new element.
var valonite = MaterialBuilder(32082, "valonite")
    .fluid("fluid", true) // fluid with block
    .gem() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0xbd9dbf) // can also use colorAverage() if using components
    .iconSet("diamond")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Valonite")
    .ore(1, 1, false) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
gemPrefix.setIgnored(<material:valonite>);


// Scabyst
//Elements.add(800, 850, -1, null, "Scabyst", "Cr", false); // create a new element.
var scabyst = MaterialBuilder(32083, "scabyst")
    .fluid("fluid", true) // fluid with block
    .gem() // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x7ca394) // can also use colorAverage() if using components
    .iconSet("diamond")
    .flags(["generate_plate", "generate_rod", "generate_gear"]) // "generate_foil", "generate_fine_wire"
//    .element("Scabyst")
    .ore(1, 1, true) //(@Optional int oreMultiplier, @Optional int byproductMultiplier, @Optional boolean emissive)
//    .addOreByproducts(<material:gold>)
    .build();
gemPrefix.setIgnored(<material:scabyst>);

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


// Sky Stone
var sky_stone = MaterialBuilder(32102, "sky_stone")
    .dust(1)
    .color(0x133554)
    .build();
//dustPrefix.setIgnored(<material:sky_stone>);



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

// Minor Manifested EMC
var emc_minor = MaterialBuilder(32200, "emc_minor") // name
    .fluid("fluid", true) // fluid with block
    .ingot(1) // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x30e642) // can also use colorAverage()
    .iconSet("SHINY")
    .flags(["generate_plate", "generate_foil", "generate_fine_wire", "generate_rod", "generate_gear", "generate_long_rod", "generate_spring"])
    .cableProperties(8, 2, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .build();



/////////////////////////////////////////////////////////
////////////       New Stone Types         //////////////
/////////////////////////////////////////////////////////

//Sky Stone
val oreSkyStone as OrePrefix = OrePrefix.registerOrePrefix("oreSkyStone", 1);
oreSkyStone.addSecondaryMaterial(<material:sky_stone>);
StoneType.create(16,"sky_stone","oreSkyStone",<material:sky_stone>,"appliedenergistics2:sky_stone_block", null, true);

//Aurorian Stone
StoneType.create(17,"stone_aurorian","oreAurorianStone",<material:stone>,"theaurorian:aurorianstone", null, true);

//Atum Stone
StoneType.create(18,"betweenstone","oreBetweenStone",<material:stone>,"thebetweenlands:betweenstone", null, true);

//Midnight Stone
StoneType.create(19,"nightstone","oreNightStone",<material:stone>,"midnight:nightstone", null, true);

/*
// Aurorian Stone
var stone_aurorian = MaterialBuilder(32300, "stone_aurorian")
    .dust(1)
    .color(0x133554)
    .build();


// Atum Limetone
var limestone_atum = MaterialBuilder(32301, "limestone_atum")
    .dust(1)
    .color(0xf7d26a)
    .build();
*/

##########################################################################################
print("==================== end of new_materials.zs ====================");
