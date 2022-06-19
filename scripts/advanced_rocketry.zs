import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
print("==================== loading advanced_rocketry.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<advancedrocketry:misc>,
	<advancedrocketry:thermite>,
	<libvulpes:structuremachine>,
	<advancedrocketry:concrete>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Frame
recipes.addShaped(<libvulpes:structuremachine> * 2, [
	[<ore:stickIron>, <ore:plateIron>, <ore:stickIron>],
	[<ore:plateIron>, null, <ore:plateIron>], 
	[<ore:stickIron>, <ore:plateIron>, <ore:stickIron>]
]);
recipes.addShaped(<libvulpes:structuremachine> * 4, [
	[<ore:stickWroughtIron>, <ore:plateWroughtIron>, <ore:stickWroughtIron>],
	[<ore:plateWroughtIron>, null, <ore:plateWroughtIron>], 
	[<ore:stickWroughtIron>, <ore:plateWroughtIron>, <ore:stickWroughtIron>]
]);
recipes.addShaped(<libvulpes:structuremachine> * 8, [
	[<ore:stickSteel>, <ore:plateSteel>, <ore:stickSteel>],
	[<ore:plateSteel>, null, <ore:plateSteel>], 
	[<ore:stickSteel>, <ore:plateSteel>, <ore:stickSteel>]
]);

# [Launch Pad] from [Black Dye]*2[+2]
craft.reshapeless(<advancedrocketry:launchpad>, "cB▲", {
  "c": <ore:concrete>,      # Concrete
  "B": <quark:root_dye:1>,  # Black Dye
  "▲": <ore:dustGlowstone>, # Glowstone Dust
});

# [Structure Tower]*8 from [Crude Steel Frame Box][+1]
craft.remake(<advancedrocketry:structuretower> * 2, ["pretty",
  "╱ ╱ ╱",
  "╱ ◙ ╱",
  "╱ ╱ ╱"], {
  "╱": <ore:stickSilver>,       # Silver Rod
  "◙": <ore:frameGtCrudeSteel>, # Crude Steel Frame Box
});

//Thermite
recipes.addShapeless(<advancedrocketry:thermite> * 3, [<ore:dustAluminium>,<ore:dustIron>,<ore:dustIron>]);

//Carbon brick melting
<recipemap:extractor>.findRecipe(30, [<advancedrocketry:misc:1>], null).remove();

//Carbon brick crushing
<recipemap:macerator>.findRecipe(2, [<advancedrocketry:misc:1>], null).remove();

//Silicon Boule
//<recipemap:chemical_reactor>.findRecipe(60, [<metaitem:circuit.integrated>.withTag({Configuration:1})], [<liquid:silicon>*1296]).remove();
//Can't be removed due to late registration :((((((

/*
# [Low Pressure Tank] from [Neutronium Screwdriver][+3]
craft.remake(<advancedrocketry:pressuretank>, ["pretty",
  "I W I",
  "I o I",
  "I T I"], {
  "I": <ore:sheetIron>,        # Iron Sheet
  "W": <ore:screwWroughtIron>, # Wrought Iron Screw
  "o": <ore:gtceScrewdrivers>, # Neutronium Screwdriver
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});
*/

# [Lens] from [Glass Lens (White)]*3[+2]
<recipemap:assembler>.recipeBuilder()
	.inputs(<ore:stickIron>, <ore:lensGlass>*3, <ore:blockGlassColorless>*3)
	.outputs(<advancedrocketry:blocklens>)
.duration(1200).EUt(100).buildAndRegister();

# [Suit Workstation] from [Machine Structure][+1]
recipes.removeByRecipeName("advancedrocketry:suitworkstation");
craft.make(<advancedrocketry:suitworkstation>, ["pretty",
  "  C",
  "  M"], {
  "C": <metaitem:gregtech:workbench>,      # Crafting Station
  "M": <libvulpes:structuremachine:0>, # Machine Structure
});

# [Observatory] from [Machine Structure][+4]
recipes.removeByRecipeName("advancedrocketry:observatory");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<ore:circuitMv>*2,
		<ore:lensDiamond>*2,
		<ore:stickAluminium>*3
	).outputs(<advancedrocketry:observatory>)
.duration(1200).EUt(100).buildAndRegister();

# [Astrobody Data Processor] from [Machine Structure][+4]
recipes.removeByRecipeName("advancedrocketry:planetanalyser");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>,    # Machine Structure
		<advancedrocketry:misc:0>,         # User Interface
		<advancedrocketry:ic:1>*2,         # Tracking Circuit
		<advancedrocketry:planetidchip>*2,
		<ore:plateVanadiumSteel>*2
	).outputs(<advancedrocketry:planetanalyser>)
.duration(1200).EUt(100).buildAndRegister();

# [Satellite Builder] from [Machine Structure][+7]
recipes.removeByRecipeName("advancedrocketry:satellitebuilder");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<ore:circuitMv>*2,
		<metaitem:robot.arm.mv>,
		<metaitem:conveyor.module.mv>,
		<metaitem:electric.motor.mv>,
		<advancedrocketry:sawblade>,
		<advancedrocketry:dataunit>,
		<ore:plateVanadiumSteel>
	).outputs(<advancedrocketry:satellitebuilder>)
.duration(1200).EUt(100).buildAndRegister();

# [Warp Core] from [Copper Coil][+3]
recipes.removeByRecipeName("advancedrocketry:warpcore");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<ore:coilCopper>,
		<ore:circuitEv>*2,
		<ore:plateTitanium>*4,
		<ore:plateSteel>*2
	).outputs(<advancedrocketry:warpcore>)
