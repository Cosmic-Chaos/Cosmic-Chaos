#loader gregtech
#priority 1001
import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDictEntry;
print("==================== loading new_materials.zs ====================");
##########################################################################################

//Unification stuff
<material:gold>.addFlags("generate_gear");
<material:tin>.addFlags("generate_gear");
<material:copper>.addFlags("generate_gear");

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

  "▬": <ore:ingotCrudeSteel>,          # Crude Steel Ingot
  "l": <ore:ingotElectricalSteel>,     # Electrical Steel Ingot
  "E": <ore:ingotEnergeticAlloy>,      # Energetic Alloy Ingot
  "-": <ore:ingotEnergeticSilver>,      # Energetic Silver Ingot
  "=": <ore:ingotCrystallinePinkSlime>, # Crystalline Pink Slime Ingot
  "▬": <ore:ingotStellarAlloy>,         # Stellar Alloy Ingot
  "_": <ore:ingotSoularium>,            # Soularium Ingot
  "E": <ore:ingotEndSteel>,             # End Steel Ingot
  "V": <ore:ingotVibrantAlloy>,    # Vibrant Alloy Ingot
  "_": <ore:ingot_dark_soularium>, # Dark Soularium Ingot
  "Ξ": <ore:ingotVividAlloy>,        # Vivid Alloy Ingot
  "D": <ore:ingotDarkSteel>,         # Dark Steel Ingot
  "≡": <ore:ingotMelodicAlloy>,      # Melodic Alloy Ingot
  "=": <ore:ingotCrystallineAlloy>,  # Crystalline Alloy Ingot

  "▬": <ore:ingotDemonicMetal>,                # Demon Ingot
  "‗": <ore:ingotEvilMetal>,            # Evil Infused Iron Ingot

  "Ξ": <ore:ingotFluixSteel>,                  # Fluix Steel Ingot
  "♥": <ore:ingotRedstoneAlloy>,               # Redstone Alloy Ingot
  "C": <ore:ingotConductiveIron>,              # Conductive Iron Ingot
  "_": <ore:ingotPulsatingIron>,               # Pulsating Iron Ingot

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
  "-": <ore:ingotUru>,                 # Uru Ingot
  "‗": <ore:ingotDwarfStarAlloy>,              # Dwarf Star Alloy Ingot
  "-": <ore:ingotVibranium>,                   # Vibranium Ingot
  "-": <ore:ingotIntertium>,       # Intertium Ingot

});*/

//Elements.add(8, 8, -1, null, "Crude Steel", "CS", false); // create a new element.

//Crude Steel
var crude_steel = MaterialBuilder(32001, "crude_steel") // name
    .fluid("fluid", true) // fluid with block
    .ingot(1) // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x9e9e9e) // can also use colorAverage()
    .iconSet("dull") // "NONE", "METALLIC", "DULL", "MAGNETIC", "QUARTZ", "DIAMOND", "EMERALD", "SHINY", "ROUGH", "FINE", "SAND", "FLINT", "RUBY", "LAPIS", "FLUID", "GAS", "LIGNITE", "OPAL", "GLASS", "WOOD", "GEM_HORIZONTAL", "GEM_VERTICAL", "PAPER", "NETHERSTAR", "BRIGHT".
    .flags(["generate_plate", "generate_rod", "generate_gear", "generate_frame"]) // add flags
    .toolStats(10, 3, 256, 1) // (float speed, float damage, int durability, int enchantability)
    .cableProperties(8, 1, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
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

// Green Crystal Alloy
var green_crystal_alloy = MaterialBuilder(32002, "green_crystal_alloy") // name
    .fluid("fluid", true) // fluid with block
    .ingot(1) // (@Optional int harvestLevel, @Optional int burnTime)
    .color(0x21a343) // can also use colorAverage()
    .iconSet("SHINY") // "NONE", "METALLIC", "DULL", "MAGNETIC", "QUARTZ", "DIAMOND", "EMERALD", "SHINY", "ROUGH", "FINE", "SAND", "FLINT", "RUBY", "LAPIS", "FLUID", "GAS", "LIGNITE", "OPAL", "GLASS", "WOOD", "GEM_HORIZONTAL", "GEM_VERTICAL", "PAPER", "NETHERSTAR", "BRIGHT".
    .flags(["generate_plate", "generate_foil", "generate_fine_wire"]) // add flags
    .cableProperties(8, 4, 1, false) // (long voltage, int amperage, int loss, @Optional boolean isSuperCon)
    .components([<material:crude_steel> * 3, <material:beryllium> * 1])
    .build();


/*
val crystalized = MaterialRegistry.createIngotMaterial(600, "crystalized", 0x52bfa8, "shiny", 1);
crystalized.setCableProperties(128, 2, 0);
crystalized.addFlags(["GENERATE_ROD", "GENERATE_PLATE", "GENERATE_GEAR"]);
*//*


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


*/
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
