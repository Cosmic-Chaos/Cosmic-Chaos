import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.industrialforegoing.SludgeRefiner;

print("==================== loading ulv_lv_station_recipes.zs ====================");
##########################################################################################

##=======================================================
## RECIPE REMOVAL
##=======================================================
val itemstoRemove =
[
	<quark:iron_button>,
	<quark:gold_button>,
	<industrialforegoing:petrified_fuel_generator>,
	<fossil:bio_goo>,
	<actuallyadditions:item_knife>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

var name_removals = [
    // Clay
    "gregtech:electric_motor_lv_iron",
] as string[];

for item in name_removals {
    recipes.removeByRecipeName(item);
}

##=======================================================
## HIDING ITEMS IN JEI
##=======================================================

val itemstoRemoveAndHide =
[
	<actuallyadditions:item_misc:2>, //Knife blade
	<actuallyadditions:item_misc:3>, //Knife handle

	<morefurnaces:upgrade:7>,
	<morefurnaces:upgrade:4>,
	<morefurnaces:upgrade:3>,
	<morefurnaces:upgrade:2>,
	<morefurnaces:upgrade:1>,
	<morefurnaces:upgrade>,
	
	<morefurnaces:furnaceblock:4>,
	<morefurnaces:furnaceblock:3>,
	<morefurnaces:furnaceblock:2>,
	<morefurnaces:furnaceblock:1>, // Furnace Stuff
]
 as IItemStack[];

for item in itemstoRemoveAndHide {
	mods.jei.JEI.removeAndHide(item);
}



##=======================================================
## JEI Changes
##=======================================================

//Space Suit with Oxygen
mods.jei.JEI.addItem(<advancedrocketry:spacechestplate>.withTag({slotInsert: [1, 1, 1, 1, 1, 1] as byte[] as byte[], size: 6, slotExtract: [1, 1, 1, 1, 1, 1] as byte[] as byte[], outputItems: [{Slot: 0 as byte, id: "advancedrocketry:pressuretank", Count: 1 as byte, tag: {Fluid: {FluidName: "oxygen", Amount: 7192}}, Damage: 3 as short}, {Slot: 1 as byte, id: "advancedrocketry:pressuretank", Count: 1 as byte, tag: {Fluid: {FluidName: "oxygen", Amount: 8000}}, Damage: 3 as short}]}));


<metaitem:battery_station_ulv>.addTooltip(format.red("Can not be recharged"));

##=======================================================
## ADD RECIPES
##=======================================================

//Busses because no wood
recipes.addShaped(<metaitem:item_bus.export.ulv>, [[<metaitem:hull.ulv>], [<ironchest:iron_chest:*>]]);
recipes.addShaped(<metaitem:item_bus.import.ulv>, [[<ironchest:iron_chest:*>],[<metaitem:hull.ulv>]]);


//Knife
recipes.addShapeless(<actuallyadditions:item_knife>, [<ore:craftingToolKnife>]);

//No Stone Buttons
recipes.addShaped(<quark:iron_button>, [[<ore:gtceHardHammers>],[<minecraft:iron_ingot>]]);
recipes.addShaped(<quark:gold_button>, [[<ore:gtceHardHammers>],[<minecraft:gold_ingot>]]);


# [Makeshift Crowbar] from [Tin Plate][+2]
craft.remake(<contenttweaker:crowbar>, ["pretty",
  "  □ □",
  "  ╱  ",
  "╱ п  "], {
  "□": <ore:plateIron>,   # Iron Plate
  "╱": <ore:stickCopper>, # Copper Rod
  "п": <ore:plateTin>,    # Tin Plate
});

# [Crowbar] from [Bronze Rod][+1]
craft.remake(<contenttweaker:crowbar_t2>, ["pretty",
  "  □ □",
  "  ╱  ",
  "╱ □  "], {
  "□": <metaitem:plateWroughtIron>,   # Iron Plate
  "╱": <ore:stickBronze>, # Bronze Rod
});


# [Derelict Casing] from [Wrought Iron Frame Box][+3]
craft.remake(<contenttweaker:station_casing>*2, ["pretty",
  "P o P",
  "P ◙ P",
  "P T P"], {
  "P": <contenttweaker:station_component_1> | <contenttweaker:station_component_2>, # Plating Component
  "o": <ore:gtceHardHammers>, # Neutronium Hammer
  "◙": <ore:frameGtWroughtIron>,                   # Wrought Iron Frame Box
  "T": <ore:gtceWrenches>, # Neutronium Wrench
});

# [Derelict Casing] from [Crude Steel Frame Box][+3]
craft.remake(<contenttweaker:station_casing>*4, ["pretty",
  "□ o □",
  "□ ◙ □",
  "□ T □"], {
  "□": <ore:plateCrudeSteel>,       # Crude Steel Plate
  "o": <ore:gtceHardHammers>, # Iron Hammer
  "◙": <metaitem:frameCrudeSteel>, # Crude Steel Frame Box
  "T": <ore:gtceWrenches>, # Neutronium Wrench
});

# [Crafting Station] from [Steel Crate][+3]
craft.remake(<metaitem:workbench>, ["pretty",
  "E P",
  "r S"], {
  "E": <minecraft:book>, # Book
  "P": <contenttweaker:station_component_4>, # Primitive Crafting Interface
  "r": <contenttweaker:station_component_3>, # Primitive Mixed Plating
  "S": <ironchest:iron_chest:*>,              # Silver Chest
});




// Workbench 2nd Recipe
recipes.addShaped(<metaitem:workbench>, [
	[null, <minecraft:book>, null],
	[<ore:screwIron>, <ore:craftingTableWood>, <ore:screwIron>], 
	[null, <metaitem:plateDoubleBronze>, null]
]);

# [Plating Component]
recipes.addShapeless(<contenttweaker:station_component_1>, 
	[<ore:gtceHardHammers>,<metaitem:hull.plate.1>,<metaitem:hull.plate.1>,<metaitem:hull.plate.0>]
);

# [Plating Component]
recipes.addShapeless(<contenttweaker:station_component_2>, 
	[<ore:gtceHardHammers>,<metaitem:hull.plate.0>,<metaitem:hull.plate.0>,<metaitem:hull.plate.1>]
);

# [Primitive Mixed Plating]
recipes.addShapeless(<contenttweaker:station_component_3>, 
	[<ore:gtceWrenches>,<contenttweaker:station_component_2>,<contenttweaker:station_component_1>]
);

# [Primitive Crafting Interface]
recipes.addShapeless(<contenttweaker:station_component_4>, 
	[<ore:gtceScrewdrivers>,<contenttweaker:internals_t1>,<contenttweaker:internals_t1>,<contenttweaker:internals_t1>]
);

# [Copper Furnace] from [Neutronium Wrench][+1]
craft.remake(<morefurnaces:furnaceblock:5>, ["pretty",
  "P P P",
  "P T P",
  "P P P"], {
  "P": <contenttweaker:station_component_1>, # Plating Component
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});

# [Copper Furnace] from [Neutronium Wrench][+1]
craft.make(<morefurnaces:furnaceblock:5>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <ore:plateCopper>, # Copper Plate
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});

