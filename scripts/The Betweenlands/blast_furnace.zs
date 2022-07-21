import mods.gregtech.blocks.HeatingCoils;
print("==================== loading blast_furnace.zs ====================");
##########################################################################################


// register a heating coil made from Minecraft's Dirt
// 1400K temperature
// Level 2 (32 * 2 multismelter parallel)
// Discount 4 (16 / 4 EU/t in multismelter per item)
// Tier 3 (used for discount in the cracker and pyrolyse oven)
// Material null (uses the Dirt block for JEI name)
HeatingCoils.add(<blockstate:contenttweaker:machine_coil_octine>, "octine", 1800, 2, 4, 3, <material:octine>);


<contenttweaker:machine_coil_octine>.addTooltip("Base Heat Capacity: " + format.yellow("1800K"));
<contenttweaker:machine_coil_octine>.addShiftTooltip((format.green("Multi Smelter"))+":","Hold " + (format.green("Shift")) + " for more info");
<contenttweaker:machine_coil_octine>.addShiftTooltip(" Max Parallel: " + format.yellow("64"));
<contenttweaker:machine_coil_octine>.addShiftTooltip(" Energy Usage: " + format.yellow("4 EU/t per recipe"));
<contenttweaker:machine_coil_octine>.addShiftTooltip(format.green("Pyrolyse Oven")+":");
<contenttweaker:machine_coil_octine>.addShiftTooltip(" Processing Speed: " + format.yellow("150%"));
<contenttweaker:machine_coil_octine>.addShiftTooltip(format.green("Cracking Unit")+":");
<contenttweaker:machine_coil_octine>.addShiftTooltip(" Energy Usage: " + format.yellow("90%"));

// register a heating coil made from Minecraft's Oak Planks
// 1900K temperature
// Level 1 (32 * 1 multismelter parallel)
// Discount 2 (16/2 EU/t in multismelter per item)
// Tier 3 (used for discount in the cracker and pyrolyse oven)
// Material Silver (uses the Silver material for JEI name)
//HeatingCoils.add(<blockstate:minecraft:planks:variant=oak>, "planks", 1900, 1, 2, 3, <material:silver>);
##########################################################################################
print("==================== end of blast_furnace.zs ====================");
