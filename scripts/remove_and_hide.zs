import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide;
print("==================== loading mods blank.zs ====================");
#########################################################################################

val itemstoRemoveAndHide =
[
<gregtech:machine_casing:10>,
<gregtech:machine_casing:11>,
<gregtech:machine_casing:12>,
<gregtech:machine_casing:13>,
<gregtech:machine:1>,
<gregtech:machine:10>,
<gregtech:machine:11>,
<gregtech:machine:12>,
<gregtech:machine:13>,
<gregtech:machine:14>,
<gregtech:machine:15>,
<gregtech:machine:16>,
<gregtech:machine:17>,
<gregtech:machine:18>,
<gregtech:machine:2>,
<gregtech:machine:2232>,
<gregtech:machine:2235>,
<gregtech:machine:3>,
<gregtech:machine:5>,
<gregtech:machine:6>,
<gregtech:machine:7>,
<gregtech:machine:8>,
<gregtech:machine:9>,
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
<draconicevolution:generator>,
<industrialforegoing:pitiful_fuel_generator>,
<libvulpes:coalgenerator>,
<rftools:coalgenerator>,
<microblockcbe:saw_diamond>,
<microblockcbe:saw_iron>,
<microblockcbe:saw_stone>,
<actuallyadditions:block_coal_generator>,
<actuallyadditions:block_leaf_generator>,
<appliedenergistics2:material:40>,
<gregtech:meta_item_2:26196>,
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
<tinymobfarm:wood_farm>,
<tinymobfarm:stone_farm>,
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
<gregtech:machine:4175>,
<gregtech:machine:4176>,
<gregtech:machine:4177>,
<gregtech:machine:4178>,
<gregtech:machine:4197>,
<enderio:block_simple_alloy_smelter>,
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
