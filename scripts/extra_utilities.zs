import crafttweaker.item.IItemStack;
print("==================== loading extra_utilities.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<extrautils2:teleporter:1>,
	<extrautils2:terraformer:9>,
	<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}),
	<extrautils2:machine>.withTag({Type: "extrautils2:generator"}),
	<extrautils2:ingredients>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

# [Resonating Redstone Crystal] from [Red Crystal Shard][+1]
craft.remake(<contenttweaker:rough_redstone_crystal>, ["pretty",
  "  ♥  ",
  "♥ * ♥",
  "  ♥  "], {
  "♥": <ore:dustRedstone>,                     # Redstone
  "*": <actuallyadditions:item_crystal_shard>, # Red Crystal Shard
});
furnace.addRecipe(<extrautils2:ingredients>, <contenttweaker:rough_redstone_crystal>, 0.0);


/*
//Teleporter
recipes.addShaped(<extrautils2:teleporter:1>, [
	[<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>],
	[<extrautils2:compressedcobblestone:7>, <gtadditions:ga_meta_item:32343>, <extrautils2:compressedcobblestone:7>], 
	[<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>]
]);
*/


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
