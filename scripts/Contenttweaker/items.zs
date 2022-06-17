#loader contenttweaker
#priority 91
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemColorSupplier;
import mods.contenttweaker.Color;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.ItemFood;


print("==================== loading Items.zs ====================");
##########################################################################################


function itemColor(intColor as int) as IItemColorSupplier {
  return function(item as IItemStack, tint as int) as Color {
      return Color.fromInt(intColor);
  };
}

var simpleItems = [
	//Station Items
  "vat_print",
  "cooling_element",
  "heating_element",
  "stator",
  "rough_redstone_crystal",
  "fuel_catalyst",

	//Station Materials
  "flexible_organic_panel",
  "blue_crystal_dust_inert",
  "blue_crystal_dust",
  "dust_crystal_green_glass",
  "dust_crystal_purple_glass",
  "root_paper",
  "root_pulp",
  "dense_dust",
  "light_dust",
  "heavy_dust",
  "scrap_rubber",

  //GT Items
  "mold_rod",
] as string[];

for item in simpleItems {
	VanillaFactory.createItem(item).register();
}

val crowbar = VanillaFactory.createItem("crowbar");
crowbar.maxStackSize = 1;
crowbar.rarity = "UNCOMMON";
crowbar.toolClass = "pickaxe";
crowbar.maxDamage = 128;
crowbar.toolLevel = 1;
crowbar.register();

val crowbar_t2 = VanillaFactory.createItem("crowbar_t2");
crowbar_t2.maxStackSize = 1;
crowbar_t2.rarity = "UNCOMMON";
crowbar_t2.toolClass = "pickaxe";
crowbar_t2.maxDamage = 256;
crowbar_t2.toolLevel = 1;
crowbar_t2.register();

/*
var componentsULV = (itemColor(0xf0821d));

val emitterULV = VanillaFactory.createItem("emitter_ulv");
emitterULV.itemColorSupplier = componentsULV;
emitterULV.register();
*/

val cannedBeans = VanillaFactory.createItemFood("canned_beans", 8);
cannedBeans.saturation = 0.25;
cannedBeans.register();

val cannedCorn = VanillaFactory.createItemFood("canned_corn", 4);
cannedCorn.saturation = 2;
cannedCorn.register();
##########################################################################################
print("==================== end of Items.zs ====================");