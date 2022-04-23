#loader gregtech
#priority 1001
import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;
import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.material.IMaterialPredicate;
import mods.gregtech.recipe.helpers;
import mods.advancedrocketry.RollingMachine;
import mods.gregtech.MaterialFlag;
import mods.gregtech.MaterialFlagBuilder;
import mods.gregtech.MetaItem;

print("==================== loading new_components.zs ====================");
##########################################################################################

MaterialFlagBuilder.create("generate_thin_sheet")
    .requireFlag("generate_plate").build();

<material:tin>.addFlags("generate_thin_sheet");
<material:bronze>.addFlags("generate_thin_sheet");
<material:gold>.addFlags("generate_thin_sheet");


// addItem(short id, string name).long maxCharge, int tier, @Optional boolean rechargeable (default true), @Optional boolean dischrgeable (default true)

//Green Battery
MetaItem.create(1, "battery_crystal_green").electricItem(24000, 0);

//Old Battery
MetaItem.create(2, "battery_station_ulv").electricItem(96000, 0);



###################################################
################ NEW COMPONENTS ###################
###################################################



val sheet as OrePrefix = OrePrefix.registerOrePrefix("sheet", 1);

sheet.setGenerationPredicate(function(mat as Material) as bool {
    //return mat.hasIngot();
    return mat.hasFlag("generate_thin_sheet");  
} as IMaterialPredicate);
sheet.createMaterialItem();





##########################################################################################
print("==================== end of new_components.zs ====================");