# [Iron Furnace] from [Neutronium Wrench][+1]
craft.remake(<morefurnaces:furnaceblock>, ["pretty",
  "P P P",
  "P T P",
  "P P P"], {
  "P": <contenttweaker:station_component_2>, # Plating Component
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});

# [Iron Furnace] from [Neutronium Wrench][+1]
craft.make(<morefurnaces:furnaceblock>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <ore:plateIron>, # Iron Plate
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});


# [Silver Furnace] from [Silver Wrench][+1]
craft.remake(<morefurnaces:furnaceblock:6>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <metaitem:plateSilver>, # Silver Plate
  "T": <ore:gtceHardHammers>, # Wrench
});
# [Small Pile of Glass Dust] from [Glass Shard][+1]
craft.reshapeless(<metaitem:dustSmallGlass>, "TG", {
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
  "G": <ore:shardGlass>, # Glass Shard
});

# [Vacuum Tube] from [Glass Tube][+2]
craft.remake(<metaitem:circuit.vacuum_tube>, ["pretty",
  "╱ l ╱",
  "G G G"], {
  "╱": <ore:stickWroughtIron>,     # Wrought Iron Rod
  "l": <gregtech:meta_item_1:517>, # Glass Tube
  "G": <ore:wireGtSingleCopper>,   # 1x Copper Wire
});