.duration(1200).EUt(1200).buildAndRegister();

# [Space Suit Helmet] from [Glass Pane]*2[+1]
craft.remake(<advancedrocketry:spacehelmet>, ["pretty",
  "I I I",
  "I G I"], {
  "I": <ore:sheetIron>,        # Iron Sheet
  "G": <minecraft:glass_pane>, # Glass Pane
});

# [Space Suit Chest-Piece] from [Iron Sheet]
craft.remake(<advancedrocketry:spacechestplate>, ["pretty",
  "I   I",
  "I I I",
  "I I I"], {
  "I": <ore:sheetIron>, # Iron Sheet
});

# [Space Suit Leggings] from [Iron Sheet]
craft.remake(<advancedrocketry:spaceleggings>, ["pretty",
  "I I I",
  "I   I",
  "I   I"], {
  "I": <ore:sheetIron>, # Iron Sheet
});

# [Space Suit Boots] from [Iron Sheet]
craft.remake(<advancedrocketry:spaceboots>, ["pretty",
  "     ",
  "I   I",
  "I   I"], {
  "I": <ore:sheetIron>, # Iron Sheet
});

# [Orbital Laser Drill] from [Exquisite Emerald][+6]
recipes.removeByRecipeName("advancedrocketry:spacelaser");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:advstructuremachine:0>,    # Advanced Machine Structure
		<ore:gemExquisiteEmerald>,
		<ore:circuitEv>*2,
		<ore:gearTungstenSteel>*2,
		<advancedrocketry:misc:0>,   # User Interface
		<advancedrocketry:ic:1>,   # Tracking Circuit
		<metaitem:energy.lapotronic_orb>
	).outputs(<advancedrocketry:spacelaser>)
.duration(1200).EUt(1200).buildAndRegister();

# [Seat] from [Crude Steel Plate][+1]
recipes.removeByRecipeName("advancedrocketry:genericseat");
craft.make(<advancedrocketry:seat>, ["pretty",
  "     ",
  "w □ w"], {
  "w": <ore:wool>,
  "□": <ore:plateCrudeSteel>,
});

# [Fuel Pump] from [Glass Tube][+3]
<recipemap:assembler>.recipeBuilder()
	.inputs(
  		<ore:springSmallAluminium>,   # Small Aluminium Spring
  		<metaitem:component.glass.tube>,   # Glass Tube
  		<ore:wireFineAnnealedCopper>*8, # Fine Annealed Copper Wire
  		<metaitem:electric.pump.mv>   # MV Electric Pump
).outputs(<contenttweaker:fuel_pump>)
.duration(100).EUt(24).buildAndRegister();

# [Monopropellant Rocket Engine] from [Crude Steel Screw][+3]
<recipemap:ulv_assembler>.recipeBuilder()
	.inputs(
		<ore:ringCrudeSteel>*2,
		<ore:screwCrudeSteel>*4,
		<contenttweaker:fuel_pump>,
		<ore:sheetCrudeSteel>*4
	).outputs(<advancedrocketry:rocketmotor>)
.duration(400).EUt(12).buildAndRegister();

<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:1}))
	.inputs(
		<ore:ringSteel>,
		<ore:screwSteel>,
		<ore:stickSteel>*2,
		<ore:sheetSteel>*4
	).outputs(<advancedrocketry:rocketmotor>)
.duration(100).EUt(24).buildAndRegister();

# [Bipropellant Rocket Engine] from [Titanium Screw][+3]
recipes.removeByRecipeName("advancedrocketry:bipropellantengine");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:1}))
	.inputs(
		<ore:ringTitanium>,
		<ore:screwTitanium>,
		<ore:stickTitanium>*2,
		<ore:sheetSteel>*4
	).outputs(<advancedrocketry:bipropellantrocketmotor>)
.duration(200).EUt(1024).buildAndRegister();

# [Advanced Monopropellant Rocket Engine] from [Aluminium Spring][+3]
recipes.removeByRecipeName("advancedrocketry:advengine");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:2}))
	.inputs(
		<ore:gearAluminium>,
		<ore:springAluminium>,
		<ore:stickLongTitanium>*2,
		<ore:sheetTitaniumIridium>*4
	).outputs(<advancedrocketry:advrocketmotor>)
.duration(200).EUt(1024).buildAndRegister();

# [Advanced Bipropellant Rocket Engine] from [Aluminium Spring][+3]
recipes.removeByRecipeName("advancedrocketry:advbipropellantengine");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:2}))
	.inputs(
		<ore:gearAluminium>,
		<ore:springAluminium>,
		<ore:stickLongIridium>*2,
		<ore:sheetTitaniumAluminide>*4
	).outputs(<advancedrocketry:advbipropellantrocketmotor>)
.duration(200).EUt(1024).buildAndRegister();

# [Nuclear Thermal Rocket Engine] from [Europium Spring][+2]
recipes.removeByRecipeName("advancedrocketry:nuclearengine");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:2}))
	.inputs(
		<ore:springEuropium>*2,
		<ore:stickLongIridium>*2,
		<ore:sheetTitaniumAluminide>*4
	).outputs(<advancedrocketry:nuclearrocketmotor>)
.duration(500).EUt(4096).buildAndRegister();

# [Monopropellant Fuel Tank] from [Double Crude Steel Plate][+2]
recipes.removeByRecipeName("crafttweaker:[monopropellant fuel tank] from [double crude steel plate][+2]");
<recipemap:ulv_assembler>.recipeBuilder()
	.inputs(
		<ore:plateDoubleCrudeSteel>*2,
		<ore:ringCrudeSteel>*3,
		<ore:stickCrudeSteel>*4
	).outputs(<advancedrocketry:fueltank>)
