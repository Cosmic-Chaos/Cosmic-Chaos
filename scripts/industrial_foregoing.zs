# [Animal Feeder] from [MV Machine Hull][+7]
craft.make(<industrialforegoing:animal_stock_increaser>, ["pretty",
  "R G R",
  "H V M",
  "F N o"], {
  "R": <industrialforegoing:plastic>,                        # Plastic
  "G": <minecraft:golden_apple>,                # Golden Apple
  "H": <minecraft:hay_block>,                   # Hay Bale
  "V": <metaitem:gregtech:hull.mv>,                  # MV Machine Hull
  "M": <metaitem:robot.arm.mv>,              # MV Robot Arm
  "F": <ore:foodFishandchips>,                  # Fish and Chips
  "N": <ore:pipeNormalFluidStainlessSteel>,     # Stainless Steel Fluid Pipe
  "o": <metaitem:food.beetroot_soup.hot>, # Hot Beetroot Soup
});

# [Animal Grower] from [MV Machine Hull][+7]
craft.make(<industrialforegoing:animal_growth_increaser>, ["pretty",
  "R E R",
  "H V M",
  "F N o"], {
  "R": <industrialforegoing:plastic>,                        # Plastic
  "E": <randomthings:entityfilter>,             # Entity Filter
  "H": <minecraft:hay_block>,                   # Hay Bale
  "V": <metaitem:gregtech:hull.mv>,                  # MV Machine Hull
  "M": <metaitem:robot.arm.mv>,              # MV Robot Arm
  "F": <ore:foodFishandchips>,                  # Fish and Chips
  "N": <ore:pipeNormalItemRoseGold>,            # Rose Gold Item Pipe
  "o": <metaitem:food.beetroot_soup.hot>, # Hot Beetroot Soup
});

# [Animal Baby Separator] from [MV Machine Hull][+6]
craft.make(<industrialforegoing:animal_independence_selector>, ["pretty",
  "R E R",
  "S V M",
  "◊ N ◊"], {
  "R": <industrialforegoing:plastic>,             # Plastic
  "E": <randomthings:entityfilter>,  # Entity Filter
  "S": <ore:rotorSteel>,             # Steel Rotor
  "V": <metaitem:gregtech:hull.mv>,       # MV Machine Hull
  "M": <metaitem:robot.arm.mv>,   # MV Robot Arm
  "◊": <ore:gemEmerald>,             # Emerald
  "N": <ore:pipeNormalItemRoseGold>, # Rose Gold Item Pipe
});

# [Animal Rancher] from [Bucket][+5]
craft.make(<industrialforegoing:animal_resource_harvester>, ["pretty",
  "R R R",
  "H ~ V",
  "N M N"], {
  "R": <industrialforegoing:plastic>,                # Plastic
  "H": <ore:toolHeadBuzzSawBlackSteel>, # Black Steel Buzzsaw Blade
  "~": <minecraft:bucket>,              # Bucket
  "V": <metaitem:robot.arm.mv>,      # MV Robot Arm
  "N": <ore:pipeNormalItemRoseGold>,    # Rose Gold Item Pipe
  "M": <metaitem:gregtech:hull.mv>,          # MV Machine Hull
});

# [Animal Sewer] from [MV Machine Hull][+3]
craft.make(<industrialforegoing:animal_byproduct_recolector>, ["pretty",
  "⌂ ⌂ ⌂",
  "R M R",
  "■ ■ ■"], {
  "⌂": <gregtech:multiblock_casing:2>, # Grate Machine Casing
  "R": <industrialforegoing:plastic>,               # Plastic
  "M": <metaitem:gregtech:hull.mv>,         # MV Machine Hull
  "■": <ore:blockBrick>,               # Bricks
});

# [Sewage Composter] from [MV Machine Hull][+5]
craft.make(<industrialforegoing:sewage_composter_solidifier>, ["pretty",
  "R v R",
  "M V M",
  "G C G"], {
  "R": <industrialforegoing:plastic>,                  # Plastic
  "v": <ore:circuitMv>,                   # Good Electronic Circuit
  "M": <metaitem:electric.pump.mv>,        # MV Electric Pump
  "V": <metaitem:gregtech:hull.mv>,            # MV Machine Hull
  "G": <ore:cableGtSingleAnnealedCopper>, # 1x Annealed Copper Cable
  "C": <ore:springCupronickel>,           # Cupronickel Spring
});

