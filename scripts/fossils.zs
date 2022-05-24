import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading fossils.zs ====================");
##########################################################################################



// Bio-Goo -> Output (n)
<fossil:bio_goo>.addTooltip(format.yellow("Hold Shift to see Analyzer chances."));
val bioGooMap as int[IItemStack] = {
    <quark:root>:20,
    <fossil:sheep_dna>:10,
    <fossil:rabbit_dna>:10,
    <minecraft:slime_ball>:25,
	<metaitem:rubber_drop>:25,
	<minecraft:tallgrass:1>:10,
} as int[IItemStack];

for output, n in bioGooMap {
mods.fossils.recipes.addAnalyzerOutput(<fossil:bio_goo>, output, n);
<fossil:bio_goo>.addShiftTooltip(format.yellow("- " + n ~ "% chance to give " + output.displayName + " when analyzed."));
}


##########################################################################################
print("==================== end of fossils.zs ====================");
