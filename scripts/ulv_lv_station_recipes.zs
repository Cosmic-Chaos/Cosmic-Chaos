import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.industrialforegoing.SludgeRefiner;

print("==================== loading ulv_lv_station_recipes.zs ====================");
##########################################################################################

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
    // Clay
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

##=======================================================
## ADD RECIPES
##=======================================================

//Busses because no wood
recipes.addShaped(<metaitem:item_bus.export.ulv>, [[<metaitem:hull.ulv>], [<metaitem:crate.steel>]]);
recipes.addShaped(<metaitem:item_bus.import.ulv>, [[<metaitem:crate.steel>],[<metaitem:hull.ulv>]]);


//Knife
recipes.addShapeless(<actuallyadditions:item_knife>, [<ore:craftingToolKnife>]);

//No Stone Buttons
recipes.addShapeless(<quark:iron_button>, [<minecraft:iron_ingot>]);
recipes.addShapeless(<quark:gold_button>, [<minecraft:gold_ingot>]);


# [Makeshift Crowbar] from [Tin Plate][+2]
craft.remake(<contenttweaker:crowbar>, ["pretty",
  "  □ □",
  "  ╱  ",
  "╱ п  "], {
  "□": <ore:plateIron>,   # Iron Plate
  "╱": <ore:stickCopper>, # Copper Rod
  "п": <ore:plateTin>,    # Tin Plate
});

# [Crowbar] from [Bronze Rod][+1]
craft.remake(<contenttweaker:crowbar_t2>, ["pretty",
  "  □ □",
  "  ╱  ",
  "╱ □  "], {
  "□": <metaitem:plateWroughtIron>,   # Iron Plate
  "╱": <ore:stickBronze>, # Bronze Rod
});


# [Derelict Casing] from [Wrought Iron Frame Box][+3]
craft.remake(<contenttweaker:station_casing>*2, ["pretty",
  "P o P",
  "P ◙ P",
  "P T P"], {
  "P": <contenttweaker:station_component_1> | <contenttweaker:station_component_2>, # Plating Component
  "o": <ore:gtceHardHammers>, # Neutronium Hammer
  "◙": <ore:frameGtWroughtIron>,                   # Wrought Iron Frame Box
  "T": <ore:gtceWrenches>, # Neutronium Wrench
});

# [Derelict Casing] from [Crude Steel Frame Box][+3]
craft.remake(<contenttweaker:station_casing>*4, ["pretty",
  "□ o □",
  "□ ◙ □",
  "□ T □"], {
  "□": <ore:plateCrudeSteel>,       # Crude Steel Plate
  "o": <metaitem:tool.hard_hammer>, # Iron Hammer
  "◙": <metaitem:frameCrudeSteel>, # Crude Steel Frame Box
  "T": <ore:gtceWrenches>, # Neutronium Wrench
});

# [Crafting Station] from [Steel Crate][+3]
craft.remake(<metaitem:workbench>, ["pretty",
  "E P",
  "r S"], {
  "E": <minecraft:book>, # Book
  "P": <contenttweaker:station_component_4>, # Primitive Crafting Interface
  "r": <contenttweaker:station_component_3>, # Primitive Mixed Plating
  "S": <metaitem:crate.steel>,              # Steel Crate
});




// Workbench 2nd Recipe
recipes.addShaped(<metaitem:workbench>, [
	[null, <minecraft:book>, null],
	[<ore:screwIron>, <ore:craftingTableWood>, <ore:screwIron>], 
	[null, <metaitem:plateDoubleBronze>, null]
]);

# [Plating Component]
recipes.addShapeless(<contenttweaker:station_component_1>, 
	[<ore:gtceHardHammers>,<contenttweaker:hull_plate_t2>,<contenttweaker:hull_plate_t2>,<contenttweaker:hull_plate_t1>]
);

