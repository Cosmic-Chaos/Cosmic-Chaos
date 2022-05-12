/*import crafttweaker.item.IItemStack;
import mods.enderio.SagMill;
import mods.enderio.AlloySmelter;
import mods.enderio.Vat;

print("==================== loading mods blank.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<furnaceoverhaul:iron_furnace>,
	<enderio:item_alloy_endergy_ingot>,	
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Iron Hull Furnace 
val anyIronPlate as IIngredient = (<contenttweaker:hull_plate_t1>|<ore:plateIron>) as IIngredient;
recipes.addShaped(<furnaceoverhaul:iron_furnace>, [
	[anyIronPlate, anyIronPlate, anyIronPlate],
	[anyIronPlate, null, anyIronPlate], 
	[anyIronPlate, anyIronPlate, anyIronPlate]
]);

//Internals t1
SagMill.addRecipe([<minecraft:redstone>,<metaitem:dustCoal>,<minecraft:glowstone_dust>], [1,0.9,0.60] , <contenttweaker:internals_t1>, "MULTIPLY_OUTPUT");

//Internals t2
SagMill.addRecipe([<metaitem:dustDiamond>,<enderio:item_material:20>,<enderio:item_material:62>], [1,0.9,0.50] , <contenttweaker:internals_t2>, "MULTIPLY_OUTPUT");

//Iron Hull
SagMill.addRecipe([<metaitem:dustIron>,<metaitem:dustLead>,<metaitem:dustTin>], [1, 0.75, 0.66], <contenttweaker:hull_plate_t1>, "MULTIPLY_OUTPUT");

//Copper Hull
SagMill.addRecipe([<metaitem:dustCopper>,<metaitem:dustGold>,<metaitem:dustZinc>], [1,0.5,0.33] , <contenttweaker:hull_plate_t2>, "MULTIPLY_OUTPUT");

//Dense Hull
SagMill.addRecipe([<metaitem:dustCrudeSteel>,<metaitem:dustObsidian>,<metaitem:dustAluminium>], [1, 0.55, 0.33], <contenttweaker:hull_plate_t3>, "MULTIPLY_OUTPUT");

//Fancy Hull
SagMill.addRecipe([<metaitem:dustSilver>,<metaitem:dustNetherQuartz>,<metaitem:dustLapis>], [1, 0.75, 0.60], <contenttweaker:hull_plate_t4>, "MULTIPLY_OUTPUT");

##########################################################################################
print("==================== end of mods blank.zs ====================");*/
