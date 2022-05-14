import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
print("==================== loading gregtech.zs ====================");
##########################################################################################

val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

# [ULV Electric Pump] from [Rubber Ring][+6]
craft.remake(<metaitem:electric.pump.ulv>, ["pretty",
  "* B l",
  "r R  ",
  "o   T"], {
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "B": <ore:rotorBronze>,                    # Bronze Rotor
  "l": <ore:gtceWrenches>, # Neutronium Wrench
  "r": <ore:screwBronze>,                    # Bronze Screw
  "R": <ore:ringRubber>,                     # Rubber Ring
  "o": <ore:gtceScrewdrivers>, # Neutronium Screwdriver
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

# [ULV Electric Motor] from [Iron Rod][+5]
craft.remake(<metaitem:electric.motor.ulv>, ["pretty",
  "* ╱ l",
  "/ *  ",
  "o   T"], {
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "╱": <ore:stickIron>,                      # Iron Rod
  "l": <ore:gtceWrenches>, # Neutronium Wrench
  "/": <ore:stickIronMagnetic>,              # Magnetic Iron Rod
  "o": <ore:gtceWireCutters>, # Neutronium Wire Cutter
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

# [ULV Electric Piston] from [Small Bronze Gear][+6]
craft.remake(<metaitem:electric.piston.ulv>, ["pretty",
  "□ ╱ l",
  "U ¤  ",
  "o   T"], {
  "□": <ore:plateBronze>,                        # Bronze Plate
  "╱": <ore:stickBronze>,                        # Bronze Rod
  "l": <ore:gtceWrenches>, # Neutronium Wrench
  "U": <metaitem:electric.motor.ulv>,      # ULV Electric Motor
  "¤": <ore:gearSmallBronze>,                    # Small Bronze Gear
  "o": <ore:gtceFiles>, # Neutronium File
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

# [ULV Conveyor Module] from [ULV Electric Motor][+5]
craft.remake(<metaitem:conveyor.module.ulv>, ["pretty",
  "□ U T",
  "* □  ",
  "o   l"], {
  "□": <ore:plateRubber>,                    # Rubber Sheet
  "U": <metaitem:electric.motor.ulv>,         # ULV Electric Motor
  "T": <ore:gtceWireCutters>, # Neutronium Wire Cutter
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "o": <ore:gtceScrewdrivers>, # Neutronium Screwdriver
  "l": <ore:gtceHardHammers>, # Neutronium Hammer
});


//Glass Tubes
recipes.addShaped(<metaitem:component.glass.tube>, [
	[null, <ore:paneGlassColorless>, null],
	[<ore:paneGlassColorless>, null, <ore:paneGlassColorless>], 
	[null, <ore:paneGlassColorless>, null]
]);

//Wrought Iron temp
furnace.addRecipe(<metaitem:ingotWroughtIron>, <minecraft:iron_ingot>);



// Nutrient Distilation
brewery.recipeBuilder()
    .inputs(<minecraft:brown_mushroom>|<minecraft:red_mushroom>|<minecraft:potato>)
    .fluidInputs([<liquid:water> * 1000])
	.fluidOutputs([<liquid:nutrient_distillation> * 1000])
	.EUt(2)
	.duration(128)
	.buildAndRegister();

// Biomass * 750
<recipemap:brewery>.findRecipe(4, [<metaitem:bio_chaff>], [<liquid:water> * 750]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:red_mushroom:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:potato:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:carrot:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:brown_mushroom:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:beetroot:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:reeds:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:cactus:0>], [<liquid:water> * 20]).remove();


// Bio Mass with water
brewery.recipeBuilder()
    .inputs(<metaitem:bio_chaff>)
    .fluidInputs([<liquid:water> * 500])
	.fluidOutputs([<liquid:biomass> * 500])
	.EUt(4)
	.duration(128)
	.buildAndRegister();

// Bio Mass
brewery.recipeBuilder()
    .inputs(<metaitem:bio_chaff>)
    .fluidInputs([<liquid:nutrient_distillation> * 1000])
	.fluidOutputs([<liquid:biomass> * 1000])
	.EUt(4)
	.duration(128)
	.buildAndRegister();

# [ULV Energy Output Hatch] from [ULV Machine Hull][+2]
craft.remake(<mbd:ulv_energy_output>, ["pretty",
  "  U  ",
  "L V L"], {
  "U": <metaitem:voltage_coil.ulv>, # Ultra Low Voltage Coil
  "L": <ore:springLead>,          # Lead Spring
  "V": <metaitem:hull.ulv>,    # ULV Machine Hull
});

# [ULV Dynamo Hatch] from [ULV Energy Output Hatch]
craft.reshapeless(<metaitem:energy_hatch.output.ulv>, "Ϟ", {
  "Ϟ": <mbd:ulv_energy_output>, # ULV Energy Output Hatch
});
<metaitem:energy_hatch.output.ulv>.addTooltip(format.red("Deprecated until proper MBD support"));

//Temp?
// Ultra Low Voltage Coil * 1
<recipemap:assembler>.findRecipe(7, [<metaitem:stickIronMagnetic>, <metaitem:wireFineLead> * 16, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
# [Ultra Low Voltage Coil] from [Magnetic Iron Rod][+1]
craft.remake(<gregtech:meta_item_1:96>, ["pretty",
  "F F F",
  "F ╱ F",
  "F F F"], {
  "F": <ore:wireFineLead>,      # Fine Lead Wire
  "╱": <ore:stickIronMagnetic>, # Magnetic Iron Rod
});

// Fix fermented spider eye to accept oredict
recipes.removeByRecipeName("minecraft:fermented_spider_eye");
<recipemap:mixer>.findRecipe(7, [<minecraft:sugar:0>, <minecraft:red_mushroom:0>, <minecraft:spider_eye:0>], null).remove();
<recipemap:mixer>.findRecipe(7, [<minecraft:sugar:0>, <minecraft:brown_mushroom:0>, <minecraft:spider_eye:0>], null).remove();
recipes.addShapeless("fermented_spider_eye", <minecraft:fermented_spider_eye>, [<minecraft:spider_eye>, <ore:listAllmushroom>, <ore:listAllsugar>]);
<recipemap:mixer>.recipeBuilder()
	.inputs(<minecraft:spider_eye>, <ore:listAllmushroom>, <ore:listAllsugar>)
	.outputs(<minecraft:fermented_spider_eye>)
	.duration(100).EUt(7).buildAndRegister();

// Remove Sulfur Dioxide recipe with unneeded circuit from GT chem reactor
<recipemap:chemical_reactor>.findRecipe(7, [<metaitem:dustSulfur>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:oxygen>*2000]).remove();

// Sulfur Dioxide (for the GT chem reactor)
<recipemap:chemical_reactor>.recipeBuilder()
	.inputs(<ore:dustSulfur>)
	.fluidInputs(<liquid:oxygen>*2000)
	.fluidOutputs(<liquid:sulfur_dioxide>*1000)
	.duration(60).EUt(7).buildAndRegister();

// Fix Carbon monoxide recipe which takes way longer than other carbon monoxide recipes
<recipemap:chemical_reactor>.findRecipe(7, [<metaitem:dustCarbon>], [<liquid:carbon_dioxide>*1000]).remove();
<recipemap:chemical_reactor>.recipeBuilder()
	.inputs(<ore:dustCarbon>)
	.fluidInputs(<liquid:carbon_dioxide>*1000)
	.fluidOutputs(<liquid:carbon_monoxide>*1000)
	.duration(80).EUt(7).buildAndRegister();

// Carbon Monoxide from coal/charcoal
val carbonMonoxideItems as IOreDictEntry[] = [
	<ore:gemCoal>,
	<ore:gemCharcoal>,
	<ore:dustCoal>,
	<ore:dustCharcoal>
] as IOreDictEntry[];

for item in carbonMonoxideItems {
	<recipemap:chemical_reactor>.findRecipe(7, [item.firstItem, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:oxygen>*1000]).remove();
	<recipemap:chemical_reactor>.recipeBuilder()
		.inputs(item)
		.fluidInputs(<liquid:oxygen>*1000)
		.outputs(<metaitem:dustTinyAsh>)
		.fluidOutputs(<liquid:carbon_monoxide>*1000)
		.duration(80).EUt(7).buildAndRegister();
}

// Rice slimeballs
<recipemap:chemical_reactor>.recipeBuilder()
	.inputs(<actuallyadditions:item_misc:9>*4)
	.fluidInputs(<liquid:water>*1000)
	.outputs(<actuallyadditions:item_misc:12>*4)
.duration(80).EUt(20).buildAndRegister();

// Biomass from Nutrient Distillation + Sapling (for the GT brewery)
<recipemap:brewery>.recipeBuilder()
	.inputs(<ore:treeSapling>)
	.fluidInputs(<liquid:nutrient_distillation>*200)
	.fluidOutputs(<liquid:biomass>*200)
	.duration(128).EUt(4).buildAndRegister();
	
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
print("==================== end of gregtech.zs ====================");
