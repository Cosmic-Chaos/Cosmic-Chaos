import crafttweaker.item.IItemStack;
print("==================== loading extra_utilities.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<extrautils2:teleporter:1>,
	<extrautils2:terraformer:9>,
	<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}),
	<extrautils2:machine>.withTag({Type: "extrautils2:generator"}),
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

recipes.addShaped(<extrautils2:terraformer:9>, [[<gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12111>, <gregtech:meta_item_1:12033>],[<ore:sapling>, <gregtech:machine:501>, <ore:sapling>], [<gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12111>, <gregtech:meta_item_1:12033>]]);
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), [[null, <ore:bookEnchanted>, null],[<gregtech:meta_item_1:12111>, <gregtech:machine:501>, <gregtech:meta_item_1:12111>], [<gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12033>]]);
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator"}), [[<gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12033>],[<gregtech:meta_item_1:12033>, <gregtech:machine:501>, <gregtech:meta_item_1:12033>], [<gregtech:cable:5237>, <furnaceoverhaul:iron_furnace>, <gregtech:cable:5237>]]);

//Teleporter
recipes.addShaped(<extrautils2:teleporter:1>, [
	[<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>],
	[<extrautils2:compressedcobblestone:7>, <gtadditions:ga_meta_item:32343>, <extrautils2:compressedcobblestone:7>], 
	[<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>]
]);

/*
<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}
*/

##########################################################################################
print("==================== end of extra_utilities.zs ====================");
