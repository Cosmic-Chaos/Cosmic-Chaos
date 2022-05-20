
//#priority 100
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;

import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.material.Material;
import mods.gregtech.recipe.Utils;

print("==================== loading new_component_recipes.zs ====================");
##########################################################################################


///////////////// SHEETS ///////////////////
val sheet as OrePrefix = OrePrefix.getPrefix("sheet");

sheet.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
//    val utils as IRecipeUtils = IRecipeUtils.utils;

    recipes.addShaped(Utils.item(orePrefix, material), [
        [<ore:gtceSaws>, Utils.ore("plate", material)]
    ]);

    cutter.recipeBuilder().EUt(7).duration(200)
        .fluidInputs(<liquid:lubricant>)
        .inputs(Utils.ore("plate", material))
        .outputs(Utils.item(orePrefix, material)*2)
    .buildAndRegister();

} as IOreRecipeHandler);




##########################################################################################
print("==================== end of new_component_recipes.zs ====================");
