# [Template Manager] from [Advanced Buffer II][+1]
craft.remake(<buildinggadgets:templatemanager>, ["pretty",
  "C C C",
  "C A C",
  "C C C"], {
  "C": <buildinggadgets:constructionpaste>, # Construction Paste
  "A": <metaitem:gregtech:buffer.hv>,             # Advanced Buffer II
});

# [Building Gadget] from [User Interface][+6]
craft.remake(<buildinggadgets:buildingtool>, ["pretty",
  "◊ M V",
  "o U T",
  "  Σ  "], {
  "◊": <ore:gemExquisiteLazurite>, # Exquisite Lazurite
  "M": <metaitem:field.generator.mv>, # MV Field Generator
  "V": <metaitem:sensor.mv>, # MV Sensor
  "o": <ore:craftingToolWrench>, # Neutronium Wrench
  "U": <advancedrocketry:misc:0>,    # User Interface
  "T": <ore:craftingToolScrewdriver>, # Neutronium Screwdriver
  "Σ": <metaitem:power_unit.mv>, # Power Unit (MV)
});

# [Exchanging Gadget] from [User Interface][+6]
craft.remake(<buildinggadgets:exchangertool>, ["pretty",
  "◊ M V",
  "o U T",
  "  Σ  "], {
  "◊": <ore:gemExquisiteCinnabar>, # Exquisite Cinnabar
  "M": <metaitem:field.generator.mv>, # MV Field Generator
  "V": <metaitem:sensor.mv>, # MV Sensor
  "o": <ore:craftingToolWrench>, # Neutronium Wrench
  "U": <advancedrocketry:misc:0>,    # User Interface
  "T": <ore:craftingToolScrewdriver>, # Neutronium Screwdriver
  "Σ": <metaitem:power_unit.mv>, # Power Unit (MV)
});

# [Copy-Paste Gadget] from [User Interface][+6]
craft.remake(<buildinggadgets:copypastetool>, ["pretty",
  "◊ H V",
  "o U T",
  "  Σ  "], {
  "◊": <ore:gemExquisiteFluix>,    # Exquisite Fluix
  "H": <metaitem:field.generator.hv>, # HV Field Generator
  "V": <metaitem:sensor.hv>, # HV Sensor
  "o": <ore:craftingToolWrench>, # Neutronium Wrench
  "U": <advancedrocketry:misc:0>,    # User Interface
  "T": <ore:craftingToolScrewdriver>, # Neutronium Screwdriver
  "Σ": <metaitem:power_unit.hv>, # Power Unit (HV)
});

recipes.removeByRecipeName("buildinggadgets:destructiontool");
# [Destruction Gadget] from [User Interface][+6]
craft.remake(<buildinggadgets:destructiontool>, ["pretty",
  "D M V",
  "o U T",
  "  Σ  "], {
  "D": <metaitem:dynamite>, # Dynamite
  "M": <metaitem:field.generator.mv>, # MV Field Generator
  "V": <metaitem:sensor.mv>, # MV Sensor
  "o": <ore:craftingToolWrench>, # Neutronium Wrench
  "U": <advancedrocketry:misc:0>,    # User Interface
  "T": <ore:craftingToolScrewdriver>, # Neutronium Screwdriver
  "Σ": <metaitem:power_unit.mv>, # Power Unit (MV)
});

