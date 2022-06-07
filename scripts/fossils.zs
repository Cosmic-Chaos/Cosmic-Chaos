import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading fossils.zs ====================");
##########################################################################################



# [Culture Vat] from [Evertide Amulet][+3]
craft.remake(<fossil:cultivate>, ["pretty",
  "* B *",
  "* E *",
  "□ □ □"], {
  "*": <contenttweaker:crystal_green_glass>, # Green Crystal Glass
  "B": <ore:circuitLv>,                     # Bio-Goo
  "E": <ore:listAllwater>|<projecte:item.pe_evertide_amulet>,   # Evertide Amulet
  "□": <ore:plateWroughtIron>,               # Wrought Iron Plate
});

# [Analyzer] from [Biofossil][+3]
craft.remake(<fossil:analyzer>, ["pretty",
  "□ U □",
  "□ f □",
  "□ a □"], {
  "□": <ore:plateWroughtIron>, # Wrought Iron Plate
  "U": <ore:circuitUlv>,       # Vacuum Tube
  "f": <fossil:biofossil>,         # Biofossil
  "a": <fossil:relic_scrap>,       # Relic Scrap
});


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
