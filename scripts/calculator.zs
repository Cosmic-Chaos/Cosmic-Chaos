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
	[<metaitem:plateRedAlloy>, <calculator:calculatorscreen>, <metaitem:plateRedAlloy>],
	[<quark:iron_button>, <calculator:calculatorassembly>, <quark:iron_button>], 
	[<ore:plateTin>, <ore:plateTin>, <ore:plateTin>]
]);

recipes.addShaped(<calculator:calculatorscreen>, [
	[<metaitem:plateCupronickel>, <metaitem:plateCupronickel>, <metaitem:plateCupronickel>],
	[<ore:paneGlassColorless>, <ore:paneGlassColorless>, <ore:paneGlassColorless>], 
	[<metaitem:plateCupronickel>, <metaitem:plateCupronickel>, <metaitem:plateCupronickel>]
]);

/*
recipes.addShaped(<calculator:calculatorassembly>, [
	[<metaitem:foilBrass>, <quark:iron_button>, <metaitem:foilBrass>],
	[<quark:iron_button>, <metaitem:plateCupronickel>, <quark:iron_button>], 
	[<metaitem:foilBrass>, <quark:iron_button>, <metaitem:foilBrass>]
]);*/





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
