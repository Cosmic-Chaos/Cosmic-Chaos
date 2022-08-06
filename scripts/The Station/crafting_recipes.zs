import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.industrialforegoing.SludgeRefiner;
import crafttweaker.oredict.IOreDictEntry;

print("==================== loading The Station/ulv_lv_station_recipes.zs ====================");
##########################################################################################

##=======================================================
## ADD RECIPES
##=======================================================

//Busses because no wood
recipes.addShaped(<metaitem:item_bus.export.ulv>, [[<metaitem:hull.ulv>], [<metaitem:crate.bronze>|<metaitem:crate.steel>]]);
recipes.addShaped(<metaitem:item_bus.import.ulv>, [[<metaitem:crate.bronze>|<metaitem:crate.steel>],[<metaitem:hull.ulv>]]);
//LV Busses
recipes.addShaped(<metaitem:item_bus.export.lv>, [[<metaitem:hull.lv>], [<metaitem:crate.bronze>|<metaitem:crate.steel>]]);
recipes.addShaped(<metaitem:item_bus.import.lv>, [[<metaitem:crate.bronze>|<metaitem:crate.steel>],[<metaitem:hull.lv>]]);

# [Ultra Low Voltage 4x Battery Buffer] from [ULV Machine Hull][+2]
craft.make(<metaitem:battery_buffer.ulv.4>, ["pretty",
  "G I G",
  "G U G"], {
  "G": <ore:wireGtQuadrupleLead>, # 4x Lead Wire
  "I": <metaitem:crate.bronze>|<metaitem:crate.steel>,    # Iron Chest
  "U": <metaitem:hull.ulv>,    # ULV Machine Hull
});

//Rod Mold
recipes.addShaped(<contenttweaker:mold_rod>, [[<metaitem:shape.empty>, <ore:gtceHardHammers>]]);

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
  "╱ T  "], {
  "□": <metaitem:plateWroughtIron>,   # Iron Plate
  "T": <metaitem:plateTinAlloy>, # Tin Alloy Plate
  "╱": <ore:stickBronze>, # Bronze Rod
});


# [Derelict Casing] from [Wrought Iron Frame Box][+3]
craft.remake(<contenttweaker:station_casing>*2, ["pretty",
  "P o P",
  "P ◙ P",
  "P T P"], {
  "P": <metaitem:station.component.0> | <metaitem:station.component.1>, # Plating Component
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
  "P": <metaitem:station.component.3>, # Primitive Crafting Interface
  "r": <metaitem:station.component.2>, # Primitive Mixed Plating
  "S": <metaitem:crate.bronze>|<metaitem:crate.steel>,              # Silver Chest
});




// Workbench 2nd Recipe
recipes.addShaped(<metaitem:workbench>, [
	[null, <minecraft:book>, null],
	[<ore:screwIron>, <ore:craftingTableWood>, <ore:screwIron>], 
	[null, <metaitem:plateDoubleBronze>, null]
]);

# [Plating Component]
recipes.addShapeless(<metaitem:station.component.0>, 
	[<ore:gtceHardHammers>,<metaitem:hull.plate.1>,<metaitem:hull.plate.1>,<metaitem:hull.plate.0>]
);

# [Plating Component]
recipes.addShapeless(<metaitem:station.component.1>, 
	[<ore:gtceHardHammers>,<metaitem:hull.plate.0>,<metaitem:hull.plate.0>,<metaitem:hull.plate.1>]
);

# [Primitive Mixed Plating]
recipes.addShapeless(<metaitem:station.component.2>, 
	[<ore:gtceWrenches>,<metaitem:station.component.1>,<metaitem:station.component.0>]
);

# [Primitive Crafting Interface]
recipes.addShapeless(<metaitem:station.component.3>, 
	[<ore:gtceScrewdrivers>,<metaitem:internal.components.0>,<metaitem:internal.components.0>,<metaitem:internal.components.0>]
);

