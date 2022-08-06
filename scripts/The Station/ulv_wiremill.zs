import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;

import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.material.Material;
import mods.gregtech.recipe.Utils;

print("==================== loading The Station/ulv_wiremill.zs ====================");
##########################################################################################

/////////////////////////////////////////////////////////////////////
///////////////////////////// WIREMILL /////////////////////////////
/////////////////////////////////////////////////////////////////////


# [Primitive Wiremill] from [ULV Machine Hull][+3]
craft.remake(<metaitem:devtech:station_wiremill.ulv>, ["pretty",
  "U G U",
  "l L l",
  "U G U"], {
  "U": <metaitem:electric.motor.ulv>, # ULV Electric Motor
  "G": <ore:cableGtSingleLead>,            # 1x Lead Cable
  "l": <metaitem:circuit.vacuum_tube>,                   # Vacuum Tube
  "L": <metaitem:hull.ulv>,             # ULV Machine Hull
});

///////////////// Wires ///////////////////
val wire as OrePrefix = OrePrefix.getPrefix("wireGtSingle");

wire.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
<recipemap:station_wiremill>.recipeBuilder().duration(50).EUt(8)
	.inputs(Utils.ore("stick", material))
	.outputs(Utils.item(orePrefix, material))
.buildAndRegister();
} as IOreRecipeHandler);


##########################################################################################
print("==================== end of The Station/ulv_wiremill.zs ====================");
