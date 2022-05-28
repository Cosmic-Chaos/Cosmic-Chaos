recipes.removeByRecipeName("pneumaticcraft:seismic_sensor");
recipes.addShaped("seismic_sensor", <pneumaticcraft:seismic_sensor>, [
	[null, <metaitem:sensor.lv>, null],
	[<pneumaticcraft:pressure_chamber_glass>, <ore:circuitMv>, <pneumaticcraft:pressure_chamber_glass>],
	[<pneumaticcraft:pressure_chamber_glass>, <ore:gemFlawlessCoal>, <pneumaticcraft:pressure_chamber_glass>]
]);


# [Volume Upgrade] from [Air Canister][+2]
recipes.removeByRecipeName("pneumaticcraft:volume_upgrade");
craft.make(<pneumaticcraft:volume_upgrade>, ["pretty",
  "B ▬ B",
  "▬ A ▬",
  "B ▬ B"], {
  "B": <ore:plasticBlue>,                         # Blue Plastic
  "▬": <ore:ingotIronCompressed>,                 # Compressed Iron Ingot
  "A": <pneumaticcraft:air_canister>.anyDamage(), # Air Canister
});

# [Dispenser Upgrade] from [Dispenser][+2]
recipes.removeByRecipeName("pneumaticcraft:dispenser_upgrade");
craft.make(<pneumaticcraft:dispenser_upgrade>, ["pretty",
  "B ⌃ B",
  "⌃ D ⌃",
  "B ⌃ B"], {
  "B": <ore:plasticBlue>,                       # Blue Plastic
  "⌃": <ore:gemNetherQuartz>, # Nether Quartz
  "D": <minecraft:dispenser>,                   # Dispenser
});

# [Item Life Upgrade] from [Cobweb][+2]
recipes.removeByRecipeName("pneumaticcraft:item_life_upgrade");
craft.make(<pneumaticcraft:item_life_upgrade>, ["pretty",
  "B G B",
  "G C G",
  "B G B"], {
  "B": <ore:plasticBlue>, # Blue Plastic
  "G": <ore:foilGold>,    # Gold Foil
  "C": <minecraft:web>,   # Cobweb
});

# [Entity Tracker Upgrade] from [MV Sensor][+2]
recipes.removeByRecipeName("pneumaticcraft:entity_tracker_upgrade");
craft.make(<pneumaticcraft:entity_tracker_upgrade>, ["pretty",
  "B S B",
  "S M S",
  "B S B"], {
  "B": <ore:plasticBlue>,          # Blue Plastic
  "S": <minecraft:spider_eye>,     # Spider Eye
  "M": <metaitem:sensor.mv>, # MV Sensor
});

# [Block Tracker Upgrade] from [MV Sensor][+2]
recipes.removeByRecipeName("pneumaticcraft:block_tracker_upgrade");
craft.make(<pneumaticcraft:block_tracker_upgrade>, ["pretty",
  "B P B",
  "P M P",
  "B P B"], {
  "B": <ore:plasticBlue>,                      # Blue Plastic
  "P": <pneumaticcraft:pressure_chamber_wall>, # Pressure Chamber Wall
  "M": <metaitem:sensor.mv>,             # MV Sensor
});

# [Speed Upgrade] from [Lubricant Bucket][+2]
recipes.removeByRecipeName("pneumaticcraft:speed_upgrade");
craft.make(<pneumaticcraft:speed_upgrade>, ["pretty",
  "B A B",
  "A ~ A",
  "B A B"], {
  "B": <ore:plasticBlue>,                    # Blue Plastic
  "A": <ore:listAllsugar> | <ore:dustSugar>, # Sugar
  "~": Bucket("lubricant"), # Lubricant Bucket
});

# [Item Search Upgrade] from [MV Sensor][+2]
recipes.removeByRecipeName("pneumaticcraft:search_upgrade");
craft.make(<pneumaticcraft:search_upgrade>, ["pretty",
  "B □ B",
  "□ M □",
  "B □ B"], {
  "B": <ore:plasticBlue>,          # Blue Plastic
  "□": <ore:plateDoubleZinc>,      # Double Zinc Plate
  "M": <metaitem:sensor.mv>, # MV Sensor
});

# [Coordinate Tracker Upgrade] from [MV Sensor][+3]
recipes.removeByRecipeName("pneumaticcraft:coordinate_tracker_upgrade");
craft.make(<pneumaticcraft:coordinate_tracker_upgrade>, ["pretty",
  "B G B",
  "♥ M ♥",
  "B ♥ B"], {
  "B": <ore:plasticBlue>,          # Blue Plastic
  "G": <pneumaticcraft:gps_tool>,  # GPS Tool
  "♥": <ore:dustRedstone>,         # Redstone
  "M": <metaitem:sensor.mv>, # MV Sensor
});

