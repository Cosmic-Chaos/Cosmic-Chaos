import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;

// Crafting Table ----------------------------------------------------

var name_removals = [
    // Clay
    "gregtech:block_decompress_clay",
    // Integrated Circuit
    "gtadditions:basic_to_configurable_circuit",
    // Nuggets
    "gregtech:nugget_disassembling_emerald",
    "gregtech:nugget_disassembling_diamond",
    "advancedrocketry:unpacknuggetcopper",
    "advancedrocketry:unpacknuggettin",
    "advancedrocketry:unpacknuggetiridium",
    "advancedrocketry:unpacknuggetsteel",
    // Block Unpacking
    "advancedrocketry:unpacknuggettitanium",
    "advancedrocketry:unpacknuggetsilicon",
    "advancedrocketry:unpackblockcopper",
    "advancedrocketry:unpackblocktin",
    "advancedrocketry:unpackblockaluminum",
    // Dusts
    "enderio:ender_dust",
    // Glass Panes
    "enderio:compatibility_glass_pane",
    // Gears
    "enderio:gear_just_to_be_sure",
    "enderio:gear_better_save_than_sorry",
    "enderio:gear_wood",
    "enderio:gear_ae2_messes_things_up",
    "enderio:gear_stone",
    // Chests
    "enderio:tweak_chest_from_wood",
    // Nuggets to Ingots
    "advancedrocketry:unpackingotcopper",
    "advancedrocketry:unpackingottin",
    "advancedrocketry:unpackingotaluminum",
    "advancedrocketry:unpackingotiridium",
    "advancedrocketry:unpackingotsteel",
    // Blocks
    "nuclearcraft:tile.compressed",
    "advancedrocketry:packblockcopper",
    "advancedrocketry:packblocktin",
    "advancedrocketry:packblockaluminum",
    "advancedrocketry:packblocksteel",
    "advancedrocketry:packblockiridium",
    "advancedrocketry:packblocktitanium",
    "appliedenergistics2:decorative/quartz_block_pure",
    // Other
    "quark:hopper",
    "enderio:tweak_wood_hopper",
    "minecraft:hopper",

/* Done in config with every other one
    //EIO Stuff
    "enderio:auto_crude_steel_1_block_to_9_ingots",
    "enderio:auto_crude_steel_9_ingots_to_1_block",
    "enderio:auto_crude_steel_1_ingot_to_9_nuggets",
    "enderio:auto_crude_steel_9_nuggets_to_1_ingot",
*/
    "lucraftcore:nugget_vibranium",
    "lucraftcore:block_vibranium",
    "lucraftcore:ingot_vibranium",
    "lucraftcore:ingot_vibranium_alt",

    "lucraftcore:nugget_uru",
    "lucraftcore:block_uru",
    "lucraftcore:ingot_uru",
    "lucraftcore:ingot_uru_alt",

    "lucraftcore:nugget_adamantium",
    "lucraftcore:block_adamantium",
    "lucraftcore:ingot_adamantium",
    "lucraftcore:ingot_adamantium_alt",

    "lucraftcore:nugget_dwarf_star_alloy",
    "lucraftcore:block_dwarf_star_alloy",
    "lucraftcore:ingot_dwarf_star_alloy",
    "lucraftcore:ingot_dwarf_star_alloy_alt",

    "lucraftcore:nugget_copper",
    "lucraftcore:block_copper",
    "lucraftcore:ingot_copper",
    "lucraftcore:ingot_copper_alt",

    "lucraftcore:nugget_bronze",
    "lucraftcore:block_bronze",
    "lucraftcore:ingot_bronze",
    "lucraftcore:ingot_bronze_alt",

    "lucraftcore:nugget_silver",
    "lucraftcore:block_silver",
    "lucraftcore:ingot_silver",
    "lucraftcore:ingot_silver_alt",

    "lucraftcore:nugget_lead",
    "lucraftcore:block_lead",
    "lucraftcore:ingot_lead",
    "lucraftcore:ingot_lead_alt",

    "lucraftcore:nugget_tin",
    "lucraftcore:block_tin",
    "lucraftcore:ingot_tin",
    "lucraftcore:ingot_tin_alt",

    "thebetweenlands:scabyst_from_block",
    "thebetweenlands:scabyst_block",

    "thebetweenlands:octine_block",
    "thebetweenlands:octine_ingot",

    "thebetweenlands:valonite_shard",
    "thebetweenlands:valonite_block",
    "thebetweenlands:valonite_splinter",
    //"thebetweenlands:valonite_shard_from_splinters", // No gt recipe for this

    "thebetweenlands:symorite_block",
    "thebetweenlands:symorite_ingot",

    "gregtech:block_compress_sulfur",
    "gregtech:block_decompress_sulfur",

] as string[];

for item in name_removals {
    recipes.removeByRecipeName(item);
}

// Furnace ----------------------------------------------------

var furnace_removals = [
    <metaitem:ingotAluminium>,
    <metaitem:ingotBlackSteel>,
    <metaitem:ingotTungsten>,
    <metaitem:ingotTitanium>,
    <metaitem:ingotOsmium>,
    <minecraft:coal:1>
] as IIngredient[];

for item in furnace_removals {
    furnace.remove(item);
}