.duration(400).EUt(12).buildAndRegister();
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:3}))
	.inputs(
		<ore:plateDoubleSteel>*2,
		<ore:ringSteel>*3,
		<ore:stickSteel>*4
	).outputs(<advancedrocketry:fueltank>)
.duration(100).EUt(24).buildAndRegister();

# [Bipropellant Fuel Tank] from [Double Stainless Steel Plate][+2]
recipes.removeByRecipeName("advancedrocketry:blockbipropellantfueltank");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:3}))
	.inputs(
		<ore:plateDoubleStainlessSteel>*2,
		<ore:ringStainlessSteel>*3,
		<ore:stickStainlessSteel>*4
	).outputs(<advancedrocketry:bipropellantfueltank>)
.duration(400).EUt(512).buildAndRegister();

# [Oxidizer Fuel Tank] from [Double Stainless Steel Plate][+2]
recipes.removeByRecipeName("advancedrocketry:blockoxidizerfueltank");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:13}))
	.inputs(
		<ore:plateDoubleStainlessSteel>*2,
		<ore:ringStainlessSteel>*3,
		<ore:stickStainlessSteel>*4
	).outputs(<advancedrocketry:oxidizerfueltank>)
.duration(400).EUt(512).buildAndRegister();

# [Nuclear Thermal Working Fluid Tank] from [Double Europium Plate][+2]
recipes.removeByRecipeName("advancedrocketry:blocknuclearfueltank");
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:3}))
	.inputs(
		<ore:plateDoubleEuropium>*2,
		<ore:springEuropium>*3,
		<ore:stickEuropium>*4
	).outputs(<advancedrocketry:nuclearfueltank>)
.duration(500).EUt(4096).buildAndRegister();

# [Nuclear Thermal Fission Core] from [Naquadah Coil Block][+2]
<recipemap:assembly_line>.recipeBuilder()
	.inputs(
		<gregtech:wire_coil:5>, # Naquadah Coil Block
		<ore:circuitLuv>*4,
		<metaitem:battery.re.hv.cadmium>*4,
		<ore:blockLead>*16
	).outputs(<advancedrocketry:nuclearcore>)
.duration(600).EUt(6128).buildAndRegister();

# [Guidance Computer] from [Machine Structure][+5]
<recipemap:ulv_assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
//		<metaitem:electric.motor.ulv>,
		<ore:circuitLv>*2,
		<ore:gearSilver>*2
//		<ore:plateSilver>*2
	).outputs(<advancedrocketry:guidancecomputer>)
.duration(400).EUt(12).buildAndRegister();
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
//		<metaitem:electric.motor.lv>,
		<ore:circuitLv>*2,
		<ore:gearSilver>*2
//		<ore:plateSilver>*2
	).outputs(<advancedrocketry:guidancecomputer>)
.duration(100).EUt(24).buildAndRegister();

# [Gas Intake] from [Advanced Gas Collector III][+2]
recipes.removeByRecipeName("advancedrocketry:intake");
craft.make(<advancedrocketry:intake>, ["pretty",
  "╱ T ╱",
  "T A T",
  "╱ T ╱"], {
  "╱": <ore:stickTitanium>,
  "T": <ore:pipeTinyFluidTitanium>,
  "A": <metaitem:gregtech:gas_collector.ev>,
});

# [Drill] from [Advanced Machine Structure][+3]
recipes.removeByRecipeName("advancedrocketry:drill");
craft.make(<advancedrocketry:drill>, ["pretty",
  "  H  ",
  "F ⌂ F",
  "F E F"], {
  "H": <ore:toolHeadDrillTungstenCarbide>,
  "F": <ore:wireFineRedAlloy>,
  "⌂": <libvulpes:advstructuremachine:0>,             # Advanced Machine Structure
  "E": <metaitem:sensor.ev>,         # EV Sensor
});

# [Rocket Assembling Machine] from [Machine Structure][+5]
<recipemap:ulv_assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<metaitem:conveyor.module.ulv>,
//		<ore:circuitLv>*2,
		<ore:gearCrudeSteel>*2
//		<ore:plateSilver>*2
	).outputs(<advancedrocketry:rocketbuilder>)
.duration(400).EUt(12).buildAndRegister();
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<metaitem:conveyor.module.lv>,
//		<ore:circuitLv>*2,
		<ore:gearSteel>*2
//		<ore:plateSilver>*2
	).outputs(<advancedrocketry:rocketbuilder>)
.duration(100).EUt(24).buildAndRegister();

# [Space Station Assembler] from [Advanced Machine Structure][+7]
recipes.removeByRecipeName("advancedrocketry:stationbuilder");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:advstructuremachine:0>, # Advanced Machine Structure
		<advancedrocketry:misc:0>,         # User Interface
		<ore:circuitEv>*2,
		<metaitem:robot.arm.ev>,
		<metaitem:conveyor.module.ev>,
		<metaitem:electric.motor.ev>,
		<ore:toolHeadBuzzSawBlackBronze>,
		<ore:dustCadmium>
	).outputs(<advancedrocketry:stationbuilder>)
.duration(1200).EUt(1200).buildAndRegister();