# [ULV Machine Hull] from [Wrought Iron Plate][+3]
craft.remake(<metaitem:hull.ulv>, ["pretty",
  "     ",
  "□ п □",
  "G ⌂ G"], {
  "□": <ore:plateCopper>,         # Copper Plate
  "п": <ore:plateWroughtIron>,    # Wrought Iron Plate
  "G": <ore:wireGtSingleTin>,     # 1x Tin Wire
  "⌂": <gregtech:machine_casing>, # ULV Machine Casing
});

# [Rail Frame]*2 from [Steel Screw][+2]
craft.remake(<industrialrenewal:frame> * 2, ["pretty",
  "╱ ◙ ╱",
  "S ◙ S",
  "╱ ◙ ╱"], {
  "╱": <ore:stickWroughtIron>,  # Wrought Iron Rod
  "◙": <ore:frameGtCrudeSteel>, # Crude Steel Frame Box
  "S": <ore:screwCrudeSteel>,        # Steel Screw
});

# [Crystal Battery] from [Low Covalence Dust][+2]
craft.remake(<devtech:meta_item:1>, ["pretty",
  "╳ * ╳",
  "* ▲ *",
  "╳ * ╳"], {
  "╳": <ore:wireFineGreenCrystalAlloy>,          # Fine Green Crystal Alloy Wire
  "*": <actuallyadditions:item_crystal_shard:4>, # Green Crystal Shard
  "▲": <metaitem:springSilver>,        # Low Covalence Dust
});


# [Saw Blade Assembly] from [Iron Buzzsaw Blade][+3]
craft.remake(<advancedrocketry:sawblade>, ["pretty",
  "╱   ╱",
  "I H I",
  "□   □"], {
  "╱": <ore:stickIron>,           # Iron Rod
  "I": <ore:screwIron>,           # Iron Screw
  "H": <ore:toolHeadBuzzSawIron>, # Iron Buzzsaw Blade
  "□": <ore:plateIron>,           # Iron Plate
});


# [Primitive Brewery] from [ULV Machine Hull][+5]
craft.remake(<gregtech:machine:32102>, ["pretty",
  "■ V ■",
  "* L *",
  "U T U"], {
  "■": <ore:blockGlassColorless>, # Glass
  "V": <metaitem:electric.pump.ulv>,   # ULV Electric Pump
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "L": <metaitem:hull.ulv>,               # ULV Machine Hull
  "U": <metaitem:circuit.vacuum_tube>,                     # Vacuum Tube
  "T": <ore:springTin>,                      # Tin Spring
});


# [LV Machine Casing] from [Neutronium Wrench (HV)][+1]
craft.make(<gregtech:machine_casing:1>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <ore:plateCrudeSteel>, # Crude Steel Plate
  "T": <ore:gtceWrenches>, # Neutronium Wrench (HV)
});

# [LV Machine Hull] from [LV Machine Casing][+3]
craft.make(<metaitem:hull.lv>, ["pretty",
  "□ п □",
  "G ⌂ G"], {
  "□": <ore:plateWroughtIron>,      # Wrought Iron Plate
  "п": <ore:plateCrudeSteel>,       # Crude Steel Plate
  "G": <ore:cableGtSingleTin>,      # 1x Tin Cable
  "⌂": <gregtech:machine_casing:1>, # LV Machine Casing
});

# [Electronic Circuit] from [Circuit Board][+4]
craft.make(<gregtech:meta_item_1:621>, ["pretty",
  "R □ R",
  "U C U",
  "G G G"], {
  "R": <metaitem:component.resistor>,     # Resistor
  "□": <ore:plateCrudeSteel>,       # Crude Steel Plate
  "U": <metaitem:circuit.vacuum_tube>,            # Vacuum Tube
  "C": <metaitem:circuit_board.basic>,  # Circuit Board
  "G": <ore:cableGtSingleRedAlloy>, # 1x Red Alloy Cable
});

