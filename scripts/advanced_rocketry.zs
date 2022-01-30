import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
print("==================== loading advanced_rocketry.zs ====================");
##########################################################################################

val itemstoRemove =
[
	<advancedrocketry:fueltank>,
	<advancedrocketry:misc>,
	<advancedrocketry:oxygencharger>,
	<advancedrocketry:thermite>,
	<advancedrocketry:spaceboots>,
	<advancedrocketry:spaceleggings>,
	<advancedrocketry:spacehelmet>,
	<advancedrocketry:spacechestplate>,
	<libvulpes:structuremachine>,
	<advancedrocketry:jetpack>,
//	<simplyjetpacks:metaitemmods:8>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}


	// Fuel Tank
assembler.recipeBuilder()
	.outputs(<advancedrocketry:fueltank>)
    .inputs(<ore:plateSteel>*4)
    .inputs(<ore:stickSteel>*4)
    .inputs(<ore:ringSteel>)
	.EUt(30)
	.duration(120)
	.buildAndRegister();

//User Interface
recipes.addShaped(<advancedrocketry:misc>, [
	[<ore:dustRegularGlowstone>, <ore:paneGlassColorless>, <ore:dustRegularGlowstone>], 
	[<ore:dustRegularRedstone>, <ore:circuitBasic>, <ore:dustRegularRedstone>]
]);

//Gas Charger
recipes.addShaped(<advancedrocketry:oxygencharger>, [
	[<ore:rotorSteel>, <advancedrocketry:misc>, <ore:rotorSteel>],
	[<advancedrocketry:fueltank>, <libvulpes:structuremachine>, <advancedrocketry:fueltank>], 
	[<ore:plateSteel>, <minecraft:heavy_weighted_pressure_plate>, <ore:plateSteel>]
]);

//Space Suit
recipes.addShaped(<advancedrocketry:spacehelmet>, [
	[<ore:plateIron>, <ore:stickIron>, <ore:plateIron>],
	[<ore:stickIron>, <ore:paneGlassColorless>, <ore:stickIron>], 
	[<ore:wool>, <ore:wool>, <ore:wool>]
]);
recipes.addShaped(<advancedrocketry:spacechestplate>, [
	[<ore:wool>, <ore:stickIron>, <ore:wool>],
	[<ore:wool>, <advancedrocketry:fueltank>, <ore:wool>], 
	[<ore:wool>, <ore:rotorSteel>, <ore:wool>]
]);
recipes.addShaped(<advancedrocketry:spaceleggings>, [
	[<ore:wool>, <ore:stickIron>, <ore:wool>],
	[<ore:wool>, null, <ore:wool>], 
	[<ore:wool>, null, <ore:wool>]
]);
recipes.addShaped(<advancedrocketry:spaceboots>, [
	[null, <ore:stickIron>, null],
	[<ore:wool>, null, <ore:wool>], 
	[<ore:plateIron>, null, <ore:plateIron>]
]);

//Frame
recipes.addShaped(<libvulpes:structuremachine> * 2, [
	[<ore:stickIron>, <ore:plateIron>, <ore:stickIron>],
	[<ore:plateIron>, null, <ore:plateIron>], 
	[<ore:stickIron>, <ore:plateIron>, <ore:stickIron>]
]);
recipes.addShaped(<libvulpes:structuremachine> * 4, [
	[<ore:stickWroughtIron>, <ore:plateWroughtIron>, <ore:stickWroughtIron>],
	[<ore:plateWroughtIron>, null, <ore:plateWroughtIron>], 
	[<ore:stickWroughtIron>, <ore:plateWroughtIron>, <ore:stickWroughtIron>]
]);
recipes.addShaped(<libvulpes:structuremachine> * 8, [
	[<ore:stickSteel>, <ore:plateSteel>, <ore:stickSteel>],
	[<ore:plateSteel>, null, <ore:plateSteel>], 
	[<ore:stickSteel>, <ore:plateSteel>, <ore:stickSteel>]
]);

//Thermite
recipes.addShapeless(<advancedrocketry:thermite> * 3, [<ore:dustAluminium>,<ore:dustIron>,<ore:dustIron>]);



val anyTank as IIngredient = (<advancedrocketry:pressuretank>|<advancedrocketry:pressuretank:1>|<advancedrocketry:pressuretank:2>|<advancedrocketry:pressuretank:3>) as IIngredient;
val basicCapacitor as IIngredient = (<enderio:item_basic_capacitor>|<enderio:item_capacitor_silver>) as IIngredient;

/*
// Jetpack
recipes.addShaped(<simplyjetpacks:metaitemmods:8>, [
	[<ore:plateElectricalSteel>, basicCapacitor, <ore:plateElectricalSteel>],
	[<enderio:item_power_conduit>, basicCapacitor, <enderio:item_power_conduit>], 
	[<ore:stickElectricalSteel>, <ore:wireGtQuadrupleRedAlloy>, <ore:stickElectricalSteel>]
]);

assembler.recipeBuilder()
	.outputs(<advancedrocketry:jetpack>)
    .inputs(anyTank*2)
    .inputs(<simplyjetpacks:metaitemmods:8>*2)
    .inputs(<simplyjetpacks:metaitem:4>)
	.EUt(30)
	.duration(120)
	.buildAndRegister();
*/
	// Hover
assembler.recipeBuilder()
	.outputs(<advancedrocketry:itemupgrade>)
    .inputs(<advancedrocketry:ic:3>)
    .inputs(<ore:circuitGood>)
    .inputs(<ore:wireFineRedAlloy>*4)
	.EUt(100)
	.duration(250)
	.buildAndRegister();

##########################################################################################
print("==================== end of advanced_rocketry.zs ====================");
