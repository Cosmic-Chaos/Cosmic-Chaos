import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
import mods.calculator.basic;

print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<calculator:calculator>,
	<calculator:calculatorscreen>,
	<calculator:calculatorassembly>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Enriched Coal for steel
basic.addRecipe(<metaitem:dustCoal>, <ore:dustRedstone>, <calculator:enrichedcoal>);

//Tier one calc stuff
recipes.addShaped(<calculator:calculator>, [
	[<gregtech:meta_item_2:32572>, <calculator:calculatorscreen>, <gregtech:meta_item_2:32572>],
	[<quark:iron_button>, <calculator:calculatorassembly>, <quark:iron_button>], 
	[<ore:plateTin>, <ore:plateTin>, <ore:plateTin>]
]);

recipes.addShaped(<calculator:calculatorscreen>, [
	[<gregtech:meta_item_2:32572>, <gregtech:meta_item_2:32572>, <gregtech:meta_item_2:32572>],
	[<ore:paneGlassColorless>, <ore:paneGlassColorless>, <ore:paneGlassColorless>], 
	[<gregtech:meta_item_2:32572>, <gregtech:meta_item_2:32572>, <gregtech:meta_item_2:32572>]
]);

recipes.addShaped(<calculator:calculatorassembly> * 4, [
	[<ore:foilZinc>, <quark:iron_button>, <ore:foilZinc>],
	[<quark:iron_button>, <gregtech:meta_item_2:32572>, <quark:iron_button>], 
	[<ore:foilZinc>, <quark:iron_button>, <ore:foilZinc>]
]);





/*
//First Stack is second in the list
val clusterFluidMap as ILiquidStack[IOreDictEntry] = {
val tinyDustMap as IItemStack[IItemStack] = {


} as IItemStack[IItemStack];
for tinyDust, material in tinyDustMap {

	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


val basicCapacitorInput as IIngredient = (<enderio:item_capacitor_grainy>|<enderio:item_material:20>*2) as IIngredient;

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/
##########################################################################################
print("==================== end of mods blank.zs ====================");