# [Sludge Refiner] from [LV Machine Hull][+5]
craft.remake(<industrialforegoing:sludge_refiner>, ["pretty",
  "* v *",
  "G L G",
  "U S U"], {
  "*": <ore:foilGreenCrystalAlloy>,         # Green Crystal Alloy Foil
  "v": <ore:circuitLv>,                     # Electronic Circuit
  "G": <ore:wireGtSingleCopper>,            # 1x Copper Wire
  "L": <gregtech:machine:986>,              # LV Machine Hull
  "U": <metaitem:electric.motor.ulv>, # ULV Electric Motor
  "S": <extrautils2:drum>,                  # Stone Drum
});

# [Redstone Gear] from [Red Alloy Plate][+1]
craft.remake(<extrautils2:ingredients:1>, ["pretty",
  "  ♥  ",
  "♥ □ ♥",
  "  ♥  "], {
  "♥": <ore:craftingRedstoneTorch>, # Redstone Torch
  "□": <ore:plateRedAlloy>, # Red Alloy Plate
});

# [Manual Mill] from [Redstone Gear][+2]
craft.remake(<extrautils2:passivegenerator:7>, ["pretty",
  "     ",
  "  ▼  ",
  "□ ♥ □"], {
  "▼": <ore:gearRedstone>,        # Redstone Gear
  "□": <ore:plateDoubleTinAlloy>, # Double Tin Alloy Plate
  "♥": <ore:gemRedstone>,         # Resonating Redstone Crystal
});

# [Hand Crank Generator] from [ULV Machine Hull][+5]
craft.remake(<mbd:gp_eu>, ["pretty",
  "U M U",
  "S L S",
  "¤ i ¤"], {
  "U": <metaitem:circuit.vacuum_tube>,                 # Vacuum Tube
  "M": <contenttweaker:stator>, # Manual Mill
  "S": <ore:screwSilver>,                # Silver Screw
  "L": <gregtech:machine:985>,           # Stator
  "¤": <ore:gearCrudeSteel>,             # Crude Steel Gear
  "i": <ore:springSilver>,               # ULV Machine Hull
});


# [Liquid Fueled Engine] from [Crude Steel Screw][+3]
craft.remake(<advancedrocketry:rocketmotor>, ["pretty",
  "╱ r ╱",
  "I C I",
  "I   I"], {
  "╱": <ore:stickCrudeSteel>, # Crude Steel Rod
  "r": <ore:ringCrudeSteel>,  # Crude Steel Ring
  "I": <ore:sheetIron>,       # Iron Sheet
  "C": <ore:screwCrudeSteel>, # Crude Steel Screw
});

# [Liquid Fuel Tank] from [Double Crude Steel Plate][+2]
craft.remake(<advancedrocketry:fueltank>, ["pretty",
  "╱ C ╱",
  "□ C □",
  "╱ C ╱"], {
  "╱": <ore:stickCrudeSteel>,       # Crude Steel Rod
  "C": <ore:ringCrudeSteel>,        # Crude Steel Ring
  "□": <ore:plateDoubleCrudeSteel>, # Double Crude Steel Plate
});

# [Rocket Assembling Machine] from [ULV Machine Casing][+5]
craft.remake(<advancedrocketry:rocketbuilder>, ["pretty",
  "L U L",
  "□ ⌂ □",
  "¤ V ¤"], {
  "L": <ore:circuitLv>,            # Electronic Circuit
  "U": <advancedrocketry:misc>,    # User Interface
  "□": <ore:plateSilver>,          # Silver Plate
  "⌂": <gregtech:machine_casing>,  # ULV Machine Casing
  "¤": <ore:gearCrudeSteel>,       # Crude Steel Gear
  "V": <cosmic_core:cc_meta_item>, # ULV Conveyor Module
});

# [Guidance Computer] from [ULV Machine Casing][+5]
craft.remake(<advancedrocketry:guidancecomputer>, ["pretty",
  "□ U □",
  "L ⌂ L",
  "¤ V ¤"], {
  "□": <ore:plateSilver>,            # Silver Plate
  "U": <advancedrocketry:misc>,      # User Interface
  "L": <ore:circuitLv>,              # Electronic Circuit
  "⌂": <gregtech:machine_casing>,    # ULV Machine Casing
  "¤": <ore:gearCrudeSteel>,         # Crude Steel Gear
  "V": <cosmic_core:cc_meta_item:2>, # ULV Electric Motor
});

