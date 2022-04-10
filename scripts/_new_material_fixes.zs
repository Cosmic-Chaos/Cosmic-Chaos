
#priority 1000
import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;
print("==================== loading new_materials.zs ====================");
##########################################################################################

//Fix Materials

/////////////////////////////////////////////////////////
////////////////       Ender IO         /////////////////
/////////////////////////////////////////////////////////

// Dark Steel
<ore:gearDarkSteel>.add(<enderio:item_material:73>);
// Vibrant Alloy
<ore:gearVibrantAlloy>.add(<enderio:item_material:13>);

// Energetic Alloy
<ore:gearEnergeticAlloy>.add(<enderio:item_material:12>);


/////////////////////////////////////////////////////////
/////////////////       Lucidcraft      /////////////////
/////////////////////////////////////////////////////////


// Dwarf Star Alloy
<ore:blockDwarfStarAlloy>.add(<lucraftcore:block_dwarf_star_alloy>);
furnace.remove(<lucraftcore:ingot_dwarf_star_alloy>, <lucraftcore:ore_dwarf_star_alloy>);
furnace.remove(<lucraftcore:ingot_dwarf_star_alloy>, <lucraftcore:dust_dwarf_star_alloy>);




// Uru
<ore:oreUru>.remove(<lucraftcore:ore_uru>);
JEI.removeAndHide(<lucraftcore:ore_uru>);
furnace.remove(<lucraftcore:ingot_uru>, <lucraftcore:dust_uru>);
furnace.remove(<lucraftcore:ingot_uru>, <lucraftcore:ore_uru>);

// Vibranium
<ore:oreVibranium>.remove(<lucraftcore:ore_vibranium>);
JEI.removeAndHide(<lucraftcore:ore_vibranium>);
furnace.remove(<lucraftcore:ingot_vibranium>, <lucraftcore:dust_vibranium>);
furnace.remove(<lucraftcore:ingot_vibranium>, <lucraftcore:ore_vibranium>);

// Adamantium
furnace.remove(<lucraftcore:ingot_adamantium>, <lucraftcore:dust_adamantium>);

/////////////////////////////////////////////////////////
////////////////////       AE 2      ////////////////////
/////////////////////////////////////////////////////////


// Fluix
<ore:gemFluix>.add(<appliedenergistics2:material:7>);
<ore:blockFluix>.add(<appliedenergistics2:fluix_block>);

// Sky Stone
<ore:skyStone>.add(<appliedenergistics2:sky_stone_block>);
<ore:dustSkyStone>.add(<appliedenergistics2:material:45>);

/////////////////////////////////////////////////////////
//////////////////       Custom         /////////////////
/////////////////////////////////////////////////////////

##########################################################################################
print("==================== end of new_materials.zs ====================");