# [Unmanned Vehicle Assembler] from [Advanced Machine Structure][+7]
recipes.removeByRecipeName("advancedrocketry:deployablerocketbuilder");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:advstructuremachine:0>, # Advanced Machine Structure
		<advancedrocketry:misc:0>,         # User Interface
		<metaitem:robot.arm.ev>,
		<ore:circuitEv>,
		<metaitem:conveyor.module.ev>,
		<metaitem:electric.motor.ev>,
		<ore:toolHeadBuzzSawBlackBronze>,
		<ore:gearAluminium>*2
	).outputs(<advancedrocketry:deployablerocketbuilder>)
.duration(1200).EUt(1200).buildAndRegister();

# [Guidance Computer Access Hatch] from [Machine Structure][+2]
recipes.removeByRecipeName("advancedrocketry:guidancecomputeraccesshatch");
craft.make(<advancedrocketry:loader:6>, ["pretty",
  "  L  ",
  "B M B",
  "  L  "], {
  "L": <ore:circuitLv>,
  "B": <ore:sheetBronze>,
  "M": <libvulpes:structuremachine:0>, # Machine Structure
});

# [Fueling station] from [Machine Structure][+5]
recipes.removeByRecipeName("advancedrocketry:fuelingstation");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<enderio:block_tank>,
		<metaitem:electric.pump.lv>,
		<ore:fanSteel>,
		<ore:foilRubber>*2,
		<ore:sheetTin>*3
	).outputs(<advancedrocketry:fuelingstation>)
.duration(200).EUt(24).buildAndRegister();

# [Rocket Monitoring Station] from [Machine Structure][+5]
recipes.removeByRecipeName("advancedrocketry:monitoringstation");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>, # User Interface
		<metaitem:sensor.mv>,
		<metaitem:battery.re.mv.lithium>,
		<ore:sheetBronze>,
		<ore:sheetCopper>*4
	).outputs(<advancedrocketry:monitoringstation>)
.duration(400).EUt(64).buildAndRegister();

# [Satellite Terminal] from [Machine Structure][+5]
recipes.removeByRecipeName("advancedrocketry:satellitecontrolcenter");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<metaitem:battery.re.mv.lithium>,
		<metaitem:sensor.mv>*2,
		<ore:circuitMv>*2,
		<ore:sheetCopper>*2
	).outputs(<advancedrocketry:satellitecontrolcenter>)
.duration(400).EUt(64).buildAndRegister();

# [Warp Controller] from [Advanced Machine Structure][+3]
recipes.removeByRecipeName("advancedrocketry:warpmonitor");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:advstructuremachine:0>,  # Advanced Machine Structure
		<advancedrocketry:misc:0>, # User Interface
		<ore:circuitLuv>*3,
		<ore:plateHsss>*4
	).outputs(<advancedrocketry:warpmonitor>)
.duration(500).EUt(6128).buildAndRegister();

# [Orientation Controller] from [Machine Structure][+2]
recipes.removeByRecipeName("advancedrocketry:orientationcontroller");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<minecraft:compass>
	).outputs(<advancedrocketry:orientationcontroller>)
.duration(200).EUt(200).buildAndRegister();

# [Station Gravity Controller] from [Machine Structure][+2]
recipes.removeByRecipeName("advancedrocketry:gravitycontroller");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<ore:blockEnchantedGravitite>
	).outputs(<advancedrocketry:gravitycontroller>)
.duration(200).EUt(200).buildAndRegister();

# [Altitude Controller] from [Machine Structure][+2]
recipes.removeByRecipeName("advancedrocketry:altitudecontroller");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<libvulpes:structuremachine:0>, # Machine Structure
		<advancedrocketry:misc:0>,      # User Interface
		<minecraft:shulker_shell>
	).outputs(<advancedrocketry:altitudecontroller>)
.duration(200).EUt(200).buildAndRegister();

# [Planet Selector] from [Machine Structure][+4]
craft.remake(<advancedrocketry:planetselector>, ["pretty",
  "T V T",
  "M a M",
  "T C T"], {
  "T": <advancedrocketry:ic:1>,      # Tracking Circuit
  "V": <metaitem:sensor.mv>,
  "M": <ore:circuitMv>,
  "a": <libvulpes:structuremachine:0>, # Machine Structure
  "C": <advancedrocketry:satelliteprimaryfunction:1>, # Composition Sensor
});

# [Holographic Planet Selector] from [Machine Structure][+4]
recipes.removeByRecipeName("advancedrocketry:planetholoselector");
craft.make(<advancedrocketry:planetholoselector>, ["pretty",
  "T H T",
  "M a M",
  "T C T"], {
  "T": <advancedrocketry:ic:1>,      # Tracking Circuit
  "H": <libvulpes:holoprojector>,    # Holo-Projector
  "M": <ore:circuitMv>,              # Good Electronic Circuit
  "a": <libvulpes:structuremachine>, # Machine Structure
  "C": <advancedrocketry:satelliteprimaryfunction:1>, # Composition Sensor
});

# [CO2 Scrubber] from [ULV Electric Motor][+3]
recipes.removeByRecipeName("advancedrocketry:oxygenscrubber");
craft.make(<advancedrocketry:oxygenscrubber>, ["pretty",
  "I S I",
  "I U I",
  "I © I"], {
  "I": <ore:barsIron>,               # Iron Bars
  "S": <ore:fanSteel>,               # Steel Fan
  "U": <metaitem:electric.motor.ulv>, # ULV Electric Motor
  "©": <ore:dustCoal>,               # Coal Dust
});

# [Oxygen Vent] from [MV Electric Motor][+3]
recipes.removeByRecipeName("advancedrocketry:oxygenvent");
craft.make(<advancedrocketry:oxygenvent>, ["pretty",
  "I S I",
  "I V I",
  "I M I"], {
  "I": <ore:barsIron>,              # Iron Bars
  "S": <ore:fanSteel>,              # Steel Fan
  "V": <metaitem:electric.motor.mv>,  # MV Electric Motor
  "M": <advancedrocketry:fueltank>, # Monopropellant Fuel Tank
});

