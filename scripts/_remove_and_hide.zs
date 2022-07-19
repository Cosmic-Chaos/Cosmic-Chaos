import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide;
import mods.jei.JEI.hideCategory;
print("==================== loading mods blank.zs ====================");
#########################################################################################

val itemstoRemoveAndHide =
[


// LV Machines
<gregtech:machine:560>, //Laser
<gregtech:machine:245>, //Cutting Machine
<gregtech:machine:320>, //Extruder
//<gregtech:machine:605>, //Thermal Centerfuge
//<gregtech:machine:425>, //Forming Press

<projecte:collector_mk1>,
<projecte:collector_mk2>,
<projecte:collector_mk3>,
<projecte:relay_mk1>,
<projecte:relay_mk2>,
<projecte:relay_mk3>,
<projectex:energy_link>,
<extrautils2:machine>.withTag({Type: "extrautils2:furnace"}),
<extrautils2:machine>.withTag({Type: "extrautils2:crusher"}),
<extrautils2:machine>.withTag({Type: "extrautils2:generator_overclock"}),
<extrautils2:machine>.withTag({Type: "extrautils2:generator"}),
<extrautils2:machine>.withTag({Type: "extrautils2:generator_survival"}),
<equivadditions:collector_mk4>,
<industrialforegoing:pitiful_fuel_generator>,
<libvulpes:coalgenerator>,
<rftools:coalgenerator>,
<microblockcbe:saw_diamond>,
<microblockcbe:saw_iron>,
<microblockcbe:saw_stone>,
<actuallyadditions:block_coal_generator>,
<actuallyadditions:block_leaf_generator>,

<appliedenergistics2:material:40>,
<teslacorelib:gear_stone>,
<actuallyadditions:block_grinder>,
<actuallyadditions:block_grinder_double>,
<enderio:block_simple_crafter>,
<enderio:block_simple_wired_charger>,
<enderio:block_simple_stirling_generator>,
<libvulpes:productrod:1>,
<libvulpes:productrod:2>,
<libvulpes:productrod:3>,
<libvulpes:productrod:4>,
<libvulpes:productrod:5>,
<libvulpes:productrod:6>,
<libvulpes:productrod:7>,
<teslacorelib:gear_diamond>,
<teslacorelib:gear_gold>,
<teslacorelib:gear_iron>,
<extrautils2:machine>,
<advancedrocketry:basiclasergun>,
<appliedenergistics2:grindstone>,
<enderio:block_alloy_smelter>,
<enderio:block_enhanced_alloy_smelter>,
<enderio:block_stirling_generator>,
<enderio:block_simple_furnace>,
<enderio:block_enhanced_sag_mill>,
<enderio:block_enhanced_combustion_generator>,
<enderio:block_wired_charger>,
<enderio:block_enhanced_wired_charger>,
<enderio:block_lava_generator>,
<enderio:block_enhanced_vat>,
<enderio:block_combustion_generator>,
<enderio:block_simple_alloy_smelter>,
<enderio:item_endergy_conduit:0>,
<enderio:item_liquid_conduit:0>,
<enderio:block_sag_mill>,
<enderio:block_simple_sag_mill>,
<enderio:block_dark_paper_anvil:0>,
<enderio:block_dark_paper_anvil:1>,
<enderio:block_dark_paper_anvil:2>,

<advancedrocketry:electrolyser>,
<advancedrocketry:arcfurnace>, // Only AR multiblock left is the Assembler, might remove still
<advancedrocketry:crystallizer>,
<advancedrocketry:chemicalreactor>,
<advancedrocketry:cuttingmachine>,
<advancedrocketry:lathe>,
<advancedrocketry:rollingmachine>,
<advancedrocketry:sawbladeiron>,
<advancedrocketry:liquidtank>,
<advancedrocketry:precisionassemblingmachine>,
<advancedrocketry:precisionlaseretcher>,
<advancedrocketry:centrifuge>,
<advancedrocketry:blackholegenerator>,
<advancedrocketry:blockpump>,
<advancedrocketry:quartzcrucible>,
<advancedrocketry:solarpanel>,
<advancedrocketry:solararraypanel>,
<advancedrocketry:forcefieldprojector>,
<advancedrocketry:vacuumlaser>,
<advancedrocketry:solargenerator>,
<advancedrocketry:microwavereciever>,
<advancedrocketry:solararray>,
<advancedrocketry:biomescanner>,
<advancedrocketry:railgun>,
<advancedrocketry:spaceelevatorcontroller>,
<advancedrocketry:terraformer>,
<advancedrocketry:satelliteprimaryfunction:5>,//biome changer
<advancedrocketry:satelliteprimaryfunction:3>,//microwave emitter (power gen)
<advancedrocketry:biomechanger>,//biome changer remote
//<advancedrocketry:jetpack>,
<advancedrocketry:orescanner>,
<advancedrocketry:itemupgrade:1>,//flight speed control upgrade
<advancedrocketry:hovercraft>,
<advancedrocketry:lens>,//basic lens
<advancedrocketry:misc:1>,//carbon brick
<advancedrocketry:elevatorchip>,
<advancedrocketry:ic:0>,//basic circuit
<advancedrocketry:ic:2>,//advanced circuit
<advancedrocketry:ic:3>,//control circuit
<advancedrocketry:ic:4>,//item circuit
<advancedrocketry:ic:5>,//liquid circuit
<libvulpes:productboule:3>,//silicon boule
<advancedrocketry:wafer:0>,//silicon wafer
<advancedrocketry:itemcircuitplate:0>,//basic wafer
<advancedrocketry:itemcircuitplate:1>,//advanced wafer

<nuclearcraft:alloy_furnace>, // Only NC Machines left are the Fuel Reprocessor and Decay Hastener, might remove still
<nuclearcraft:separator>,
<nuclearcraft:infuser>,
<nuclearcraft:melter>,
<nuclearcraft:electrolyzer>,
<nuclearcraft:assembler>,
<nuclearcraft:ingot_former>,
<nuclearcraft:pressurizer>,
<nuclearcraft:chemical_reactor>,
<nuclearcraft:salt_mixer>,
<nuclearcraft:crystallizer>,
<nuclearcraft:enricher>,
<nuclearcraft:extractor>,
<nuclearcraft:centrifuge>,

<metaitem:steam_boiler_coal_bronze>, //Steam multiblocks are left for now
<metaitem:steam_boiler_solar_bronze>,
<metaitem:steam_boiler_lava_bronze>,
<metaitem:steam_extractor_bronze>,
<metaitem:steam_macerator_bronze>,
<metaitem:steam_rock_breaker_bronze>,
<metaitem:steam_compressor_bronze>,
<metaitem:steam_hammer_bronze>,
<metaitem:steam_furnace_bronze>,
<metaitem:steam_alloy_smelter_bronze>,

<metaitem:steam_boiler_coal_steel>,
<metaitem:steam_boiler_solar_steel>,
<metaitem:steam_boiler_lava_steel>,
<metaitem:steam_extractor_steel>,
<metaitem:steam_macerator_steel>,
<metaitem:steam_rock_breaker_steel>,
<metaitem:steam_compressor_steel>,
<metaitem:steam_hammer_steel>,
<metaitem:steam_furnace_steel>,
<metaitem:steam_alloy_smelter_steel>,

<metaitem:steam_miner>,
<metaitem:gregtech:primitive_blast_furnace.bronze>,

<harvestcraft:shippingbin>,
<harvestcraft:market>,
<harvestcraft:well>,
<harvestcraft:watertrap>, // gtceu already adds fishers
<harvestcraft:waterfilter>,
<harvestcraft:grinder>,
<harvestcraft:apiary>,
<harvestcraft:presser>,
<harvestcraft:honeycombitem>,
<harvestcraft:wovencottonitem>,
<harvestcraft:fishtrapbaititem>,
<farmingforblockheads:market>,
<farmingforblockheads:feeding_trough>,

<futuremc:acacia_trapdoor>,
<futuremc:jungle_trapdoor>,
<futuremc:birch_trapdoor>,
<futuremc:spruce_trapdoor>,
<futuremc:dark_oak_trapdoor>, // quark also adds trapdoors
<futuremc:brick_wall>,
<futuremc:granite_wall>,
<futuremc:andesite_wall>,
<futuremc:diorite_wall>,
<futuremc:sandstone_wall>,
<futuremc:red_sandstone_wall>,
<futuremc:stone_brick_wall>,
<futuremc:mossy_stone_brick_wall>,
<futuremc:nether_brick_wall>,
<futuremc:red_nether_brick_wall>,
<futuremc:end_stone_brick_wall>,
<futuremc:prismarine_wall>,

<industrialforegoing:petrified_fuel_generator>,// rf gen
<industrialforegoing:enchantment_extractor>,// pnc pressure chamber
<industrialforegoing:enchantment_aplicator>,// pnc pressure chamber
<industrialforegoing:potion_enervator>,// vanilla/gtceu brewing
<industrialforegoing:water_resources_collector>,// vanilla/gtceu fishing
<industrialforegoing:block_destroyer>,// IT/gtceu/ae
<industrialforegoing:block_placer>,// IT/gtceu/ae
<industrialforegoing:lava_fabricator>,// ID/AA
<industrialforegoing:black_hole_controller>,// mk2
<industrialforegoing:dye_mixer>,// gtceu dye mixing
<industrialforegoing:enchantment_invoker>,// fishing
<industrialforegoing:resourceful_furnace>,// gtceu
<industrialforegoing:oredictionary_converter>,// exploit haven
<industrialforegoing:item_splitter>,// any other item transport
<industrialforegoing:biofuel_generator>,// rf gen
<industrialforegoing:protein_generator>,// rf gen
<industrialforegoing:froster>,// gtceu
<industrialforegoing:enchantment_refiner>,// IT/eio
<industrialforegoing:crop_sower>,// farming station
<industrialforegoing:crop_recolector>,// farming station
<industrialforegoing:crop_enrich_material_injector>,// farming station
<industrialforegoing:energy_field_provider>,// xu2 wireless battery
<industrialforegoing:fluid_pump>,// gtceu
<industrialforegoing:water_condensator>,// gtceu/xu2/cookingforblockheads
<industrialforegoing:latex_processing_unit>,// can add recipe for latex -> tiny dry rubber
<industrialforegoing:ore_processor>,// player sim/mek user
<industrialforegoing:villager_trade_exchanger>,// come on, you know why
<teslacorelib:machine_case>,

<actuallyadditions:block_fishing_net>,
<actuallyadditions:block_miner>,
<actuallyadditions:block_farmer>,
<actuallyadditions:block_bio_reactor>,
<actuallyadditions:block_oil_generator>,
<actuallyadditions:block_feeder>,
<actuallyadditions:block_furnace_double>,
<actuallyadditions:block_furnace_solar>,
<actuallyadditions:block_heat_collector>,
<actuallyadditions:item_color_lens>,
<actuallyadditions:item_mining_lens>,

<industrialrenewal:small_wind_blade>,
<industrialrenewal:small_wind_turbine>,
<industrialrenewal:small_wind_turbine_pillar>,
<industrialrenewal:dam_intake>,
<industrialrenewal:infinity_generator>,
<industrialrenewal:portable_generator>,
<industrialrenewal:dam_generator>,
<industrialrenewal:dam_outflow>,
<industrialrenewal:dam_turbine>,
<industrialrenewal:chunk_loader>,
<industrialrenewal:eotm>,
<industrialrenewal:eotm_andrboot>,
<industrialrenewal:eotm_ic2exp>,
<industrialrenewal:gutter>,
<industrialrenewal:solar_panel>,
<industrialrenewal:solar_panel_frame>,
<industrialrenewal:steam_boiler>,
<industrialrenewal:steam_turbine>,
<industrialrenewal:dam_axis>,
<industrialrenewal:coil_hv>,
<industrialrenewal:barrel_item>,
<industrialrenewal:firebox_solid>,
<industrialrenewal:firebox_fluid>,
<industrialrenewal:battery>,
<industrialrenewal:battery_lithium>,
<industrialrenewal:battery_bank>,
<industrialrenewal:ind_battery_bank>,
<industrialrenewal:lathe>,
<industrialrenewal:isolator_hv>,
<industrialrenewal:energy_cable_lv>,
<industrialrenewal:energy_cable>,
<industrialrenewal:energy_cable_hv>,
<industrialrenewal:cable_tray>,
<industrialrenewal:fluid_pipe>,
<industrialrenewal:energy_switch>,
<industrialrenewal:valve_pipe_large>,
<industrialrenewal:electric_pump>,
<industrialrenewal:trash>,
<industrialrenewal:transformer_hv>,

<contenttweaker:vent_dirty_1>,
<contenttweaker:vent_dirty_2>,
<contenttweaker:vent_dirty_3>,
<contenttweaker:vent_dirty_carbon_1>,
<contenttweaker:vent_dirty_carbon_2>,
<contenttweaker:vent_dirty_carbon_3>,
<contenttweaker:crystal_cluster_blue_1>,
<contenttweaker:crystal_cluster_blue_2>,
<contenttweaker:crystal_cluster_blue_3>,
<contenttweaker:crystal_cluster_blue_4>,
<contenttweaker:crystal_cluster_blue_5>,
<contenttweaker:crystal_cluster_blue_6>,
<contenttweaker:crystal_cluster_blue_7>,
<contenttweaker:crystal_cluster_green_1>,
<contenttweaker:crystal_cluster_green_2>,
<contenttweaker:crystal_cluster_green_3>,
<contenttweaker:crystal_cluster_green_4>,
<contenttweaker:crystal_cluster_green_5>,
<contenttweaker:crystal_cluster_green_6>,
<contenttweaker:crystal_cluster_green_7>,
<contenttweaker:crystal_cluster_red_1>,
<contenttweaker:crystal_cluster_red_2>,
<contenttweaker:crystal_cluster_red_3>,
<contenttweaker:crystal_cluster_red_4>,
<contenttweaker:crystal_cluster_red_5>,
<contenttweaker:crystal_cluster_red_6>,
<contenttweaker:crystal_cluster_red_7>,
<contenttweaker:crystal_cluster_cyan_1>,
<contenttweaker:crystal_cluster_cyan_2>,
<contenttweaker:crystal_cluster_cyan_3>,
<contenttweaker:crystal_cluster_cyan_4>,
<contenttweaker:crystal_cluster_cyan_5>,
<contenttweaker:crystal_cluster_cyan_6>,
<contenttweaker:crystal_cluster_cyan_7>,
<contenttweaker:crystal_cluster_magenta_1>,
<contenttweaker:crystal_cluster_magenta_2>,
<contenttweaker:crystal_cluster_magenta_3>,
<contenttweaker:crystal_cluster_magenta_4>,
<contenttweaker:crystal_cluster_magenta_5>,
<contenttweaker:crystal_cluster_magenta_6>,
<contenttweaker:crystal_cluster_magenta_7>,
<contenttweaker:crystal_cluster_yellow_1>,
<contenttweaker:crystal_cluster_yellow_2>,
<contenttweaker:crystal_cluster_yellow_3>,
<contenttweaker:crystal_cluster_yellow_4>,
<contenttweaker:crystal_cluster_yellow_5>,
<contenttweaker:crystal_cluster_yellow_6>,
<contenttweaker:crystal_cluster_yellow_7>,
<contenttweaker:crystal_cluster_white_1>,
<contenttweaker:crystal_cluster_white_2>,
<contenttweaker:crystal_cluster_white_3>,
<contenttweaker:crystal_cluster_white_4>,
<contenttweaker:crystal_cluster_white_5>,
<contenttweaker:crystal_cluster_white_6>,
<contenttweaker:crystal_cluster_white_7>,

//Unneeded Ingots
<erebus:materials:44>,
<erebus:materials:45>,
<erebus:materials:46>,
<nuclearcraft:alloy>,
<nuclearcraft:ingot:1>,
<nuclearcraft:ingot:13>,
<nuclearcraft:ingot:2>,
<nuclearcraft:ingot>,
]
 as IItemStack[];

