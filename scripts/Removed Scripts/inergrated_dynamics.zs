#modloaded integrateddynamics
import crafttweaker.item.IItemStack;
import mods.integrateddynamics.Squeezer;
import mods.integrateddynamics.DryingBasin;

print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<integrateddynamics:squeezer>,
	<integrateddynamics:drying_basin>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}



//Squezzer
recipes.addShaped(<integrateddynamics:squeezer>, [
	[<gregtech:meta_item_1:14197>, <gtadditions:ga_meta_item:1035>, <gregtech:meta_item_1:14197>],
	[<gregtech:meta_item_1:14197>, <minecraft:redstone>, <gregtech:meta_item_1:14197>], 
	[<gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12033>, <gregtech:meta_item_1:12033>]
]);

//Bio Goo
Squeezer.addRecipe(<minecraft:mutton>, <fossil:bio_goo>*3, null);


//Drying Basin
recipes.addShaped(<integrateddynamics:drying_basin>, [
	[<ore:plateIron>, null, <ore:plateIron>],
	[<ore:plateIron>, <minecraft:redstone>, <ore:plateIron>], 
	[<ore:stickWroughtIron>, <ore:plateIron>, <ore:stickWroughtIron>]
]);

//Block of Meat for no reason at all
DryingBasin.addRecipe(null, <liquid:protein> * 1000, <gregtech:meta_block_compressed_62:4>, null, 100);


##########################################################################################
print("==================== end of mods blank.zs ====================");