# [Gas Charge Pad] from [Monopropellant Fuel Tank][+3]
recipes.removeByRecipeName("advancedrocketry:oxygencharger");
craft.make(<advancedrocketry:oxygencharger>, ["pretty",
  "     ",
  "I I I",
  "o M U"], {
  "I": <ore:barsIron>,               # Iron Bars
  "o": <metaitem:drum.bronze>,  # Monopropellant Fuel Tank
  "M": <libvulpes:structuremachine>, # Machine Structure
  "U": <metaitem:electric.pump.ulv>, # ULV Electric Pump
});

# [Atmosphere Detector] from [Machine Structure][+5]
recipes.removeByRecipeName("advancedrocketry:oxygendetection");
craft.make(<advancedrocketry:oxygendetection>, ["pretty",
  "S L S",
  "I M t",
  "S v S"], {
  "S": <ore:sheetSteel>,             # Steel Sheet
  "L": <metaitem:sensor.lv>,   # LV Sensor
  "I": <ore:barsIron>,               # Iron Bars
  "M": <libvulpes:structuremachine>, # Machine Structure
  "t": <ore:fanSteel>,               # Steel Fan
  "v": <ore:circuitLv>,              # Electronic Circuit
});

# [Motor] from [Machine Structure][+1]
recipes.removeByRecipeName("libvulpes:basicmotor");
craft.shapeless(<libvulpes:motor>, "MV", {
  "M": <libvulpes:structuremachine>, # Machine Structure
  "V": <metaitem:electric.motor.mv>,   # MV Electric Motor
});

# [Advanced Motor] from [Machine Structure][+1]
recipes.removeByRecipeName("libvulpes:advancedmotor");
craft.shapeless(<libvulpes:advancedmotor>, "MH", {
  "M": <libvulpes:structuremachine>, # Machine Structure
  "H": <gregtech:meta_item_1:129>,   # HV Electric Motor
});

# [Enhanced Motor] from [Advanced Machine Structure][+1]
recipes.removeByRecipeName("libvulpes:enhancedmotor");
craft.shapeless(<libvulpes:enhancedmotor>, "⌂E", {
  "⌂": <libvulpes:advstructuremachine:0>,     # Advanced Machine Structure
  "E": <metaitem:electric.motor.ev>, # EV Electric Motor
});

# [Elite Motor] from [Advanced Machine Structure][+1]
recipes.removeByRecipeName("libvulpes:elitemotor");
craft.shapeless(<libvulpes:elitemotor>, "⌂I", {
  "⌂": <libvulpes:advstructuremachine:0>,     # Advanced Machine Structure
  "I": <gregtech:meta_item_1:131>, # IV Electric Motor
});

# [Gold Coil] from [Neutronium Wrench][+1]
recipes.removeByRecipeName("advancedrocketry:coilgold");
craft.make(<libvulpes:coil0:2>, ["pretty",
  "G G G",
  "G T G",
  "G G G"], {
  "G": <ore:wireGtDoubleGold>, # 2x Gold Wire
  "T": <ore:craftingToolWrench>, # Neutronium Wrench
});
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:8}))
	.inputs(<ore:wireGtDoubleGold>*8)
	.outputs(<libvulpes:coil0:2>)
.duration(600).EUt(24).buildAndRegister();

# [Copper Coil] from [Neutronium Wrench][+1]
recipes.removeByRecipeName("advancedrocketry:coilcopper");
craft.make(<libvulpes:coil0:4>, ["pretty",
  "G G G",
  "G T G",
  "G G G"], {
  "G": <ore:wireGtDoubleCopper>, # 2x Copper Wire
  "T": <ore:craftingToolWrench>, # Neutronium Wrench
});
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:8}))
	.inputs(<ore:wireGtDoubleCopper>*8)
	.outputs(<libvulpes:coil0:4>)
.duration(600).EUt(24).buildAndRegister();

# [Titanium Coil] from [Neutronium Wrench][+1]
recipes.removeByRecipeName("advancedrocketry:coiltitanium");
craft.make(<libvulpes:coil0:7>, ["pretty",
  "S S S",
  "S T S",
  "S S S"], {
  "S": <ore:pipeSmallFluidTitanium>, # Small Titanium Fluid Pipe
  "T": <ore:craftingToolWrench>, # Neutronium Wrench
});
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:8}))
	.inputs(<ore:pipeSmallFluidTitanium>*8)
	.outputs(<libvulpes:coil0:7>)
.duration(600).EUt(24).buildAndRegister();

# [Aluminum Coil] from [Neutronium Wrench][+1]
recipes.removeByRecipeName("advancedrocketry:coilaluminum");
craft.make(<libvulpes:coil0:9>, ["pretty",
  "G G G",
  "G T G",
  "G G G"], {
  "G": <ore:wireGtDoubleAluminium>, # 2x Aluminium Wire
  "T": <ore:craftingToolWrench>, # Neutronium Wrench
});
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:8}))
	.inputs(<ore:wireGtDoubleAluminium>*8)
	.outputs(<libvulpes:coil0:9>)
.duration(600).EUt(24).buildAndRegister();

