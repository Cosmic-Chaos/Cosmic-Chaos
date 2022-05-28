import crafttweaker.item.IItemStack;
import mods.projecte.WorldTransmutation;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.block.IBlockState;
print("==================== loading mods blank.zs ====================");
##########################################################################################

var name_removals = [
    "projecte:conversions/emerald_to_diamond",
    "projecte:conversions/gold_to_iron",
    "projecte:conversions/iron_to_ender_pearl",
    "projecte:conversions/diamond_to_iron",
    "projecte:conversions/iron_to_gold",
    "projecte:conversions/diamond_to_emerald",
    "projecte:conversions/gold_to_diamond",
] as string[];

for item in name_removals {
    recipes.removeByRecipeName(item);
}

val itemstoRemove =
[
<projecte:item.pe_fuel>,
<projecte:item.pe_fuel:1>,
<projecte:item.pe_fuel:2>,
<equivadditions:zeitheron_fuel>,
<projecte:item.pe_covalence_dust>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

mods.projecte.WorldTransmutation.removeAll();

/* Three Levels

Weak, Satisfactory, Strong

Beginning, Intermediate, High

Weak, Average, Excellent

Developing, Competent, Exemplary

Low Mastery, Average Mastery, High Mastery
Four Levels

Unacceptable, Marginal, Proficient, Distinguished

Beginning, Developing, Accomplished, Exemplary

Needs Improvement, Satisfactory, Good, Accomplished

Emerging, Progressing, Partial Mastery, Mastery

Not Yet Competent, Partly Competent, Competent, Sophisticated

Inadequate, Needs Improvement, Meets Expectations, Exceeds Expectations

Poor, Fair, Good, Excellent
Five Levels

Poor, Minimal, Sufficient, Above Average, Excellent

Novice, Intermediate, Proficient, Distinguished, Master

Unacceptable, Poor, Satisfactory, Good, Excellent
Six Levels

Unacceptable, Emerging, Minimally Acceptable, Acceptable, Accomplished, Exemplary 
*/

//Mote
//This is looted, which is how you get the chain started
//Crafting up is done once with an item for that tier and then using the table
//recipes.addShapeless(<contenttweaker:emc_mote>*8, [<contenttweaker:emc_fragment_1>]);


val mapEMC as IItemStack[][IOreDictEntry] = {
    <ore:circuitUlv>:[<cosmic_core:cc_meta_item:10>, <cosmic_core:cc_meta_item:11>], //ULV
    <ore:circuitLv>:[<cosmic_core:cc_meta_item:11>, <cosmic_core:cc_meta_item:12>],
    <ore:circuitMv>:[<cosmic_core:cc_meta_item:12>, <cosmic_core:cc_meta_item:13>],
    <ore:circuitHv>:[<cosmic_core:cc_meta_item:13>, <cosmic_core:cc_meta_item:14>],
    <ore:circuitEv>:[<cosmic_core:cc_meta_item:14>, <cosmic_core:cc_meta_item:15>],
    <ore:circuitIv>:[<cosmic_core:cc_meta_item:15>, <cosmic_core:cc_meta_item:16>],
    <ore:circuitLuv>:[<cosmic_core:cc_meta_item:16>, <cosmic_core:cc_meta_item:17>],
    <ore:circuitZpm>:[<cosmic_core:cc_meta_item:17>, <cosmic_core:cc_meta_item:18>],
    <ore:circuitUv>:[<cosmic_core:cc_meta_item:18>, <cosmic_core:cc_meta_item:19>],
} as IItemStack[][IOreDictEntry];

for item, material in mapEMC {
recipes.addShaped(material[1], [
	[material[0], material[0], material[0]],
	[material[0],    item,     material[0]], 
	[material[0], material[0], material[0]]
]);
}

//WorldTransmutation.add(IBlockState output, IBlockState input, @Optional IBlockState sneakOutput);

val twoWayConversion as IBlockState[IBlockState] = {

<blockstate:minecraft:glowstone>:<blockstate:minecraft:redstone_block>,

<blockstate:chisel:factory:variation=9>:<blockstate:chisel:technicalnew:variation=2>, // Tier 1
<blockstate:chisel:laboratory:variation=11>:<blockstate:chisel:laboratory:variation=5>, // Tier 2

} as IBlockState[IBlockState];
for blockOne, blockTwo in twoWayConversion {

WorldTransmutation.add(blockOne, blockTwo);
WorldTransmutation.add(blockTwo, blockOne);

}



//Not sure if I'll keep these ratios, but the idea is once you unlock the higher tier of EMC item you get a better ratio.

/*
//chemical_reactor.recipeBuilder() // May use for higher tier
extractor.recipeBuilder()
    .inputs(<contenttweaker:emc_fragment_1>)
	.fluidOutputs([<liquid:emc_minor> * 16])
	.EUt(10)
	.duration(100)
.buildAndRegister();
// Fragment t2
extractor.recipeBuilder()
    .inputs(<contenttweaker:emc_fragment_2>)
	.fluidOutputs([<liquid:emc_minor> * 144])
	.EUt(10)
	.duration(200)
.buildAndRegister();
// Fragment t3
extractor.recipeBuilder()
    .inputs(<contenttweaker:emc_fragment_3>)
	.fluidOutputs([<liquid:emc_minor> * 1296])
	.EUt(10)
	.duration(200)
.buildAndRegister();
*/

# [Minor Alchemical Construct] from [Bronze Plate][+8]
craft.remake(<cosmic_core:cc_meta_item:20>, ["pretty",
  "o G T",
  "* □ F",
  "○ H l"], {
  "o": <ore:gtceScrewdrivers>, # Neutronium Screwdriver
  "G": <metaitem:component.glass.tube>,             # Glass Tube
  "T": <ore:gtceSaws>, # Neutronium Saw
  "*": <ore:wireFineGreenCrystalAlloy>,        # Fine Green Crystal Alloy Wire
  "□": <ore:plateBronze>,                      # Bronze Plate
  "F": <ore:wireFineRedAlloy>,                 # Fine Red Alloy Wire
  "○": <ore:gtceHardHammers>, # Neutronium Hammer
  "H": <ore:springEmcMinor>,                       # HSS-G Spring
  "l": <ore:gtceWrenches>, # Neutronium Wrench
});

/*
val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/


// If the IItemStack's do not have a coresponding block, air is used instead.
//mods.projecte.WorldTransmutation.add(IItemStack output, IItemStack input, @Optional IItemStack sneakOutput);

WorldTransmutation.add(<gregtech:ore_iron_1>, <gregtech:ore_iron_0>);

##########################################################################################
print("==================== end of mods blank.zs ====================");
