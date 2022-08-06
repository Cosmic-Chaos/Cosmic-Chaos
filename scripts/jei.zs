import crafttweaker.item.IItemStack;

print("==================== loading The Station/jei.zs ====================");
##########################################################################################

//Not sure why these are needed all the sudden. Guessing maybe Multiblocked?
var catagoryRemovals = [
    "Painter",
	"EIOWC",
	"EIOWO",
	"AlloySmelter",
	"CombustionGenerator",
	"SagMill",
	"GrindingBall",
	"StirlingGenerator",
	"LavaGenerator",
	//"SliceNSPlice",
	//"SolarPanel",
	//"SoulBinder",
	//"Enchanter",
	//"EIOTank",
	//"Vat",

	"xu2_machine_extrautils2:furnace",
	"xu2_machine_extrautils2:crusher",
	"xu2_machine_extrautils2:generator_survival",
	"xu2_machine_extrautils2:generator",
	"xu2_machine_extrautils2:generator_overclock",
	//"extrautils2.blockPatterns",
	//"extrautils2.terraformer",
	//"extrautils2.resonator",
	//"xu2_machine_extrautils2:enchanter",
	//"xu2_machine_extrautils2:generator_culinary",
	//"xu2_machine_extrautils2:generator_lava",
	//"xu2_machine_extrautils2:generator_redstone",
	//"xu2_machine_extrautils2:generator_ender",
	//"xu2_machine_extrautils2:generator_potion",
	//"xu2_machine_extrautils2:generator_pink",
	//"xu2_machine_extrautils2:generator_tnt",
	//"xu2_machine_extrautils2:generator_netherstar",
	//"xu2_machine_extrautils2:generator_dragonsbreath",
	//"xu2_machine_extrautils2:generator_ice",
	//"xu2_machine_extrautils2:generator_death",
	//"xu2_machine_extrautils2:generator_enchant",
	//"xu2_machine_extrautils2:generator_slime",

	"nuclearcraft_manufactory",
	"nuclearcraft_separator",
	"nuclearcraft_alloy_furnace",
	"nuclearcraft_infuser",
	"nuclearcraft_melter",
	"nuclearcraft_electrolyzer",
	"nuclearcraft_assembler",
	"nuclearcraft_ingot_former",
	"nuclearcraft_pressurizer",
	"nuclearcraft_chemical_reactor",
	"nuclearcraft_salt_mixer",
	"nuclearcraft_crystallizer",
	"nuclearcraft_enricher",
	"nuclearcraft_extractor",
	"nuclearcraft_centrifuge",
	"nuclearcraft_pebble_fission",
	//"nuclearcraft_decay_hastener",
	//"nuclearcraft_fuel_reprocessor",
	//"nuclearcraft_supercooler",
	//"nuclearcraft_rock_crusher",
	//"nuclearcraft_collector",
	//"nuclearcraft_decay_generator",
	//"nuclearcraft_fission_moderator",
	//"nuclearcraft_fission_reflector",
	//"nuclearcraft_fission_irradiator",
	//"nuclearcraft_solid_fission",
	//"nuclearcraft_fission_heating",
	//"nuclearcraft_salt_fission",
	//"nuclearcraft_coolant_heater",
	//"nuclearcraft_emergency_cooling",
	//"nuclearcraft_heat_exchanger",
	//"nuclearcraft_condenser",
	//"nuclearcraft_high_turbine",
	//"nuclearcraft_radiation_scrubber",

	"zmaster587.AR.rollingMachine",
	"zmaster587.AR.lathe",
	"zmaster587.AR.precisionAssembler",
	"zmaster587.AR.sawMill",
	"zmaster587.AR.chemicalReactor",
	"zmaster587.AR.crystallizer",
	"zmaster587.AR.electrolyzer",
	"zmaster587.AR.arcFurnace",
	"zmaster587.AR.centrifuge",
	"zmaster587.AR.precisionlaseretcher",
	//"zmaster587.AR.platePresser",

	"appliedenergistics2.grinder",
	"petrified_burn_time",
	"jehc.shippingbin",
	"jehc.market",
	"farmingforblockheads:market",
] as string[];

for item in catagoryRemovals {
	mods.jei.JEI.hideCategory(item);
}