# [Iron Hook] from [Crude Steel Pickaxe Head][+3]
craft.remake(<hooked:hook:1>, ["pretty",
  "C ╱ H",
  "  I ╱",
  "I   C"], {
  "C": <ore:screwCrudeSteel>,           # Crude Steel Screw
  "╱": <ore:stickCrudeSteel>,           # Crude Steel Rod
  "H": <ore:toolHeadPickaxeCrudeSteel>, # Crude Steel Pickaxe Head
  "I": <hooked:microcrafting:3>,        # Iron Chain
});

# [Philosopher's Stone] from [Resonating Redstone Crystal][+2]
craft.remake(<projecte:item.pe_philosophers_stone>, ["pretty",
  "▲ ♠ ▲",
  "♠ ♥ ♠",
  "▲ ♠ ▲"], {
  "▲": <metaitem:foilRedAlloy>,               # Glowstone Dust
  "♠": <projecte:item.pe_covalence_dust>, # Low Covalence Dust
  "♥": <ore:gemRedCrystalAlloy>,                 # Resonating Redstone Crystal
});

# [Sulfur Dust] from [Philosopher's Stone][+1]
craft.shapeless(<metaitem:dustSulfur>, "P©©©©", {
  "P": <projecte:item.pe_philosophers_stone>, # Philosopher's Stone
  "©": <ore:dustCoal>, # Coal Dust
});

# [Iron Chain Link]*3 from [Neutronium Hammer][+2]
craft.remake(<hooked:microcrafting:2> * 3, ["pretty",
  "T ╱  ",
  "╱   ╱",
  "  ╱ o"], {
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
  "╱": <ore:stickCrudeSteel>, # Crude Steel Rod
  "o": <ore:gtceWireCutters>, # Neutronium Wire Cutter
});

# [User Interface] from [Glass Pane][+3]
craft.remake(<advancedrocketry:misc>, ["pretty",
  "F L F",
  "▲ G ▲"], {
  "F": <ore:wireFineRedAlloy>,                     # Fine Red Alloy Wire
  "L": <ore:circuitLv>,                            # Electronic Circuit
  "▲": <ore:dustGlowstone>,                        # Glowstone Dust
  "G": <ore:paneGlassColorless>, # Glass Pane
});
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
# [Planet Id Chip] from [Circuit Board][+5]
craft.remake(<advancedrocketry:planetidchip>, ["pretty",
  "R U R",
  "* C *",
  "▲ ♠ ▲"], {
  "R": <metaitem:component.resistor>,              # Resistor
  "U": <metaitem:circuit.vacuum_tube>,                     # Vacuum Tube
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "C": <metaitem:circuit_board.basic>,           # Circuit Board
  "▲": <ore:dustGlowstone>,                  # Glowstone Dust
  "♠": <projecte:item.pe_covalence_dust>,    # Low Covalence Dust
});

# [Culture Vat] from [Evertide Amulet][+3]
craft.remake(<fossil:cultivate>, ["pretty",
  "* B *",
  "* E *",
  "□ □ □"], {
  "*": <contenttweaker:crystal_green_glass>, # Green Crystal Glass
  "B": <ore:circuitLv>,                     # Bio-Goo
  "E": <projecte:item.pe_evertide_amulet>,   # Evertide Amulet
  "□": <ore:plateWroughtIron>,               # Wrought Iron Plate
});


# [devtech.machine.electromagnetic_separator.ulv.name] from [ULV Machine Hull][+5]
craft.remake(<metaitem:devtech:electromagnetic_separator.ulv>, ["pretty",
  "U G t",
  "G V ╱",
  "L G t"], {
  "U": <metaitem:circuit.vacuum_tube>,            # Vacuum Tube
  "G": <ore:cableGtSingleRedAlloy>, # 1x Red Alloy Cable
  "t": <ore:wireGtDoubleRedAlloy>,  # 2x Red Alloy Wire
  "V": <metaitem:hull.ulv>,      # ULV Machine Hull
  "╱": <ore:stickIronMagnetic>,     # Magnetic Iron Rod
  "L": <metaitem:conveyor.module.ulv>,  # ULV Conveyor Module
});

