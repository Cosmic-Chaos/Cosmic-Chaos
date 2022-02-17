#loader contenttweaker
#priority 91
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;


print("==================== loading Items.zs ====================");
##########################################################################################





VanillaFactory.createItem("hull_plate_t1").register();
VanillaFactory.createItem("broken_hull_plate_t1").register();
VanillaFactory.createItem("hull_plate_t2").register();
VanillaFactory.createItem("broken_hull_plate_t2").register();
VanillaFactory.createItem("hull_plate_t3").register();
VanillaFactory.createItem("broken_hull_plate_t3").register();
VanillaFactory.createItem("hull_plate_t4").register();

VanillaFactory.createItem("scrap_rubber").register();

VanillaFactory.createItem("dust_crystal_green").register();
VanillaFactory.createItem("dust_crystal_green_glass").register();

VanillaFactory.createItem("internals_t1").register();

VanillaFactory.createItem("internals_t2").register();

VanillaFactory.createItem("internals_t3").register();

VanillaFactory.createItem("internals_t4").register();

VanillaFactory.createItem("purpleprint").register();

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



##########################################################################################
print("==================== end of Items.zs ====================");