# [Plating Component]
recipes.addShapeless(<contenttweaker:station_component_2>, 
	[<ore:gtceHardHammers>,<contenttweaker:hull_plate_t1>,<contenttweaker:hull_plate_t1>,<contenttweaker:hull_plate_t2>]
);

# [Primitive Mixed Plating]
recipes.addShapeless(<contenttweaker:station_component_3>, 
	[<ore:gtceWrenches>,<contenttweaker:station_component_2>,<contenttweaker:station_component_1>]
);

# [Primitive Crafting Interface]
recipes.addShapeless(<contenttweaker:station_component_4>, 
	[<ore:gtceScrewdrivers>,<contenttweaker:internals_t1>,<contenttweaker:internals_t1>,<contenttweaker:internals_t1>]
);

# [Copper Furnace] from [Neutronium Wrench][+1]
craft.remake(<morefurnaces:furnaceblock:5>, ["pretty",
  "P P P",
  "P T P",
  "P P P"], {
  "P": <contenttweaker:station_component_1>, # Plating Component
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});

# [Copper Furnace] from [Neutronium Wrench][+1]
craft.make(<morefurnaces:furnaceblock:5>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <ore:plateCopper>, # Copper Plate
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});

# [Iron Furnace] from [Neutronium Wrench][+1]
craft.remake(<morefurnaces:furnaceblock>, ["pretty",
  "P P P",
  "P T P",
  "P P P"], {
  "P": <contenttweaker:station_component_2>, # Plating Component
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});

# [Iron Furnace] from [Neutronium Wrench][+1]
craft.make(<morefurnaces:furnaceblock>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <ore:plateIron>, # Iron Plate
  "T": <ore:gtceHardHammers>, # Neutronium Wrench
});


# [Silver Furnace] from [Silver Wrench][+1]
craft.remake(<morefurnaces:furnaceblock:6>, ["pretty",
  "□ □ □",
  "□ T □",
  "□ □ □"], {
  "□": <metaitem:plateSilver>, # Silver Plate
  "T": <ore:gtceHardHammers>, # Wrench
});
# [Small Pile of Glass Dust] from [Glass Shard][+1]
craft.reshapeless(<metaitem:dustSmallGlass>, "TG", {
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
  "G": <ore:shardGlass>, # Glass Shard
});

# [Vacuum Tube] from [Glass Tube][+2]
craft.remake(<metaitem:circuit.vacuum_tube>, ["pretty",
  "╱ l ╱",
  "G G G"], {
  "╱": <ore:stickWroughtIron>,     # Wrought Iron Rod
  "l": <gregtech:meta_item_1:517>, # Glass Tube
  "G": <ore:wireGtSingleCopper>,   # 1x Copper Wire
});

# [ULV Machine Hull] from [Wrought Iron Plate][+3]
craft.remake(<metaitem:hull.ulv>, ["pretty",
  "     ",
  "□ п □",
  "G ⌂ G"], {
  "□": <ore:plateCopper>,         # Copper Plate
  "п": <ore:plateWroughtIron>,    # Wrought Iron Plate
  "G": <ore:wireGtSingleTin>,     # 1x Tin Wire
  "⌂": <gregtech:machine_casing>, # ULV Machine Casing
});

# [Rail Frame]*2 from [Steel Screw][+2]
craft.remake(<industrialrenewal:frame> * 2, ["pretty",
  "╱ ◙ ╱",
  "S ◙ S",
  "╱ ◙ ╱"], {
  "╱": <ore:stickWroughtIron>,  # Wrought Iron Rod
  "◙": <ore:frameGtCrudeSteel>, # Crude Steel Frame Box
  "S": <ore:screwCrudeSteel>,        # Steel Screw
});

# [Crystal Battery] from [Low Covalence Dust][+2]
craft.remake(<devtech:meta_item:1>, ["pretty",
  "╳ * ╳",
  "* ▲ *",
  "╳ * ╳"], {
  "╳": <ore:wireFineGreenCrystalAlloy>,          # Fine Green Crystal Alloy Wire
  "*": <actuallyadditions:item_crystal_shard:4>, # Green Crystal Shard
  "▲": <projecte:item.pe_covalence_dust>,        # Low Covalence Dust
});