//Cooking Ingots
furnace.addRecipe(<minecraft:iron_ingot>, <metaitem:hull.plate.broken.0>, 0.0);
furnace.addRecipe(<metaitem:ingotCopper>, <metaitem:hull.plate.broken.1>, 0.0);
furnace.addRecipe(<metaitem:ingotTin>, <metaitem:hull.plate.broken.2>, 0.0);
furnace.addRecipe(<metaitem:ingotSilver>, <metaitem:hull.plate.3>, 0.0);

//Iron + Tin
electromagnetic_separator.recipeBuilder()
  .inputs(<contenttweaker:heavy_dust>)
	.outputs(<metaitem:dustIron>)
	.chancedOutput(<metaitem:dustSmallTin>, 4000, 1000)
	.chancedOutput(<metaitem:dustSmallTin>, 2000, 1000)
	.EUt(2)
	.duration(100)
	.buildAndRegister();

furnace.addRecipe(<minecraft:iron_ingot>, <contenttweaker:heavy_dust>, 0.0);

//Copper + Tin
electromagnetic_separator.recipeBuilder()
  .inputs(<contenttweaker:light_dust>)
	.outputs(<metaitem:dustCopper>)
	.chancedOutput(<metaitem:dustSmallTin>, 4000, 1000)
	.chancedOutput(<metaitem:dustSmallTin>, 2000, 1000)
	.EUt(2)
	.duration(100)
	.buildAndRegister();

furnace.addRecipe(<metaitem:ingotCopper>, <contenttweaker:light_dust>, 0.0);

//Crude Steel + Lead
electromagnetic_separator.recipeBuilder()
  .inputs(<contenttweaker:dense_dust>)
	.outputs(<metaitem:dustCrudeSteel>)
	.chancedOutput(<metaitem:dustSmallLead>, 4000, 1000)
	.chancedOutput(<metaitem:dustSmallLead>, 2000, 1000)
	.EUt(2)
	.duration(100)
	.buildAndRegister();
//Crude Steel is blast furnace only
//furnace.remove(<enderio:item_alloy_endergy_ingot>);
furnace.addRecipe(<ore:ingotCrudeSteel>.firstItem, <contenttweaker:dense_dust>, 0.0);

//Reuse the Basic furnaces
val basicFurnace as IIngredient = (<morefurnaces:furnaceblock:5>|<morefurnaces:furnaceblock>) as IIngredient;
recipes.addShaped(<morefurnaces:furnaceblock:6>, [[null, <metaitem:plateSilver>, null],[<metaitem:plateSilver>, basicFurnace, <metaitem:plateSilver>], [null, <ore:gtceWrenches>, null]]);

/*
//Diamonds to other gems for blast furnace
recipes.addShapeless(<metaitem:gemRuby> * 3, [<projecte:item.pe_philosophers_stone>,<minecraft:diamond>,<minecraft:diamond>,<minecraft:diamond>]);
recipes.addShapeless(<metaitem:gemSapphire>, [<projecte:item.pe_philosophers_stone>,<minecraft:diamond>]);
*/

// Red Alloy Dust
recipes.addShapeless(<metaitem:dustRedAlloy>, [<ore:dustCopper>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]);
recipes.addShapeless(<metaitem:dustRedAlloy>*2, [<ore:dustCopper>,<ore:dustCopper>,<metaitem:dustRedCrystal>]);

// GC Alloy Dust
recipes.addShapeless(<metaitem:dustGreenCrystalAlloy> * 5, [<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustGreenCrystal>]);

// GC Glass Dust
recipes.addShapeless(<contenttweaker:dust_crystal_green_glass> * 3, [<metaitem:dustGlass>,<metaitem:dustGlass>,<metaitem:dustGreenCrystal>]);
//Crystal Glass
furnace.addRecipe(<contenttweaker:crystal_green_glass>, <contenttweaker:dust_crystal_green_glass>, 0.0);

//Tin Alloy
recipes.addShapeless(<metaitem:dustTinAlloy>*2, [<ore:dustIron>,<ore:dustTin>]);

//MB Fluid Hatch
recipes.addShapeless(<mbd:fluid_hatch>, [<metaitem:fluid_hatch.import.ulv>]);

//Glass
furnace.addRecipe(<minecraft:glass>, <metaitem:dustGlass>, 0.0);