for item in itemstoRemoveAndHide {
	removeAndHide(item);
}

val itemstoRemove =
[
<enderio:item_material:53>,
<enderio:item_material:54>,
<enderio:item_material:55>,
<enderio:item_material:66>,
<enderio:item_material>,
<enderio:item_material:1>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}


var name_removals = [
    "futuremc:oak_trap_door",
    "aether_legacy:saddle", // gtceu adds a recipe
    "harvestcraft:freshwateritem_listallwater",
    "erebus:honey_comb",
    "harvestcraft:honeycomb",
    "harvestcraft:wool_0",
    "harvestcraft:minecraft_leather_leggings",
    "harvestcraft:minecraft_leather_helmet",
    "harvestcraft:minecraft_leather_chestplate",
    "harvestcraft:minecraft_leather_boots",
    "harvestcraft:leather_leggings",
    "harvestcraft:leather_helmet",
    "harvestcraft:leather_chestplate",
    "harvestcraft:leather_boots",
    "gregtech:cauldron",
    "gregtechfoodoption:gtfo_hand_zest1",
    "gregtechfoodoption:gtfo_hand_zest2",
    "gregtechfoodoption:gtfo_hand_zest3",
    "gregtechfoodoption:gtfo_hand_kubide_kebab_meat",
    "gregtechfoodoption:gtfo_hand_kubide_kebab",
    "gregtechfoodoption:gtfo_hand_barg_kebab_meat",
    "gregtechfoodoption:gtfo_hand_barg_kebab",
    "gregtechfoodoption:gtfo_hand_tomato_kebab",
    "gregtechfoodoption:gtfo_hand_onion_kebab",
    "industrialforegoing:black_hole_controller_reworked_black_hole_controller_deprecated",
    "industrialforegoing:tree_fluid_extractor",
    "effortlessbuilding:reach_upgrade1",
    "effortlessbuilding:reach_upgrade2",
    "effortlessbuilding:reach_upgrade3",
    "danknull:dank_null_1",
    "danknull:dank_null_2",
    "danknull:dank_null_3",
    "danknull:dank_null_4",
    "danknull:dank_null_5",
    "fluxnetworks:item.fluxnetworks.fluxcore",
    "akashictome:tome",
    "akashictome:tome_1",
    "advancedrocketry:guidancecomputer",
    "advancedrocketry:rocketbuilder",
    "advancedrocketry:engine",
    "advancedrocketry:blockfueltank",
    "advancedrocketry:planetidchip",
    "midnight:ebonys_block",
] as string[];

for item in name_removals {
    recipes.removeByRecipeName(item);
}

var category_removals = [
	"jehc.presser",
	"jehc.apiary",
	"jehc.water_trap",
	"jehc.grinder",
	"jehc.waterfilter",
	"industrialrenewal.lathe",
	"gregtech:primitive_blast_furnace",
] as string[];

for name in category_removals {
	hideCategory(name);
}

// remove bugged sponge iron recipe
furnace.remove(<gregtech:meta_ingot:0>);

//Cheap Hoppper
recipes.removeShaped(<minecraft:hopper>, [[<minecraft:iron_ingot>, null, <minecraft:iron_ingot>],[<minecraft:iron_ingot>, <ore:chestWood>, <minecraft:iron_ingot>], [null, <minecraft:iron_ingot>, null]]);
##########################################################################################
print("==================== end of mods blank.zs ====================");
