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
    "minecraft:hopper"
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