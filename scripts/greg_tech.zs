import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IIngredient;
print("==================== loading gregtech.zs ====================");
##########################################################################################

val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Glass Tubes
recipes.addShaped(<metaitem:component.glass.tube>, [
	[null, <ore:paneGlassColorless>, null],
	[<ore:paneGlassColorless>, null, <ore:paneGlassColorless>], 
	[null, <ore:paneGlassColorless>, null]
]);

//Wrought Iron temp
furnace.addRecipe(<metaitem:ingotIron>, <metaitem:ingotWroughtIron>, 0.1);

/*
val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/
##########################################################################################
print("==================== end of gregtech.zs ====================");