##=======================================================
## RECIPE REMOVAL
##=======================================================
val itemstoRemove =
[
	<quark:iron_button>,
	<quark:gold_button>,
	<industrialforegoing:petrified_fuel_generator>,
	<fossil:bio_goo>,
	<actuallyadditions:item_knife>,
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

var name_removals = [
    "gregtech:electric_motor_lv_iron",
] as string[];

for item in name_removals {
    recipes.removeByRecipeName(item);
}

##=======================================================
## HIDING ITEMS IN JEI
##=======================================================

val itemstoRemoveAndHide =
[
	<actuallyadditions:item_misc:2>, //Knife blade
	<actuallyadditions:item_misc:3>, //Knife handle

	<morefurnaces:upgrade:7>,
	<morefurnaces:upgrade:4>,
	<morefurnaces:upgrade:3>,
	<morefurnaces:upgrade:2>,
	<morefurnaces:upgrade:1>,
	<morefurnaces:upgrade>,
	
	<morefurnaces:furnaceblock:4>,
	<morefurnaces:furnaceblock:3>,
	<morefurnaces:furnaceblock:2>,
	<morefurnaces:furnaceblock:1>, // Furnace Stuff
]
 as IItemStack[];

for item in itemstoRemoveAndHide {
	mods.jei.JEI.removeAndHide(item);
}



##=======================================================
## JEI Changes
##=======================================================

//Space Suit with Oxygen
mods.jei.JEI.addItem(<advancedrocketry:spacechestplate>.withTag({slotInsert: [1, 1, 1, 1, 1, 1] as byte[] as byte[], size: 6, slotExtract: [1, 1, 1, 1, 1, 1] as byte[] as byte[], outputItems: [{Slot: 0 as byte, id: "advancedrocketry:pressuretank", Count: 1 as byte, tag: {Fluid: {FluidName: "oxygen", Amount: 7192}}, Damage: 3 as short}, {Slot: 1 as byte, id: "advancedrocketry:pressuretank", Count: 1 as byte, tag: {Fluid: {FluidName: "oxygen", Amount: 8000}}, Damage: 3 as short}]}));


<metaitem:battery_station_ulv>.addTooltip(format.red("Can not be recharged"));

val lootable =
[
  <contenttweaker:controller_broken_south>,
  <contenttweaker:controller_broken_west>,
  <contenttweaker:controller_broken_north>,
  <contenttweaker:vat_print>,
  <contenttweaker:stator>,
//  <actuallyadditions:block_crystal_cluster_redstone>,
//  <actuallyadditions:block_crystal_cluster_emerald>,
  <quark:root>,
  <metaitem:battery_station_ulv>,
  <metaitem:battery_buffer.ulv.4>,
  <fossil:relic_scrap>,
  <fossil:biofossil>,
  <contenttweaker:fuel_catalyst>,
  <contenttweaker:reaction_chamber>,
  <contenttweaker:fuel_pump>,
]
 as IItemStack[];

for item in lootable {
	item.addTooltip(format.yellow("Found on the Station"));
}


<gregtech:metal_casing:2>.displayName = "Heat Proof Machine Casing";

//Hook
<hooked:hook:2>.displayName = "Blue Alloy Hook";
<hooked:microcrafting:2>.displayName = "Crude Steel Chain Link";
<hooked:microcrafting:3>.displayName = "Crude Steel Chain";

//Rocket Boots
<cosmic_core:cc_armor:1>.anyDamage().addTooltip(format.red("Fueled with Liquid Fire Matrix"));
<cosmic_core:cc_armor:1>.anyDamage().addTooltip(format.gold("Hold shift while standing to launch"));

//Purple Glass
<cosmic_core:crystal_purple_glass>.anyDamage().addTooltip(format.gold("When used in the Bio-Organic Fabricator, does not need to be cleaned"));

//+(format.gold(" "));
/*
format.black
format.darkBlue
format.darkGreen
format.darkAqua
format.darkRed
format.darkPurple
format.gold
format.gray
format.darkGray
format.blue
format.green
format.aqua
format.red
format.lightPurple
format.yellow
format.white
*/
<contenttweaker:test_planet>.addTooltip(format.white("- Primary Resource: " )+(format.gray("Titanium "))+(format.green("[800,000/800,000]")));
<contenttweaker:test_planet>.addTooltip(format.gold("Additional scanning required for more info"));

<contenttweaker:test_planet_2>.addTooltip(format.white("- Primary Resource: " )+(format.gray("Iridium "))+(format.yellow("[298,630/550,000]")));
<contenttweaker:test_planet_2>.addTooltip(format.white("- Secondary Resource: " )+(format.gray("Tungsten "))+(format.red("[13,140/128,000]")));
<contenttweaker:test_planet_2>.addShiftTooltip(format.white("- Tier: ")+(format.red("8")), "Hold shift for additional info");
<contenttweaker:test_planet_2>.addShiftTooltip(format.white("- Size: ")+(format.yellow("6")));
<contenttweaker:test_planet_2>.addShiftTooltip(format.white("- Biome(s): ")+(format.yellow("Desert, "))+(format.gray("Wasteland")));
<contenttweaker:test_planet_2>.addShiftTooltip(format.white("- Mining Robots: ")+(format.green("[3,840/4000]")));
<contenttweaker:test_planet_2>.addShiftTooltip(format.white("- Railgun: ")+(format.green("Yes")));


##########################################################################################
print("==================== end of The Station/jei.zs ====================");