# [Iridium Coil] from [Neutronium Wrench][+1]
recipes.removeByRecipeName("advancedrocketry:coiliridium");
craft.make(<libvulpes:coil0:10>, ["pretty",
  "S S S",
  "S T S",
  "S S S"], {
  "S": <ore:pipeSmallFluidIridium>, # Small Iridium Fluid Pipe
  "T": <ore:craftingToolWrench>, # Neutronium Wrench
});
<recipemap:assembler>.recipeBuilder()
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:8}))
	.inputs(<ore:pipeSmallFluidIridium>*8)
	.outputs(<libvulpes:coil0:10>)
.duration(600).EUt(24).buildAndRegister();

# [Padded Landing Boots] from [White Wool][+1]
<recipemap:assembler>.recipeBuilder()
	.inputs(<ore:wool>*2, <ore:springSmallSteel>*2)
	.outputs(<advancedrocketry:itemupgrade:3>)
.duration(400).EUt(24).buildAndRegister();

# [Bionic Leg Upgrade] from [LV Electric Piston][+2]
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:electric.piston.lv>,
		<ore:springSteel>,
		<ore:wool>*4
	).outputs(<advancedrocketry:itemupgrade:2>)
.duration(400).EUt(24).buildAndRegister();

# [Earthbright Visor] from [Steel Screw][+3]
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:emitter.lv>,
		<ore:screwSteel>,
		<ore:stickSteel>*2,
		<ore:plateSapphire>*2
	).outputs(<advancedrocketry:itemupgrade:5>)
.duration(400).EUt(24).buildAndRegister();

# [Beacon Finder] from [Steel Screw][+3]
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:sensor.lv>,
		<ore:screwSteel>,
		<ore:stickSteel>*2,
		<ore:plateEmerald>*2
	).outputs(<advancedrocketry:beaconfinder>)
.duration(400).EUt(24).buildAndRegister();

# [Anti-Fog Visor] from [Steel Screw][+3]
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:sensor.lv>,
		<ore:screwSteel>,
		<ore:stickSteel>*2,
		<ore:plateRuby>*2
	).outputs(<advancedrocketry:itemupgrade:4>)
.duration(400).EUt(24).buildAndRegister();

# [Basic Solar Panel] from [Lapis Plate][+2]
recipes.removeByRecipeName("advancedrocketry:basicsolarpanel");
<recipemap:electric_blast_furnace>.recipeBuilder()
	.inputs(<ore:plateSilver>*3, <ore:plateLapis>*3, <ore:plateSilicon>*3)
	.outputs(<advancedrocketry:satellitepowersource>)
.duration(200).EUt(108).buildAndRegister();

# [Large Solar Panel] from [Basic Solar Panel]
recipes.removeByRecipeName("advancedrocketry:largesolarpanel");
<recipemap:assembler>.recipeBuilder()
	.inputs(<advancedrocketry:satellitepowersource>*9)
	.outputs(<advancedrocketry:satellitepowersource:1>)
.duration(200).EUt(64).buildAndRegister();

# [Satellite Id Chip] from [Good Electronic Circuit][+3]
recipes.removeByRecipeName("advancedrocketry:satelliteidchip");
<recipemap:alloy_smelter>.recipeBuilder()
	.inputs(<ore:circuitMv>, <ore:dyeBlue>)
	.outputs(<advancedrocketry:satelliteidchip>)
.duration(200).EUt(64).buildAndRegister();

# [Planet Id Chip] from [Circuit Board][+5]
<recipemap:ulv_assembler>.recipeBuilder()
	.inputs(
		<metaitem:circuit_board.basic>, # Circuit Board
//		<ore:circuitUlv>,
		<projecte:item.pe_covalence_dust>*4, # Glowstone Dust
		<ore:componentResistor>*2,
		<ore:cableGtSingleGreenCrystalAlloy>*2|<metaitem:cableGtSingleRedAlloy>*2
//		<ore:dustGlowstone>*2
	).outputs(<advancedrocketry:planetidchip>)
.duration(400).EUt(12).buildAndRegister();

# [Planet Id Chip] from [Good Electronic Circuit][+1]
<recipemap:alloy_smelter>.recipeBuilder()
	.inputs(<ore:circuitMv>, <ore:dyeLime>)
	.outputs(<advancedrocketry:planetidchip>)
.duration(400).EUt(24).buildAndRegister();

# [Asteroid Chip] from [Good Electronic Circuit][+1]
recipes.removeByRecipeName("advancedrocketry:asteroidchip");
<recipemap:alloy_smelter>.recipeBuilder()
	.inputs(<ore:circuitMv>, <ore:dyePurple>)
	.outputs(<advancedrocketry:asteroidchip>)
.duration(400).EUt(24).buildAndRegister();

# [Space Station Id Chip] from [Processor Assembly][+1]
recipes.removeByRecipeName("advancedrocketry:spacestationidchip");
<recipemap:alloy_smelter>.recipeBuilder()
	.inputs(<ore:circuitHv>, <ore:dyeGray>)
	.outputs(<advancedrocketry:spacestationchip>)
.duration(400).EUt(256).buildAndRegister();

# [Tracking Circuit] from [Good Electronic Circuit][+1]
<recipemap:alloy_smelter>.recipeBuilder()
	.inputs(<ore:circuitMv>, <metaitem:sensor.mv>)
	.outputs(<advancedrocketry:ic:1>)
.duration(400).EUt(64).buildAndRegister();

# [Ore Mapper] from [Good Electronic Circuit][+4]
recipes.removeByRecipeName("advancedrocketry:oremapper");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:sensor.mv>,
		<metaitem:electric.motor.mv>,
		<ore:circuitMv>,
		<ore:dustEnderPearl>*2,
		<ore:sheetIron>*4
	).outputs(<advancedrocketry:satelliteprimaryfunction:4>)