# [Saw Blade Assembly] from [Iron Buzzsaw Blade][+3]
craft.remake(<advancedrocketry:sawblade>, ["pretty",
  "╱   ╱",
  "I H I",
  "□   □"], {
  "╱": <ore:stickIron>,           # Iron Rod
  "I": <ore:screwIron>,           # Iron Screw
  "H": <ore:toolHeadBuzzSawIron>, # Iron Buzzsaw Blade
  "□": <ore:plateIron>,           # Iron Plate
});


# [Primitive Brewery] from [ULV Machine Hull][+5]
craft.remake(<gregtech:machine:32102>, ["pretty",
  "■ V ■",
  "* L *",
  "U T U"], {
  "■": <ore:blockGlassColorless> | <ore:blockGlass>, # Glass
  "V": <contenttweaker:electric_pump_ulv>,   # ULV Electric Pump
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "L": <gregtech:machine:985>,               # ULV Machine Hull
  "U": <ore:circuitUlv>,                     # Vacuum Tube
  "T": <ore:springTin>,                      # Tin Spring
});

# [ULV Electric Pump] from [Rubber Ring][+6]
craft.remake(<contenttweaker:electric_pump_ulv>, ["pretty",
  "* B l",
  "r R  ",
  "o   T"], {
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "B": <ore:rotorBronze>,                    # Bronze Rotor
  "l": <ore:gtceWrenches>, # Neutronium Wrench
  "r": <ore:screwBronze>,                    # Bronze Screw
  "R": <ore:ringRubber>,                     # Rubber Ring
  "o": <ore:gtceScrewdrivers>, # Neutronium Screwdriver
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

# [ULV Electric Motor] from [Iron Rod][+5]
craft.remake(<contenttweaker:electric_motor_ulv>, ["pretty",
  "* ╱ l",
  "/ *  ",
  "o   T"], {
  "*": <ore:cableGtSingleGreenCrystalAlloy>, # 1x Green Crystal Alloy Cable
  "╱": <ore:stickIron>,                      # Iron Rod
  "l": <ore:gtceWrenches>, # Neutronium Wrench
  "/": <ore:stickIronMagnetic>,              # Magnetic Iron Rod
  "o": <ore:gtceWireCutters>, # Neutronium Wire Cutter
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

# [ULV Electric Piston] from [Small Bronze Gear][+6]
craft.remake(<contenttweaker:electric_piston_ulv>, ["pretty",
  "□ ╱ l",
  "U ¤  ",
  "o   T"], {
  "□": <ore:plateBronze>,                        # Bronze Plate
  "╱": <ore:stickBronze>,                        # Bronze Rod
  "l": <ore:gtceWrenches>, # Neutronium Wrench
  "U": <contenttweaker:electric_motor_ulv>,      # ULV Electric Motor
  "¤": <ore:gearSmallBronze>,                    # Small Bronze Gear
  "o": <ore:gtceFiles>, # Neutronium File
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});


//Reuse the Basic furnaces
val basicFurnace as IIngredient = (<morefurnaces:furnaceblock:5>|<morefurnaces:furnaceblock>) as IIngredient;
recipes.addShaped(<morefurnaces:furnaceblock:6>, [[null, <metaitem:plateSilver>, null],[<metaitem:plateSilver>, basicFurnace, <metaitem:plateSilver>], [null, <ore:gtceWrenches>, null]]);



//Crystal Glass
furnace.addRecipe(<contenttweaker:crystal_green_glass>, <contenttweaker:dust_crystal_green_glass>, 0.0);



/*
//Diamonds to other gems for blast furnace
recipes.addShapeless(<metaitem:gemRuby> * 3, [<projecte:item.pe_philosophers_stone>,<minecraft:diamond>,<minecraft:diamond>,<minecraft:diamond>]);
recipes.addShapeless(<metaitem:gemSapphire>, [<projecte:item.pe_philosophers_stone>,<minecraft:diamond>]);
*/

// Red Alloy Dust
recipes.addShapeless(<metaitem:dustRedAlloy>, [<ore:dustCopper>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]);

recipes.addShapeless(<metaitem:dustRedAlloy>*2, [<ore:dustCopper>,<contenttweaker:dust_crystal_red>,<contenttweaker:dust_crystal_red>]);

// GC Alloy Dust
recipes.addShapeless(<metaitem:dustGreenCrystalAlloy> * 5, [<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<metaitem:dustCrudeSteel>,<contenttweaker:dust_crystal_green>]);

// GC Glass Dust
recipes.addShapeless(<contenttweaker:dust_crystal_green_glass> * 3, [<metaitem:dustGlass>,<metaitem:dustGlass>,<contenttweaker:dust_crystal_green>]);


//Cooking Ingots
furnace.addRecipe(<minecraft:iron_ingot>, <contenttweaker:broken_hull_plate_t1>, 0.0);
furnace.addRecipe(<metaitem:ingotCopper>, <contenttweaker:broken_hull_plate_t2>, 0.0);
furnace.addRecipe(<metaitem:ingotTin>, <contenttweaker:broken_hull_plate_t3>, 0.0);
furnace.addRecipe(<metaitem:ingotCrudeSteel>, <contenttweaker:hull_plate_t3>, 0.0);
furnace.addRecipe(<metaitem:ingotSilver>, <contenttweaker:hull_plate_t4>, 0.0);


//Wrought Iron recipe in greg_tech.zs
//furnace.addRecipe(<metaitem:ingotIron>, <metaitem:ingotWroughtIron>, 0.1);

//Glass
//furnace.addRecipe(<minecraft:glass_pane>, <metaitem:dustSmallGlass>, 0.0); //bad recipe
furnace.addRecipe(<minecraft:glass>, <metaitem:dustGlass>, 0.0);

# [Rubber Sheet] from [Neutronium Hammer][+1]
craft.remake(<gregtech:meta_plate:1068>, ["pretty",
  "  T",
  "  ▬",
  "  ▬"], {
  "T": <ore:craftingToolHardHammer> | <ore:gtceHardHammers>, # Neutronium Hammer
  "▬": <ore:ingotRubber>, # Rubber Bar
});

//Rubber
furnace.addRecipe(<metaitem:ingotRubber>, <metaitem:dustRubber>, 0.0);

//Bio Goo
//recipes.addShaped(<fossil:bio_goo> * 3, [[<gregtechfoodoption:gtfo_meta_tool>],[<minecraft:mutton>]]);
//recipes.addShaped(<fossil:bio_goo> * 9, [[<gregtechfoodoption:gtfo_meta_tool>],[<fossil:failuresaurus_flesh>]]);

//Slime in a bucket
recipes.addShaped(<quark:slime_bucket>, [[<fossil:bio_goo>],[<minecraft:bucket>]]);

//Resin
furnace.addRecipe(<metaitem:rubber_drop> * 4, <fossil:bio_goo>, 0.0);

// Sludge Recipe
chemical_reactor.recipeBuilder()
	.chancedOutput(<metaitem:component.diode>, 1000, 1000)
	.fluidOutputs([<liquid:sludge> * 2000])
    .fluidInputs([<liquid:nutrient_distillation> * 200])
    .inputs(<contenttweaker:internals_t1>)
	.EUt(30)
	.duration(120)
	.buildAndRegister();


SludgeRefiner.add(<fossil:bio_goo>, 5);
SludgeRefiner.add(<minecraft:grass>, 3);
/*

//Sheep Recipe
recipes.addShaped(<tinymobfarm:lasso>.withTag({capturedMob: {mobName: "Sheep", mobHostile: 0 as byte, mobMaxHealth: 8.0, mobLootTableLocation: "minecraft:entities/sheep/black", 
mobData: {HurtByTimestamp: 0, ForgeData: {}, RelativeAABB: [-0.44999998807907104, 0.0, -0.44999998807907104, 0.44999998807907104, 1.2999999523162842, 0.44999998807907104], 
Attributes: [{Base: 8.0, Name: "generic.maxHealth"}, {Base: 0.0, Name: "generic.knockbackResistance"}, {Base: 0.23000000417232513, Name: "generic.movementSpeed"}, {Base: 0.0, Modifiers: [{UUIDMost: 7967251376945776733 as long, 
UUIDLeast: -6334252128332718209 as long, Amount: 1.0, Operation: 0, Name: "sheep_armor"}], Name: "generic.armor"}, {Base: 0.0, Name: "generic.armorToughness"}, {Base: 1.0, Name: "forge.swimSpeed"}, 
{Base: 16.0, Modifiers: [{UUIDMost: 1001108870215716285 as long, UUIDLeast: -8438169646607084800 as long, Amount: -0.043732826370627934, Operation: 1, Name: "Random spawn bonus"}], Name: "generic.followRange"}], 
Invulnerable: 0 as byte, FallFlying: 0 as byte, ForcedAge: 0, PortalCooldown: 0, AbsorptionAmount: 0.0 as float, FallDistance: 0.0 as float, InLove: 0, DeathTime: 0 as short, ForgeCaps: {"pneumaticcraft:hacking": {}}, 
HandDropChances: [0.085 as float, 0.085 as float], PersistenceRequired: 0 as byte, id: "minecraft:sheep", Age: 0, Motion: [0.0, -0.0784000015258789, 0.0], Leashed: 0 as byte, UUIDLeast: -6831894127428841867 as long, Health: 8.0 as float, Color: 15 as byte, 
LeftHanded: 0 as byte, Air: 300 as short, OnGround: 1 as byte, Dimension: 33, UpdateBlocked: 0 as byte, HandItems: [{}, {}], ArmorDropChances: [0.085 as float, 0.085 as float, 0.085 as float, 0.085 as float], 
UUIDMost: -5435383733186377826 as long, Pos: [202.5, 82.0, -368.5], Fire: -1 as short, ArmorItems: [{}, {}, {}, {}], CanPickUpLoot: 0 as byte, Sheared: 0 as byte, HurtTime: 0 as short}, mobHealth: 8.0}}), 
[[null, <fossil:sheep_dna>, null],[<fossil:sheep_dna>, <minecraft:lead>, <fossil:sheep_dna>], [null, <fossil:sheep_dna>, null]]);


//Autoclaving Diamond
autoclave.recipeBuilder()
	.outputs(<minecraft:diamond>)
    .inputs(<ore:dustDiamond>)
    .fluidInputs([<liquid:water> * 200])
	.EUt(24)
	.duration(80)
	.buildAndRegister();
	
autoclave.recipeBuilder()
	.outputs(<minecraft:diamond>)
    .inputs(<ore:dustDiamond>)
    .fluidInputs([<liquid:distilled_water> * 200])
	.EUt(24)
	.duration(60)
	.buildAndRegister();

//Compressing Obsidian
compressor.recipeBuilder()
	.outputs(<minecraft:obsidian>)
    .inputs(<ore:dustObsidian>*4)
	.EUt(2)
	.duration(400)
	.buildAndRegister();

//Sulfur
recipes.addShapeless(<metaitem:dustSulfur>, [<projecte:item.pe_philosophers_stone>,<ore:dustCoal>,<ore:dustCoal>,<ore:dustCoal>,<ore:dustCoal>]);

*/
# [Small Airlock Door] from [Iron Plate]
craft.remake(<advancedrocketry:smallairlockdoor>, ["pretty",
  "□ □",
  "□ □",
  "□ □"], {
  "□": <ore:plateIron>, # Iron Plate
});

##########################################################################################
print("==================== end of ulv_lv_station_recipes.zs ====================");