# [Black Hole Controller v2.0] from [ME Controller][+3]
craft.make(<industrialforegoing:black_hole_controller_reworked>, ["pretty",
  "H ◊ H",
  "¤ M ¤",
  "H ◊ H"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
  "◊": <ore:gemExquisiteDiamond>,            # Exquisite Diamond
  "¤": <ore:gearCrystallinePinkSlime>,       # Crystalline Pink Slime Gear
  "M": <appliedenergistics2:controller>,     # ME Controller
});

# [Black Hole Tank] from [Hermetic Casing IV][+4]
craft.make(<industrialforegoing:black_hole_tank>, ["pretty",
  "H F H",
  "◊ ⌂ ◊",
  "H V H"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
  "F": <actuallyadditions:block_laser_relay_fluids>, # Fluid Laser Relay
  "◊": <ore:gemExquisiteAmethyst>,           # Exquisite Amethyst
  "⌂": <gregtech:hermetic_casing:3>,         # Hermetic Casing IV
  "V": <metaitem:field.generator.hv>,           # HV Field Generator
});

# [Black Hole Unit] from [EV Machine Hull][+4]
craft.make(<industrialforegoing:black_hole_unit>, ["pretty",
  "H A H",
  "* E *",
  "H V H"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
  "A": <actuallyadditions:block_laser_relay_item_whitelist>, # Advanced Item Laser Relay
  "*": <ore:gemExquisiteGreenCrystal>,       # Exquisite Green Crystal
  "E": <metaitem:gregtech:hull.ev>,               # EV Machine Hull
  "V": <metaitem:field.generator.hv>,           # HV Field Generator
});

# [Plant Interactor] from [HV Machine Hull][+4]
craft.make(<industrialforegoing:plant_interactor>, ["pretty",
  "R H R",
  "H V H",
  "N u N"], {
  "R": <industrialforegoing:plastic>,                           # Plastic
  "H": <metaitem:robot.arm.hv>,                 # HV Robot Arm
  "V": <metaitem:gregtech:hull.hv>,                     # HV Machine Hull
  "N": <ore:pipeNormalRestrictiveBlackBronze>,     # Restrictive Black Bronze Item Pipe
  "u": <ore:pipeHugeFluidPolytetrafluoroethylene>, # Huge Polytetrafluoroethylene (PTFE) Fluid Pipe
});

# [Hydrator] from [HV Machine Hull][+5]
craft.make(<industrialforegoing:hydrator>, ["pretty",
  "R I R",
  "B H B",
  "N M N"], {
  "R": <industrialforegoing:plastic>,                    # Plastic
  "I": <metaitem:cover.infinite_water>,          # Infinite Water Cover
  "B": <industrialforegoing:fertilizer>,   # Fertilizer
  "H": <metaitem:gregtech:hull.hv>,              # HV Machine Hull
  "N": <ore:pipeNormalFluidStainlessSteel>, # Stainless Steel Fluid Pipe
  "M": <metaitem:field.generator.mv>,          # MV Field Generator
});

# [Fluid Crafter] from [HV Machine Hull][+4]
craft.make(<industrialforegoing:fluid_crafter>, ["pretty",
  "R C R",
  "H V H",
  "R N R"], {
  "R": <industrialforegoing:plastic>,                       # Plastic
  "C": <metaitem:cover.crafting>,                # Crafting Table Cover
  "H": <metaitem:electric.pump.hv>,             # HV Electric Pump
  "V": <metaitem:gregtech:hull.hv>,                 # HV Machine Hull
  "N": <ore:pipeNormalRestrictiveBlackBronze>, # Restrictive Black Bronze Item Pipe
});

# [Material StoneWork Factory] from [Advanced Rock Breaker III][+6]
craft.make(<industrialforegoing:material_stonework_factory>, ["pretty",
  "H a H",
  "~ d A",
  "¤ B ¤"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
  "a": <metaitem:gregtech:electric_furnace.lv>,                # Basic Electric Furnace
  "~": <minecraft:lava_bucket>,              # Lava Bucket
  "d": <metaitem:gregtech:rock_breaker.ev>,               # Advanced Rock Breaker III
  "A": <minecraft:water_bucket>,                   # Water Bucket
  "¤": <ore:gearCrystallinePinkSlime>,       # Crystalline Pink Slime Gear
  "B": <metaitem:gregtech:macerator.lv>,                # Basic Macerator
});

