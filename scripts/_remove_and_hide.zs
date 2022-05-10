import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide;
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

<advancedrocketry:electrolyser>, // Only AR multiblock left is the Assembler, might remove still
<advancedrocketry:arcfurnace>,
<advancedrocketry:crystallizer>,
<advancedrocketry:chemicalreactor>,
<advancedrocketry:cuttingmachine>,
<advancedrocketry:lathe>,
<advancedrocketry:rollingmachine>,

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



//Cheap Hoppper
recipes.removeShaped(<minecraft:hopper>, [[<minecraft:iron_ingot>, null, <minecraft:iron_ingot>],[<minecraft:iron_ingot>, <ore:chestWood>, <minecraft:iron_ingot>], [null, <minecraft:iron_ingot>, null]]);
##########################################################################################
print("==================== end of mods blank.zs ====================");
