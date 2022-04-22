import crafttweaker.item.IItemStack;
import mods.projecte.WorldTransmutation;
import crafttweaker.oredict.IOreDictEntry;
print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
<projecte:item.pe_fuel>,
<projecte:item.pe_fuel:1>,
<projecte:item.pe_fuel:2>,
<equivadditions:zeitheron_fuel>,

]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

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
    <ore:circuitUlv>:[<contenttweaker:emc_item_1>, <contenttweaker:emc_item_2>], //ULV
    <ore:circuitLv>:[<contenttweaker:emc_item_2>, <contenttweaker:emc_item_3>],
    <ore:circuitMv>:[<contenttweaker:emc_item_3>, <contenttweaker:emc_item_4>],
    <ore:circuitHv>:[<contenttweaker:emc_item_4>, <contenttweaker:emc_item_5>],
    <ore:circuitEv>:[<contenttweaker:emc_item_5>, <contenttweaker:emc_item_6>],
    <ore:circuitIv>:[<contenttweaker:emc_item_6>, <contenttweaker:emc_item_7>],
    <ore:circuitLuv>:[<contenttweaker:emc_item_7>, <contenttweaker:emc_item_8>],
    <ore:circuitZpm>:[<contenttweaker:emc_item_8>, <contenttweaker:emc_item_9>],
    <ore:circuitUv>:[<contenttweaker:emc_item_9>, <contenttweaker:emc_item_10>],
} as IItemStack[][IOreDictEntry];

for item, material in mapEMC {
recipes.addShaped(material[1], [
	[material[0], material[0], material[0]],
	[material[0],    item,     material[0]], 
	[material[0], material[0], material[0]]
]);
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
craft.remake(<contenttweaker:emc_widget_1>, ["pretty",
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
