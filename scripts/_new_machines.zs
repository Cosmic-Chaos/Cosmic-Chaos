#loader gregtech
#priority 1002
import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;
print("==================== loading new_machines.zs ====================");
##########################################################################################

// Replaced by ULV Vat multiblock
/*
//Brewer
MachineBuilder.create(32100, "brewery")
.setRecipeMap(RecipeMaps.BREWING_RECIPES)
.setRenderer("machines/brewery")
.addTier(0)
.buildAndRegister();
// Goes in en_us.lang
//devtech.machine.brewery.ulv.name=Primitive Brewery
*/

//Scrap Sorter
MachineBuilder.create(32101, "electromagnetic_separator")
.setRecipeMap(RecipeMaps.ELECTROMAGNETIC_SEPARATOR_RECIPES)
.setRenderer("machines/electromagnetic_separator")
.addTier(0)
.buildAndRegister();
##########################################################################################
print("==================== end of new_machines.zs ====================");