# [Copper Furnace] from [Neutronium Wrench][+1]
craft.remake(<morefurnaces:furnaceblock:5>, ["pretty",
  "P P P",
  "P T P",
  "P P P"], {
  "P": <metaitem:station.component.0>, # Plating Component
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
  "P": <metaitem:station.component.1>, # Plating Component
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

# [Furnace Upgrade_ Copper To Silver] from [Copper Plate][+2]
craft.remake(<morefurnaces:upgrade:5>, ["pretty",
  "  □  ",
  "□ п □",
  "  T  "], {
  "□": <ore:plateSilver>, # Silver Plate
  "п": <ore:plateCopper>, # Copper Plate
  "T": <ore:craftingToolWrench> | <ore:gtceWrenches>, # Neutronium Wrench
});

# [Furnace Upgrade_ Iron To Silver] from [Iron Plate][+2]
craft.remake(<morefurnaces:upgrade:6>, ["pretty",
  "  □  ",
  "□ п □",
  "  T  "], {
  "□": <ore:plateSilver>, # Silver Plate
  "п": <ore:plateIron>,   # Iron Plate
  "T": <ore:craftingToolWrench> | <ore:gtceWrenches>, # Neutronium Wrench
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
  "l": <metaitem:component.glass.tube>, # Glass Tube
  "G": <ore:wireGtSingleCopper>,   # 1x Copper Wire
});

# [Vacuum Tube] from [Glass Tube][+2]
craft.make(<metaitem:circuit.vacuum_tube>, ["pretty",
  "╱ l ╱",
  "G G G"], {
  "╱": <ore:stickWroughtIron>,     # Wrought Iron Rod
  "l": <metaitem:component.glass.tube>, # Glass Tube
  "G": <metaitem:internal.components.0>,   # 1x Copper Wire
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
  "v": <metaitem:circuit.vacuum_tube>,                     # Electronic Circuit
  "G": <ore:wireGtSingleCopper>,            # 1x Copper Wire
  "L": <metaitem:hull.ulv>,              # LV Machine Hull
  "U": <metaitem:electric.motor.ulv>, # ULV Electric Motor
  "S": <metaitem:drum.bronze>,                  # Bronze Drum
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

# [Blue Alloy Hook] from [Blue Alloy Pickaxe Head][+3]
craft.remake(<hooked:hook:2>, ["pretty",
  "B ╱ H",
  "  I ╱",
  "I   B"], {
  "B": <ore:screwBlueAlloy>,           # Blue Alloy Screw
  "╱": <ore:stickBlueAlloy>,           # Blue Alloy Rod
  "H": <ore:toolHeadPickaxeBlueAlloy>, # Blue Alloy Pickaxe Head
  "I": <hooked:microcrafting:3>,       # Iron Chain
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

# [Coated Circuit Board] from [Wood Plank][+1]
craft.remake(<metaitem:board.coated>, ["pretty",
  "# S",
  "S  "], {
  "#": <ore:plateCaveRoot> | <ore:plateWood>, # Wood Plank
  "S": <metaitem:rubber_drop>,        # Sticky Resin
});

# [Coated Circuit Board]*3 from [Wood Plank][+1]
craft.remake(<metaitem:board.coated> * 3, ["pretty",
  "S S S",
  "# # #",
  "S S S"], {
  "S": <metaitem:rubber_drop>,        # Sticky Resin
  "#": <ore:plateCaveRoot> | <ore:plateWood>, # Wood Plank
});

# [Resistor]*2 from [Carbon Dust][+3]
craft.remake(<metaitem:component.resistor> * 2, ["pretty",
  "S p S",
  "F ▲ F",
  "  p  "], {
  "S": <metaitem:rubber_drop>, # Sticky Resin
  "p": <ore:paper>, # Paper
  "F": <ore:wireFineCopper> | <ore:wireGtSingleCopper>,       # Fine Copper Wire
  "▲": <ore:dustCoal> | <ore:dustCarbon> | <ore:dustCharcoal>,           # Carbon Dust
});

/*
# [Rocket Boots] from [Leather Boots][+5]
craft.remake(<cosmic_core:cc_armor:1>.withTag({ench: [{lvl: 1 as short, id: 24}], RepairCost: 1}), ["pretty",
  "B r B",
  "L e L",
  "□ * □"], {
  "B": <ore:ringBronze>,                      # Bronze Ring
  "r": <ore:screwBronze>,                     # Bronze Screw
  "L": <advancedrocketry:pressuretank>,       # Low Pressure Tank
  "e": <advancedrocketry:spaceboots>.anyDamage(), # Leather Boots
  "□": <ore:plateCrudeSteel>,                 # Crude Steel Plate
  "*": <ore:gemRedCrystalAlloy>,              # Firestone
});
*/
# [Low Pressure Tank] from [Neutronium Hammer][+3]
craft.remake(<advancedrocketry:pressuretank>, ["pretty",
  "I o I",
  "I T I",
  "I r I"], {
  "I": <ore:sheetIron>, # Iron Sheet
  "o": <ore:screwIron>, # Iron Screw
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
  "r": <ore:ringIron>,  # Iron Ring
});

# [ Pressure Tank] from [Neutronium Hammer][+3]
craft.remake(<advancedrocketry:pressuretank:1>, ["pretty",
  "I o I",
  "I T I",
  "I r I"], {
  "I": <ore:sheetCrudeSteel>, # CrudeSteel Sheet
  "o": <ore:screwCrudeSteel>, # CrudeSteel Screw
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
  "r": <ore:ringCrudeSteel>,  # CrudeSteel Ring
});

# [Primitive Electromagnetic Separator] from [ULV Machine Hull][+5]
craft.make(<metaitem:devtech:electromagnetic_separator.ulv>, ["pretty",
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

# [Primitive Water Electrolyzer] from [ULV Machine Hull][+5]
craft.make(<metaitem:devtech:water_electrolyzer.ulv>, ["pretty",
  "| L |",
  "| V |",
  "U G U"], {
  "U": <metaitem:circuit.vacuum_tube>,            # Vacuum Tube
  "G": <ore:cableGtSingleRedAlloy>, # 1x Red Alloy Cable
  "V": <metaitem:hull.ulv>,      # ULV Machine Hull
  "|": <ore:wireGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Wire
  "L": <ore:blockGlassColorless>,  # Glass
});

# [Suit Jetpack] from [Silver Ring][+5]
craft.remake(<advancedrocketry:jetpack>, ["pretty",
  "P □ P",
  "l S l",
  "* i *"], {
  "P": <advancedrocketry:pressuretank:1>|<advancedrocketry:pressuretank>, # Pressure Tank
  "□": <ore:plateDoubleBlueAlloy>,        # Double Blue Alloy Plate
  "l": <ore:leather> | <ore:itemLeather>, # Leather
  "S": <ore:ringSilver>,                  # Silver Ring
  "*": <ore:gemRedCrystalAlloy>,          # Firestone
  "i": <ore:screwSilver>,                 # Silver Screw
});

# [Exhaust Vent] from [Bronze Screw][+2]
craft.remake(<contenttweaker:vent_clean>, ["pretty",
  "╱ □ ╱",
  "B □ B",
  "╱ □ ╱"], {
  "╱": <ore:stickTinAlloy>,   # Tin Alloy Rod
  "□": <ore:plateCrudeSteel>, # Crude Steel Plate
  "B": <ore:screwBronze>,     # Bronze Screw
});

# [Silver Exhaust Vent] from [Blue Alloy Screw][+2]
craft.remake(<contenttweaker:vent_very_clean>, ["pretty",
  "* □ *",
  "B □ B",
  "* □ *"], {
  "*": <contenttweaker:blue_crystal_dust>, # Reactive Crystal Powder
  "□": <ore:plateSilver>,                  # Silver Plate
  "B": <ore:screwBlueAlloy>,               # Blue Alloy Screw
});

# [Reaction Chamber] from [Crude Steel Frame Box][+3]
craft.remake(<contenttweaker:reaction_chamber>, ["pretty",
  "╱ ♠ ╱",
  "▲ ◙ ▲",
  "╱ ♠ ╱"], {
  "╱": <ore:stickBlueAlloy>,              # Blue Alloy Rod
  "♠": <projecte:item.pe_covalence_dust>, # Low Covalence Dust
  "▲": <ore:dustGlowstone>,               # Glowstone Dust
  "◙": <ore:frameGtCrudeSteel>,           # Crude Steel Frame Box
});

# [Steel Drum] from [Neutronium Hammer][+2]
craft.make(<metaitem:drum.steel>, ["pretty",
  "  T  ",
  "□ ╱ □",
  "□ ╱ □"], {
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
  "□": <ore:plateCrudeSteel>,    # Crude Steel Plate
  "╱": <ore:stickLongCrudeSteel>, # Long Aluminium Rod
});


//Reuse the Basic furnaces
val basicFurnace as IIngredient = (<morefurnaces:furnaceblock:5>|<morefurnaces:furnaceblock>) as IIngredient;
recipes.addShaped(<morefurnaces:furnaceblock:6>, [[null, <metaitem:plateSilver>, null],[<metaitem:plateSilver>, basicFurnace, <metaitem:plateSilver>], [null, <ore:gtceWrenches>, null]]);

// Red Alloy Dust
recipes.addShapeless(<metaitem:dustRedAlloy>, [<ore:dustCopper>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]);
recipes.addShapeless(<metaitem:dustRedAlloy>*2, [<ore:dustCopper>,<ore:dustCopper>,<metaitem:dustRedCrystal>]);

// Blue Alloy Dust
recipes.addShapeless(<metaitem:dustBlueAlloy>*2, [<ore:dustSilver>,<ore:dustSilver>,<metaitem:dustBlueCrystal>]);

// GC Alloy Dust
recipes.addShapeless(<metaitem:dustGreenCrystalAlloy> * 5, [<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustGreenCrystal>]);

recipes.addShapeless(<contenttweaker:crystal_seed_red>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemRedCrystal>]);
recipes.addShapeless(<contenttweaker:crystal_seed_green>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>]);
recipes.addShapeless(<contenttweaker:crystal_seed_blue>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemBlueCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>]);
recipes.addShapeless(<contenttweaker:crystal_seed_cyan>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>]);
recipes.addShapeless(<contenttweaker:crystal_seed_magenta>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>]);
recipes.addShapeless(<contenttweaker:crystal_seed_yellow>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>]);
recipes.addShapeless(<contenttweaker:crystal_seed_white>, [<projecte:item.pe_philosophers_stone>.reuse(), <ore:gemRedCrystal>, <ore:gemRedCrystal>, <ore:gemGreenCrystal>, <ore:gemGreenCrystal>, <ore:gemBlueCrystal>, <ore:gemBlueCrystal>]);

// GC Glass Dust
recipes.addShapeless(<contenttweaker:dust_crystal_green_glass> * 2, [<metaitem:dustGlass>,<metaitem:dustGreenCrystal>]);

// PC Glass Dust
recipes.addShapeless(<contenttweaker:dust_crystal_purple_glass> * 2, [<metaitem:dustGlass>,<metaitem:dustGlass>,<metaitem:dustRedCrystal>,<metaitem:dustBlueCrystal>]);
recipes.addShapeless(<contenttweaker:dust_crystal_purple_glass> * 2, [<metaitem:dustGlass>,<metaitem:dustGlass>,<metaitem:dustMagentaCrystal>,<metaitem:dustMagentaCrystal>]);
/*
//Crystal Glass
furnace.addRecipe(<cosmic_core:crystal_green_glass>, <contenttweaker:dust_crystal_green_glass>, 0.0);
*/
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

//Slime in a bucket
recipes.addShaped(<quark:slime_bucket>, [[<fossil:bio_goo>],[<minecraft:bucket>]]);

# [Small Airlock Door] from [Iron Plate]
craft.remake(<advancedrocketry:smallairlockdoor>*3, ["pretty",
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
  "§": <metaitem:internal.components.1>, # Complex Internals
  "l": <ore:listAllwater>|<projecte:item.pe_evertide_amulet>,            # Water Bucket
  "n": <ore:listAllmushroom>, # Mushroom
  "⌂": <metaitem:hull.ulv>,     # ULV Machine Casing
  "□": <ore:plateDoubleTinAlloy>,     # Double Tin Alloy Plate
  "¤": <ore:gearIron>,                # Iron Gear
});

##########################################################################################
print("==================== end of The Station/ulv_lv_station_recipes.zs ====================");
