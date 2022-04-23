
#priority 100
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

print("==================== loading new_component_recipes.zs ====================");
##########################################################################################


////////////////// SHEETS ///////////////////
val sheetMap as IItemStack[IOreDictEntry] = {
    <ore:plateIron>:<ore:sheetIron>.firstItem,
    <ore:plateCopper>:<ore:sheetCopper>.firstItem,
    <ore:plateGold>:<ore:sheetGold>.firstItem,
    <ore:plateTin>:<ore:sheetTin>.firstItem,
    <ore:plateBronze>:<ore:sheetBronze>.firstItem,
} as IItemStack[IOreDictEntry];

for plate, sheet in sheetMap {
    recipes.addShaped(sheet*2, [[<ore:gtceSaws>, plate]]);
    cutting_saw.recipeBuilder()
        .fluidInputs(<liquid:lubricant>)
        .inputs(plate)
        .outputs(sheet*2)
        .EUt(7)
        .duration(200)
    .buildAndRegister();
}

##########################################################################################
print("==================== end of new_component_recipes.zs ====================");