# [Tree Fluid Extractor] from [MV Machine Hull][+5]
craft.make(<industrialforegoing:tree_fluid_extractor>, ["pretty",
  "╱ ~ ╱",
  "V M H",
  "╱ N ╱"], {
  "╱": <ore:stickLongSteel>,           # Long Steel Rod
  "~": <minecraft:bucket>,             # Bucket
  "V": <metaitem:electric.pump.mv>,     # MV Electric Pump
  "M": <metaitem:gregtech:hull.mv>,         # MV Machine Hull
  "H": <ore:toolHeadDrillCobaltBrass>, # Cobalt Brass Drill Tip
  "N": <ore:pipeNormalFluidSteel>,     # Steel Fluid Pipe
});

# [Mob Imprisonment Tool] from [Cursed Lasso][+3]
craft.make(<industrialforegoing:mob_imprisonment_tool>, ["pretty",
  "P R P",
  "R C R",
  "P M P"], {
  "P": <ore:itemGhastTear>, # Ghast Tear
  "R": <industrialforegoing:plastic>,            # Plastic
  "C": <extrautils2:goldenlasso:1>, # Cursed Lasso
  "M": <metaitem:field.generator.mv>,  # MV Field Generator
});

# [Washing Factory] from [Advanced Chemical Bath III][+4]
craft.make(<industrialforegoing:ore_washer>, ["pretty",
  "H ⌂ H",
  "S A S",
  "¤ ⌂ ¤"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
  "⌂": <gcym:large_multiblock_casing:6>,     # Watertight Casing
  "S": <minecraft:sponge>,                   # Sponge
  "A": <metaitem:gregtech:chemical_bath.ev>,               # Advanced Chemical Bath III
  "¤": <ore:gearCrystallinePinkSlime>,       # Crystalline Pink Slime Gear
});

# [Fermentation Station] from [Advanced Fermenter III][+4]
craft.make(<industrialforegoing:ore_fermenter>, ["pretty",
  "H ⌂ H",
  "F A F",
  "¤ ⌂ ¤"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
  "⌂": <gcym:large_multiblock_casing:4>,     # Corrosion Proof Casing
  "F": <ore:foodFirmtofu>,                   # Firm Tofu
  "A": <metaitem:gregtech:fermenter.ev>,               # Advanced Fermenter III
  "¤": <ore:gearCrystallinePinkSlime>,       # Crystalline Pink Slime Gear
});

# [Fluid Sieving Machine] from [Advanced Sifting Machine III][+4]
craft.make(<industrialforegoing:ore_sieve>, ["pretty",
  "H ⌂ H",
  "E A E",
  "s ⌂ s"], {
  "H": <ore:pipeHugeFluidPolybenzimidazole>,  # Huge Polybenzimidazole (PBI) Fluid Pipe
  "⌂": <gcym:large_multiblock_casing:5>,      # Vibration-Safe Casing
  "E": <metaitem:electric.pump.ev>,            # EV Electric Pump
  "A": <metaitem:gregtech:sifter.ev>,                # Advanced Sifting Machine III
  "s": <ore:slimeballPink>, # Pink Slime
});

# [Wither Builder] from [HV Machine Hull][+4]
craft.make(<industrialforegoing:wither_builder>, ["pretty",
  "S S S",
  "H V H",
  "R u R"], {
  "S": <minecraft:skull:1>,                            # Wither Skeleton Skull
  "H": <metaitem:robot.arm.hv>,                 # HV Robot Arm
  "V": <metaitem:gregtech:hull.hv>,                     # HV Machine Hull
  "R": <industrialforegoing:plastic>,                           # Plastic
  "u": <ore:pipeHugeFluidPolytetrafluoroethylene>, # Huge Polytetrafluoroethylene (PTFE) Fluid Pipe
});