# [Range Upgrade] from [MV Emitter][+2]
recipes.removeByRecipeName("pneumaticcraft:range_upgrade");
craft.make(<pneumaticcraft:range_upgrade>, ["pretty",
  "B G B",
  "G M G",
  "B G B"], {
  "B": <ore:plasticBlue>,          # Blue Plastic
  "G": <ore:wireGtSingleElectrum>, # 1x Electrum Wire
  "M": <metaitem:emitter.mv>, # MV Emitter
});

# [Security Upgrade] from [Safety Tube Module][+2]
recipes.removeByRecipeName("pneumaticcraft:security_upgrade");
craft.make(<pneumaticcraft:security_upgrade>, ["pretty",
  "B □ B",
  "□ S □",
  "B □ B"], {
  "B": <ore:plasticBlue>,                   # Blue Plastic
  "□": <ore:plateObsidian>,                 # Obsidian Plate
  "S": <pneumaticcraft:safety_tube_module>, # Safety Tube Module
});

# [Magnet Upgrade] from [Red Plastic][+2]
recipes.removeByRecipeName("pneumaticcraft:magnet_upgrade");
craft.make(<pneumaticcraft:magnet_upgrade>, ["pretty",
  "B ╱ B",
  "╱ R ╱",
  "B ╱ B"], {
  "B": <ore:plasticBlue>,        # Blue Plastic
  "╱": <ore:stickSteelMagnetic>, # Magnetic Steel Rod
  "R": <ore:plasticRed>,         # Red Plastic
});

# [Charging Upgrade] from [Charging Module][+2]
recipes.removeByRecipeName("pneumaticcraft:charging_upgrade");
craft.make(<pneumaticcraft:charging_upgrade>, ["pretty",
  "B P B",
  "P C P",
  "B P B"], {
  "B": <ore:plasticBlue>,                # Blue Plastic
  "P": <pneumaticcraft:pressure_tube>,   # Pressure Tube
  "C": <pneumaticcraft:charging_module>, # Charging Module
});

# [Armor Upgrade] from [Compressed Iron Ingot][+2]
recipes.removeByRecipeName("pneumaticcraft:armor_upgrade");
craft.make(<pneumaticcraft:armor_upgrade>, ["pretty",
  "B ◊ B",
  "◊ ▬ ◊",
  "B ◊ B"], {
  "B": <ore:plasticBlue>,         # Blue Plastic
  "◊": <ore:gemDiamond>,          # Diamond
  "▬": <ore:ingotIronCompressed>, # Compressed Iron Ingot
});

# [Jet Boots Upgrade] from [Advanced Air Compressor][+3]
recipes.removeByRecipeName("pneumaticcraft:jet_boots_upgrade");
craft.make(<pneumaticcraft:jet_boots_upgrade>, ["pretty",
  "B A B",
  "V d V",
  "B A B"], {
  "B": <ore:plasticBlue>,                          # Blue Plastic
  "A": <pneumaticcraft:advanced_pressure_tube>,    # Advanced Pressure Tube
  "V": <pneumaticcraft:vortex_cannon>.anyDamage(), # Vortex Cannon
  "d": <pneumaticcraft:advanced_air_compressor>,   # Advanced Air Compressor
});

# [Night Vision Upgrade] from [Pressure Chamber Glass][+2]
recipes.removeByRecipeName("pneumaticcraft:night_vision_upgrade");
craft.make(<pneumaticcraft:night_vision_upgrade>, ["pretty",
  "B P B",
  "r P r",
  "B P B"], {
  "B": <ore:plasticBlue>,                       # Blue Plastic
  "P": <minecraft:potion>.withTag({Potion: "minecraft:long_night_vision"}), # Potion of Night Vision
  "r": <pneumaticcraft:pressure_chamber_glass>, # Pressure Chamber Glass
});

# [SCUBA Upgrade] from [Regulator Tube Module][+4]
recipes.removeByRecipeName("pneumaticcraft:scuba_upgrade");
craft.make(<pneumaticcraft:scuba_upgrade>, ["pretty",
  "B P B",
  "Y R Y",
  "B l B"], {
  "B": <ore:plasticBlue>,                      # Blue Plastic
  "P": <pneumaticcraft:pressure_tube>,         # Pressure Tube
  "Y": <ore:plasticYellow>,                    # Yellow Plastic
  "R": <pneumaticcraft:regulator_tube_module>, # Regulator Tube Module
  "l": <ore:plasticBlack>,                     # Black Plastic
});

# [Liquid Hopper] from [Glass][+1]
craft.remake(<pneumaticcraft:liquid_hopper>, ["pretty",
  "▬   ▬",
  "▬ ■ ▬",
  "  ▬  "], {
  "▬": <ore:ingotIronCompressed>, # Compressed Iron Ingot
  "■": <ore:blockGlassColorless>, # Glass
});