# [Rubber Sheet] from [Neutronium Hammer][+1]
craft.remake(<metaitem:plateRubber>, ["pretty",
  "  T",
  "  ▬",
  "  ▬"], {
  "T": <ore:craftingToolHardHammer> | <ore:gtceHardHammers>, # Neutronium Hammer
  "▬": <ore:ingotRubber>, # Rubber Bar
});

//Rubber
furnace.addRecipe(<metaitem:ingotRubber>, <metaitem:dustRubber>, 0.0);

//Bio Goo
//recipes.addShaped(<fossil:bio_goo> * 3, [[<gregtechfoodoption:gtfo_meta_tool>],[<minecraft:mutton>]]);
//recipes.addShaped(<fossil:bio_goo> * 9, [[<gregtechfoodoption:gtfo_meta_tool>],[<fossil:failuresaurus_flesh>]]);

//Slime in a bucket
recipes.addShaped(<quark:slime_bucket>, [[<fossil:bio_goo>],[<minecraft:bucket>]]);

//Resin
furnace.addRecipe(<metaitem:rubber_drop> * 4, <fossil:bio_goo>, 0.0);


SludgeRefiner.add(<fossil:bio_goo>, 5);
SludgeRefiner.add(<minecraft:grass>, 3);

/*
//Sheep Recipe
recipes.addShaped(<tinymobfarm:lasso>.withTag({capturedMob: {mobName: "Sheep", mobHostile: 0 as byte, mobMaxHealth: 8.0, mobLootTableLocation: "minecraft:entities/sheep/black", 
mobData: {HurtByTimestamp: 0, ForgeData: {}, RelativeAABB: [-0.44999998807907104, 0.0, -0.44999998807907104, 0.44999998807907104, 1.2999999523162842, 0.44999998807907104], 
Attributes: [{Base: 8.0, Name: "generic.maxHealth"}, {Base: 0.0, Name: "generic.knockbackResistance"}, {Base: 0.23000000417232513, Name: "generic.movementSpeed"}, {Base: 0.0, Modifiers: [{UUIDMost: 7967251376945776733 as long, 
UUIDLeast: -6334252128332718209 as long, Amount: 1.0, Operation: 0, Name: "sheep_armor"}], Name: "generic.armor"}, {Base: 0.0, Name: "generic.armorToughness"}, {Base: 1.0, Name: "forge.swimSpeed"}, 
{Base: 16.0, Modifiers: [{UUIDMost: 1001108870215716285 as long, UUIDLeast: -8438169646607084800 as long, Amount: -0.043732826370627934, Operation: 1, Name: "Random spawn bonus"}], Name: "generic.followRange"}], 
Invulnerable: 0 as byte, FallFlying: 0 as byte, ForcedAge: 0, PortalCooldown: 0, AbsorptionAmount: 0.0 as float, FallDistance: 0.0 as float, InLove: 0, DeathTime: 0 as short, ForgeCaps: {"pneumaticcraft:hacking": {}}, 
HandDropChances: [0.085 as float, 0.085 as float], PersistenceRequired: 0 as byte, id: "minecraft:sheep", Age: 0, Motion: [0.0, -0.0784000015258789, 0.0], Leashed: 0 as byte, UUIDLeast: -6831894127428841867 as long, Health: 8.0 as float, Color: 15 as byte, 
LeftHanded: 0 as byte, Air: 300 as short, OnGround: 1 as byte, Dimension: 33, UpdateBlocked: 0 as byte, HandItems: [{}, {}], ArmorDropChances: [0.085 as float, 0.085 as float, 0.085 as float, 0.085 as float], 
UUIDMost: -5435383733186377826 as long, Pos: [202.5, 82.0, -368.5], Fire: -1 as short, ArmorItems: [{}, {}, {}, {}], CanPickUpLoot: 0 as byte, Sheared: 0 as byte, HurtTime: 0 as short}, mobHealth: 8.0}}), 
[[null, <fossil:sheep_dna>, null],[<fossil:sheep_dna>, <minecraft:lead>, <fossil:sheep_dna>], [null, <fossil:sheep_dna>, null]]);


//Autoclaving Diamond
autoclave.recipeBuilder()
	.outputs(<minecraft:diamond>)
    .inputs(<ore:dustDiamond>)
    .fluidInputs([<liquid:water> * 200])
	.EUt(24)
	.duration(80)
	.buildAndRegister();
	
autoclave.recipeBuilder()
	.outputs(<minecraft:diamond>)
    .inputs(<ore:dustDiamond>)
    .fluidInputs([<liquid:distilled_water> * 200])
	.EUt(24)
	.duration(60)
	.buildAndRegister();

//Compressing Obsidian
compressor.recipeBuilder()
	.outputs(<minecraft:obsidian>)
    .inputs(<ore:dustObsidian>*4)
	.EUt(2)
	.duration(400)
	.buildAndRegister();

//Sulfur
recipes.addShapeless(<metaitem:dustSulfur>, [<projecte:item.pe_philosophers_stone>,<ore:dustCoal>,<ore:dustCoal>,<ore:dustCoal>,<ore:dustCoal>]);

*/
# [Small Airlock Door] from [Iron Plate]
craft.remake(<advancedrocketry:smallairlockdoor>, ["pretty",
  "□ □",
  "□ □",
  "□ □"], {
  "□": <ore:plateIron>, # Iron Plate
});

