import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
import mods.actuallyadditions.AtomicReconstructor;
print("==================== loading mods blank.zs ====================");
##########################################################################################
/*
val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

val basicCapacitorInput as IIngredient = (<enderio:item_capacitor_grainy>|<enderio:item_material:20>*2) as IIngredient;

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/

//Crystal converting recipes removed
val crystalMap as IItemStack[IItemStack] = {
<actuallyadditions:item_crystal:5>:<actuallyadditions:item_crystal_shard:5>,
<actuallyadditions:item_crystal:4>:<actuallyadditions:item_crystal_shard:4>,
<actuallyadditions:item_crystal:3>:<actuallyadditions:item_crystal_shard:3>,
<actuallyadditions:item_crystal:2>:<actuallyadditions:item_crystal_shard:2>,
<actuallyadditions:item_crystal:1>:<actuallyadditions:item_crystal_shard:1>,
<actuallyadditions:item_crystal>:<actuallyadditions:item_crystal_shard>,
} as IItemStack[IItemStack];
for crystal, shard in crystalMap {
recipes.removeShaped(crystal, [[shard, shard, shard],[shard, shard, shard], [shard, shard, shard]]);
recipes.removeShapeless(shard * 9, [crystal]);
//AtomicReconstructor.removeRecipe(crystal);
}


//Red Shards burn 32 items
furnace.setFuel(<actuallyadditions:item_crystal_shard>, 6400);

AtomicReconstructor.removeRecipe(<actuallyadditions:item_color_lens>);
AtomicReconstructor.removeRecipe(<actuallyadditions:item_explosion_lens>);
AtomicReconstructor.addRecipe(<actuallyadditions:item_explosion_lens>, <actuallyadditions:item_misc:18>, 10000);
AtomicReconstructor.addRecipe(<minecraft:web>, <harvestcraft:pamspiderweb>, 1000);

<actuallyadditions:item_knife>.maxDamage = 200;
##########################################################################################
print("==================== end of mods blank.zs ====================");
