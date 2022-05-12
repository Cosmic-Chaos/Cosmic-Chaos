
//#priority 100
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;

import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.material.Material;
import mods.gregtech.recipe.IRecipeUtils;

print("==================== loading new_component_recipes.zs ====================");
##########################################################################################


///////////////// SHEETS ///////////////////
val sheet as OrePrefix = OrePrefix.getPrefix("sheet");
/*
val sheetMap as IItemStack[IOreDictEntry] = {
    <ore:plateIron>:<ore:sheetIron>.firstItem,
    <ore:plateCopper>:<ore:sheetCopper>.firstItem,
    <ore:plateGold>:<ore:sheetGold>.firstItem,
    <ore:plateBronze>:<ore:sheetBronze>.firstItem,
    <ore:plateTin>:<ore:sheetTin>.firstItem
} as IItemStack[IOreDictEntry];

for plate, sheet in sheetMap {
    recipes.addShaped(sheet, [[<ore:gtceSaws>, plate]]);
    cutter.recipeBuilder().EUt(7).duration(200)
        .fluidInputs(<liquid:lubricant>)
        .inputs(plate)
        .outputs(sheet * 2)
    .buildAndRegister();
}
*/


sheet.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    val utils as IRecipeUtils = IRecipeUtils.utils;

    recipes.addShaped(utils.item(orePrefix, material), [
        [<ore:gtceSaws>, utils.ore("plate", material)]
    ]);

    cutter.recipeBuilder().EUt(7).duration(200)
        .fluidInputs(<liquid:lubricant>)
        .inputs(utils.ore("plate", material))
        .outputs(utils.item(orePrefix, material)*2)
    .buildAndRegister();

} as IOreRecipeHandler);




##########################################################################################
print("==================== end of new_component_recipes.zs ====================");