.duration(400).EUt(64).buildAndRegister();

# [Mass Detector] from [Gallium Arsenide Dust][+3]
recipes.removeByRecipeName("advancedrocketry:massdetector");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:sensor.mv>*2,
		<ore:dustGalliumArsenide>,
		<ore:circuitMv>,
		<metaitem:wafer.silicon>*2 # Silicon Wafer
	).outputs(<advancedrocketry:satelliteprimaryfunction:2>)
.duration(400).EUt(64).buildAndRegister();

# [Composition Sensor] from [Platinum Dust][+3]
recipes.removeByRecipeName("advancedrocketry:compositionsensor");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:sensor.mv>*2,
		<ore:dustPlatinum>,
		<ore:circuitMv>,
		<metaitem:wafer.silicon>*2 # Silicon Wafer
	).outputs(<advancedrocketry:satelliteprimaryfunction:1>)
.duration(400).EUt(64).buildAndRegister();

# [Single Battery] from [Small Battery Hull][+2]
recipes.removeByRecipeName("libvulpes:battery");
<recipemap:canner>.recipeBuilder()
	.inputs(
		<metaitem:battery.hull.lv>,
		<ore:dustRedstoneAlloy>*2
	).outputs(<libvulpes:battery>)
.duration(100).EUt(2).buildAndRegister();

<recipemap:extractor>.recipeBuilder()
	.inputs(<libvulpes:battery>)
	.outputs(<metaitem:battery.hull.lv>)
.duration(400).EUt(2).buildAndRegister();

# [Seal Detector] from [Tin Rotor][+3]
recipes.removeByRecipeName("advancedrocketry:sealdetector");
craft.make(<advancedrocketry:sealdetector>, ["pretty",
  "╱   ╱",
  "╱ i ╱",
  "T L T"], {
  "╱": <ore:stickIronMagnetic>,
  "i": <ore:rotorTin>,
  "T": <ore:sheetTin>,
  "L": <ore:circuitLv>,
});

# [User Interface] from [Integrated Logic Circuit][+3]
recipes.removeByRecipeName("crafttweaker:[user interface] from [glass pane][+3]");
craft.make(<advancedrocketry:misc>, ["pretty",
  "     ",
  "F L F",
  "▲ G ▲"], {
  "F": <ore:wireFineRedAlloy>,
  "L": <ore:circuitLv>,
  "▲": <ore:dustGlowstone>,
  "G": <ore:paneGlassColorless>,
});

# [Optical Sensor] from [MV Sensor][+1]
recipes.removeByRecipeName("advancedrocketry:opticalsensor");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<metaitem:sensor.mv>,
		<ore:paneGlassBlack>*8
	).outputs(<advancedrocketry:satelliteprimaryfunction:0>)
.duration(400).EUt(64).buildAndRegister();

# [Atmosphere Analyzer] from [User Interface][+3]
craft.make(<advancedrocketry:atmanalyser>, ["pretty",
  "H    ",
  "v U A",
  "A A A"], {
  "H": <metaitem:sensor.hv>,
  "v": <ore:circuitHv>,
  "U": <advancedrocketry:misc:0>, # User Interface
  "A": <ore:sheetAluminium>,
});

# [Data Storage Unit] from [Red Alloy Foil][+5]
<recipemap:circuit_assembler>.recipeBuilder()
	.inputs(
		<gregtech:meta_item_1:402>, # Good Circuit Board
		<ore:componentTransistor>,
		<ore:componentCapacitor>,
		<ore:plateSilicon>,
		<ore:foilRedAlloy>,
		<ore:plateRubber>
	).outputs(<advancedrocketry:dataunit>)
.duration(200).EUt(24).buildAndRegister();

# [Satellite] from [Good Electronic Circuit][+2]
recipes.removeByRecipeName("advancedrocketry:satellite");
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<ore:circuitMv>,
		<ore:stickChrome>*2,
		<ore:plateAluminium>*6
	).outputs(<advancedrocketry:satellite>)
.duration(600).EUt(64).buildAndRegister();

# [Holo-Projector] from [LV Emitter][+2]
recipes.removeByRecipeName("advancedrocketry:holoprojector");
craft.make(<libvulpes:holoprojector>, ["pretty",
  "     ",
  "  L  ",
  "T G T"], {
  "L": <metaitem:emitter.lv>, # LV Emitter
  "T": <ore:sheetTin>,             # Tin Sheet
  "G": <ore:sheetGold>,            # Gold Sheet
});

# [Linker] from [Redstone Torch][+2]
recipes.removeByRecipeName("libvulpes:linker");
craft.make(<libvulpes:linker>, ["pretty",
  "    ♥",
  "G G G",
  "T T T"], {
  "♥": <ore:craftingRedstoneTorch>,
  "G": <ore:sheetGold>,
  "T": <ore:sheetTin>,
});

# [Jackhammer] from [MV Electric Piston][+3]
recipes.removeByRecipeName("advancedrocketry:jackhammer");
craft.make(<advancedrocketry:jackhammer>, ["pretty",
  "  □ ╱",
  "╱ M □",
  "¤ ╱  "], {
  "□": <ore:platePotin>,
  "╱": <ore:stickCobalt>,
  "M": <metaitem:electric.piston.mv>,
  "¤": <ore:gearDiamond>,
});

