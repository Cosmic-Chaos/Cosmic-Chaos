import mods.gregtech.blocks.HeatingCoils;
print("==================== loading blast_furnace.zs ====================");
##########################################################################################
val HeatProofCasing = <gregtech:metal_casing:2>;

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


# Syrmorite Casing Recipes
recipes.addShaped("heat_proof_casing_syrmorite", HeatProofCasing * 2,
[
    [<ore:plateSyrmorite>,<ore:craftingToolHardHammer>,<ore:plateSyrmorite>],
    [<ore:plateSyrmorite>,<ore:frameGtSyrmorite>,<ore:plateSyrmorite>],
    [<ore:plateSyrmorite>,<ore:craftingToolWrench>,<ore:plateSyrmorite>]
]);

<recipemap:assembler>.recipeBuilder()
    .inputs(<ore:plateSyrmorite> * 6)
    .inputs(<ore:frameGtSyrmorite> * 1)
    .circuit(6)
    .outputs(HeatProofCasing * 2)
    .EUt(16)
    .duration(50)
    .buildAndRegister();

# Coil Recipe
<recipemap:assembler>.recipeBuilder()
    .inputs(<ore:wireGtDoubleOctine> * 8)
    .inputs(<ore:foilSyrmorite> * 8)
    .fluidInputs(<liquid:tin_alloy> * 144)
    .circuit(6)
    .outputs(<contenttweaker:machine_coil_octine> * 1)
    .EUt(30)
    .duration(200)
    .buildAndRegister();

// register a heating coil made from Minecraft's Oak Planks
// 1900K temperature
// Level 1 (32 * 1 multismelter parallel)
// Discount 2 (16/2 EU/t in multismelter per item)
// Tier 3 (used for discount in the cracker and pyrolyse oven)
// Material Silver (uses the Silver material for JEI name)
//HeatingCoils.add(<blockstate:minecraft:planks:variant=oak>, "planks", 1900, 1, 2, 3, <material:silver>);
##########################################################################################
print("==================== end of blast_furnace.zs ====================");