# [Basic Alloy Smelter] from [LV Machine Hull][+3]
recipes.removeByRecipeName("gregtech:gregtech.machine.alloy_smelter.lv");
craft.make(<gregtech:machine:80>, ["pretty",
  "L G L",
  "G V G",
  "t G t"], {
  "L": <ore:circuitLv>,             # Electronic Circuit
  "G": <ore:wireGtQuadrupleNickel>, # 4x Nickel Wire
  "V": <gregtech:machine:986>,      # LV Machine Hull
  "t": <ore:cableGtSingleTin>,      # 1x Tin Cable
});

# [Basic Electric Furnace] from [LV Machine Hull][+3]
recipes.removeByRecipeName("gregtech:gregtech.machine.electric_furnace.lv");
craft.make(<gregtech:machine:50>, ["pretty",
  "L G L",
  "G V G",
  "t G t"], {
  "L": <ore:circuitLv>,             # Electronic Circuit
  "G": <ore:wireGtDoubleNickel>,   # 2x Nickel Wire
  "V": <gregtech:machine:986>,      # LV Machine Hull
  "t": <ore:cableGtSingleTin>,      # 1x Tin Cable
});

# [Basic Polarizer] from [LV Machine Hull][+3]
recipes.removeByRecipeName("gregtech:gregtech.machine.polarizer.lv");
craft.make(<gregtech:machine:545>, ["pretty",
  "t G t",
  "C V C",
  "t G t"], {
  "G": <ore:stickSteel>,             # Steel Rod
  "C": <ore:cableGtSingleTin>, # 1x Tin Cable
  "V": <gregtech:machine:986>,      # LV Machine Hull
  "t": <ore:wireGtDoubleTin>,      # 2x Tin Wire
});

# [Basic Electrolyzer] from [LV Machine Hull][+4]
recipes.removeByRecipeName("gregtech:gregtech.machine.electrolyzer.lv");
craft.make(<gregtech:machine:275>, ["pretty",
  "G ■ G",
  "G V G",
  "L t L"], {
  "G": <ore:wireGtSingleGold>,    # 1x Gold Wire
  "■": <ore:blockGlassColorless>, # Glass
  "V": <gregtech:machine:986>,    # LV Machine Hull
  "L": <ore:circuitLv>,           # Microprocessor
  "t": <ore:cableGtSingleNickel>, # 1x Nickel Cable
});

# [Spores Recreator] from [ULV Machine Casing][+6]
recipes.removeByRecipeName("industrialforegoing:spores_recreator");
craft.make(<industrialforegoing:spores_recreator>, ["pretty",
  "§ l §",
  "n ⌂ n",
  "□ ¤ □"], {
  "§": <contenttweaker:internals_t2>, # Complex Internals
  "l": <ore:listAllwater>,            # Water Bucket
  "n": <ore:listAllmushroom>, # Mushroom
  "⌂": <gregtech:machine_casing:0>,     # ULV Machine Casing
  "□": <ore:plateDoubleTinAlloy>,     # Double Tin Alloy Plate
  "¤": <ore:gearIron>,                # Iron Gear
});

##########################################################################################
print("==================== end of ulv_lv_station_recipes.zs ====================");