# [Titanium Aluminide Sheet] from [Titanium Aluminide Plate][+1]
craft.make(<advancedrocketry:productsheet>, ["pretty",
  "   ",
  "T □"], {
  "T": <ore:craftingToolSaw>,
  "□": <ore:plateTitaniumAluminide>,
});
<recipemap:cutter>.recipeBuilder()
	.inputs(<ore:plateTitaniumAluminide>)
	.fluidInputs(<liquid:lubricant>*1)
	.outputs(<advancedrocketry:productsheet>*2)
.duration(200).EUt(7).buildAndRegister();

# [Titanium Iridium Alloy Sheet] from [Titanium Iridium Alloy Plate][+1]
craft.make(<advancedrocketry:productsheet:1>, ["pretty",
  "   ",
  "T □"], {
  "T": <ore:craftingToolSaw>,
  "□": <ore:plateTitaniumIridium>,
});
<recipemap:cutter>.recipeBuilder()
	.inputs(<ore:plateTitaniumIridium>)
	.fluidInputs(<liquid:lubricant>*1)
	.outputs(<advancedrocketry:productsheet:1>*2)
.duration(200).EUt(7).buildAndRegister();

# [Titanium Aluminide Plate] from [Neutronium Hammer][+1]
craft.make(<advancedrocketry:productplate>, ["pretty",
  "  T",
  "  ▬",
  "  ▬"], {
  "T": <ore:craftingToolHardHammer>,
  "▬": <ore:ingotTitaniumAluminide>,
});
<recipemap:bender>.recipeBuilder()
	.inputs(<ore:ingotTitaniumAluminide>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:1}))
	.outputs(<advancedrocketry:productplate>)
.duration(196).EUt(24).buildAndRegister();

# [Titanium Iridium Alloy Plate] from [Neutronium Hammer][+1]
craft.make(<advancedrocketry:productplate:1>, ["pretty",
  "  T",
  "  ▬",
  "  ▬"], {
  "T": <ore:craftingToolHardHammer>,
  "▬": <ore:ingotTitaniumIridium>,
});
<recipemap:bender>.recipeBuilder()
	.inputs(<ore:ingotTitaniumIridium>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration:1}))
	.outputs(<advancedrocketry:productplate:1>)
.duration(196).EUt(24).buildAndRegister();

# [Titanium Aluminide Dust] from [Titanium Dust]*5[+1]
<recipemap:mixer>.recipeBuilder()
	.inputs(<ore:dustTitanium>*5, <ore:dustAluminium>*3)
	.outputs(<advancedrocketry:productdust>)
.duration(160).EUt(1024).buildAndRegister();

# [Titanium Iridium Alloy Dust] from [Titanium Dust]*5[+1]
<recipemap:mixer>.recipeBuilder()
	.inputs(<ore:dustTitanium>*5, <ore:dustIridium>*3)
	.outputs(<advancedrocketry:productdust:1>)
.duration(160).EUt(1024).buildAndRegister();

# [Titanium Aluminide Rod] from [Titanium Aluminide Ingot][+1]
recipes.removeByRecipeName("advancedrocketry:sticktitaniumaluminide");
craft.make(<advancedrocketry:productrod>, ["pretty",
  "T  ",
  "  ▬"], {
  "T": <ore:craftingToolFile>,
  "▬": <ore:ingotTitaniumAluminide>,
});
<recipemap:lathe>.recipeBuilder().inputs(<ore:ingotTitaniumAluminide>)
	.outputs(<advancedrocketry:productrod>*2)
.duration(196).EUt(24).buildAndRegister();

# [Titanium Iridium Alloy Rod] from [Titanium Iridium Alloy Ingot][+1]
recipes.removeByRecipeName("advancedrocketry:sticktitaniumiridium");
craft.make(<advancedrocketry:productrod:1>, ["pretty",
  "T  ",
  "  ▬"], {
  "T": <ore:craftingToolFile>,
  "▬": <ore:ingotTitaniumIridium>,
});
<recipemap:lathe>.recipeBuilder().inputs(<ore:ingotTitaniumIridium>)
	.outputs(<advancedrocketry:productrod:1>*2)
.duration(196).EUt(24).buildAndRegister();

# [Titanium Aluminide Gear] from [Neutronium Wrench][+2]
recipes.removeByRecipeName("advancedrocketry:geartitaniumaluminide");
craft.make(<advancedrocketry:productgear>, ["pretty",
  "╱ □ ╱",
  "□ T □",
  "╱ □ ╱"], {
  "╱": <ore:stickTitaniumAluminide>,
  "□": <ore:plateTitaniumAluminide>,
  "T": <ore:craftingToolWrench>,
});
<recipemap:extruder>.recipeBuilder()
	.inputs(<ore:ingotTitaniumAluminide>*4)
	.notConsumable(<metaitem:shape.extruder.gear>)
	.outputs(<advancedrocketry:productgear>)
.duration(1200).EUt(60).buildAndRegister();

# [Titanium Iridium Alloy Gear] from [Neutronium Wrench][+2]
recipes.removeByRecipeName("advancedrocketry:geartitaniumiridium");
craft.make(<advancedrocketry:productgear:1>, ["pretty",
  "╱ □ ╱",
  "□ T □",
  "╱ □ ╱"], {
  "╱": <ore:stickTitaniumIridium>,
  "□": <ore:plateTitaniumIridium>,
  "T": <ore:craftingToolWrench>,
});
<recipemap:extruder>.recipeBuilder()
	.inputs(<ore:ingotTitaniumIridium>*4)
	.notConsumable(<metaitem:shape.extruder.gear>)
	.outputs(<advancedrocketry:productgear:1>)
.duration(1200).EUt(60).buildAndRegister();

##########################################################################################
print("==================== end of advanced_rocketry.zs ====================");