# [Mob Crusher] from [HV Machine Hull][+5]
craft.make(<industrialforegoing:mob_relocator>, ["pretty",
  "D S D",
  "H M H",
  "R V R"], {
  "D": <extrautils2:spike_diamond>, # Diamond Spikes
  "S": <metaitem:sensor.hv>,  # HV Sensor
  "H": <metaitem:electric.piston.hv>,  # HV Electric Piston
  "M": <metaitem:gregtech:hull.hv>,      # HV Machine Hull
  "R": <industrialforegoing:plastic>,            # Plastic
  "V": <metaitem:electric.pump.hv>,  # HV Electric Pump
});

# [Mob Duplicator] from [LuV Machine Hull][+4]
craft.make(<industrialforegoing:mob_duplicator>, ["pretty",
  "S u S",
  "S L S",
  "⌂ H ⌂"], {
  "S": <actuallyadditions:item_misc:20>,     # Spawner Shards
  "u": <metaitem:field.generator.luv>,           # LuV Field Generator
  "L": <metaitem:gregtech:hull.luv>,               # LuV Machine Hull
  "⌂": <gcym:large_multiblock_casing:2>,     # Large-Scale Assembler Casing
  "H": <ore:pipeHugeFluidPolybenzimidazole>, # Huge Polybenzimidazole (PBI) Fluid Pipe
});

# [Mob Detector] from [HV Machine Hull][+5]
craft.make(<industrialforegoing:mob_detector>, ["pretty",
  "R H R",
  "A V E",
  "R G R"], {
  "R": <industrialforegoing:plastic>,           # Plastic
  "H": <metaitem:sensor.hv>, # HV Sensor
  "A": <metaitem:cover.activity.detector>, # Activity Detector
  "V": <metaitem:gregtech:hull.hv>,     # HV Machine Hull
  "E": <integrateddynamics:part_entity_reader_item>, # Entity Reader
  "G": <ore:cableGtOctalSteel>,    # 8x Steel Cable
});

# [Mob Slaughter Factory] from [EV Machine Hull][+5]
craft.make(<industrialforegoing:mob_slaughter_factory>, ["pretty",
  "T ○ T",
  "E V E",
  "R N R"], {
  "T": <metaitem:component.grinder.tungsten>,             # Tungsten Grinding Head
  "○": <metaitem:electric.pump.ev>,             # EV Electric Pump
  "E": <metaitem:electric.motor.ev>,             # EV Electric Motor
  "V": <metaitem:gregtech:hull.ev>,                 # EV Machine Hull
  "R": <industrialforegoing:plastic>,                       # Plastic
  "N": <ore:pipeNormalFluidPolybenzimidazole>, # Polybenzimidazole (PBI) Fluid Pipe
});

# [Protein Reactor] from [Advanced Chemical Reactor III][+4]
craft.make(<industrialforegoing:protein_reactor>, ["pretty",
  "R ⌂ R",
  "~ A ~",
  "H ⌂ H"], {
  "R": <industrialforegoing:plastic>,                        # Plastic
  "⌂": <gcym:large_multiblock_casing:9>,        # Reaction-Safe Mixing Casing
  "~": <metaitem:food.kebab.chum.bucket>, # Chum Bucket Kebab Mix
  "A": <metaitem:gregtech:chemical_reactor.ev>,                  # Advanced Chemical Reactor III
  "H": <ore:pipeHugeFluidPolybenzimidazole>,    # Huge Polybenzimidazole (PBI) Fluid Pipe
});

# [Bioreactor] from [Advanced Chemical Reactor III][+4]
craft.make(<industrialforegoing:bioreactor>, ["pretty",
  "R ⌂ R",
  "K A K",
  "H ⌂ H"], {
  "R": <industrialforegoing:plastic>,                        # Plastic
  "⌂": <gcym:large_multiblock_casing:9>,        # Reaction-Safe Mixing Casing
  "K": <metaitem:food.kebab.soltani>, # Kebab e Soltani!
  "A": <metaitem:gregtech:chemical_reactor.ev>,                  # Advanced Chemical Reactor III
  "H": <ore:pipeHugeFluidPolybenzimidazole>,    # Huge Polybenzimidazole (PBI) Fluid Pipe
});

# [Fluid Dictionary Converter] from [Basic Buffer][+1]
craft.remake(<industrialforegoing:fluiddictionary_converter>, ["pretty",
  "  P",
  "  B"], {
  "P": <metaitem:circuit.integrated>.withTag({Configuration: 0}), # Programmed Circuit
  "B": <metaitem:gregtech:buffer.lv>, # Basic Buffer
});

