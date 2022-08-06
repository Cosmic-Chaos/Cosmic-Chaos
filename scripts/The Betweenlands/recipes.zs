import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;
print("==================== loading The Betweenlands/recipes.zs ====================");
##########################################################################################

val middleGem as IIngredient = (<thebetweenlands:crimson_middle_gem>|<thebetweenlands:aqua_middle_gem>|<thebetweenlands:green_middle_gem>) as IIngredient;
val crushedMiddleGem as IIngredient = (<thebetweenlands:items_crushed:28>|<thebetweenlands:items_crushed:45>|<thebetweenlands:items_crushed:32>) as IIngredient;

val dentrothyst as IIngredient = (<thebetweenlands:dentrothyst_shard_green>|<thebetweenlands:dentrothyst_shard_orange>) as IIngredient;

val moss as IIngredient = (<thebetweenlands:moss>|<thebetweenlands:cave_moss>|<thebetweenlands:items_plant_drop:29>|<thebetweenlands:items_plant_drop:30>|<thebetweenlands:items_plant_drop:42>) as IIngredient;
val crushedMoss as IIngredient = (<thebetweenlands:items_crushed:55>|<thebetweenlands:items_crushed:27>|<thebetweenlands:items_crushed:38>) as IIngredient;

val valoniteNugget as IItemStack = <thebetweenlands:items_misc:43>;

val mudBrick as IItemStack = <thebetweenlands:items_misc:10>;
global limestoneFlux as IItemStack = <thebetweenlands:items_misc:27>;

val crushedDriedReed as IItemStack = <thebetweenlands:items_crushed:17>;
val reedRope as IItemStack = <thebetweenlands:items_misc:7>;


<thebetweenlands:shimmer_stone>.maxStackSize = 16;


val smeltingToRemove =
[
	mudBrick,
]
 as IItemStack[];

for item in smeltingToRemove {
	furnace.remove(item);
}


var name_removals = [
] as string[];

for item in name_removals {
    recipes.removeByRecipeName(item);
}


# [Nature's Compass] from [Crimson Middle Gem][+2]
craft.remake(<naturescompass:naturescompass>, ["pretty",
  "G □ G",
  "□ ◊ □",
  "G □ G"], {
  "G": dentrothyst, # Green Dentrothyst Shard
  "□": <ore:plateSyrmorite>,                      # Syrmorite Plate
  "◊": middleGem,                 # Crimson Middle Gem
});

    recipes.removeByRecipeName("thebetweenlands:syrmorite_chestplate");
# [Syrmorite Chestplate] from [Syrmorite Plate]
craft.make(<thebetweenlands:syrmorite_chestplate>, ["pretty",
  "□   □",
  "□ □ □",
  "□ □ □"], {
  "□": <ore:plateSyrmorite>, # Syrmorite Plate
});

    recipes.removeByRecipeName("thebetweenlands:syrmorite_leggings");
# [Syrmorite Leggings] from [Syrmorite Plate]
craft.make(<thebetweenlands:syrmorite_leggings>, ["pretty",
  "□ □ □",
  "□   □",
  "□   □"], {
  "□": <ore:plateSyrmorite>, # Syrmorite Plate
});

    recipes.removeByRecipeName("thebetweenlands:syrmorite_boots");
# [Syrmorite Boots] from [Syrmorite Plate]
craft.make(<thebetweenlands:syrmorite_boots>, ["pretty",
  "□   □",
  "□   □"], {
  "□": <ore:plateSyrmorite>, # Syrmorite Plate
});

    recipes.removeByRecipeName("thebetweenlands:syrmorite_helmet");
# [Syrmorite Helmet] from [Syrmorite Plate]
craft.make(<thebetweenlands:syrmorite_helmet>, ["pretty",
  "□ □ □",
  "□   □"], {
  "□": <ore:plateSyrmorite>, # Syrmorite Plate
});

# [Block of Valonite] from [Valonite Shard]
craft.remake(<metaitem:blockValonite>, ["pretty",
  "◊ ◊ ◊",
  "◊ ◊ ◊",
  "◊ ◊ ◊"], {
  "◊": <ore:gemValonite>, # Valonite Shard
});

# [Syrmorite Hopper] from [Syrmorite Gear][+4]
craft.remake(<thebetweenlands:syrmorite_hopper>, ["pretty",
  "□ c □",
  "□ ¤ □",
  "o □ T"], {
  "□": <ore:plateSyrmorite>,          # Syrmorite Plate
  "c": <ore:chest> | <ore:chestWood>, # Weedwood Chest
  "¤": <ore:gearSyrmorite>,           # Syrmorite Gear
  "o": <ore:gtceWrenches>, # Neutronium Wrench
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

# [Syrmorite Bucket] from [Reed Rope][+1]
craft.remake(<thebetweenlands:bl_bucket:1>.withTag({}), ["pretty",
  "  R  ",
  "□ T □",
  "  □  "], {
  "R": reedRope, # Reed Rope
  "□": <ore:plateSyrmorite>,           # Syrmorite Plate
  "T": <ore:gtceHardHammers>, # Neutronium Hammer
});

//Blast Fuel
craft.reshapeless(<metaitem:dustSmallBlastFuel>*12, "G©▲♠", {
  "G": crushedDriedReed, # Ground Dried Swamp Reed
  "©": <ore:dustCharcoal>,                     # Coal Dust
  "▲": <ore:dustTinyOctine>,               # Tiny Pile of Octine Dust
  "♠": <ore:dustSmallSulfur>,              # Small Pile of Sulfur Dust
});

//Blast Fuel
craft.reshapeless(<metaitem:dustSmallBlastFuel>*16, "G©▲♠", {
  "G": crushedDriedReed, # Ground Dried Swamp Reed
  "©": <ore:dustCoal>,                     # Coal Dust
  "▲": <ore:dustTinyOctine>,               # Tiny Pile of Octine Dust
  "♠": <ore:dustSmallSulfur>,              # Small Pile of Sulfur Dust
});

//Blast Fuel
craft.reshapeless(<metaitem:dustSmallBlastFuel>*24, "G©▲♠", {
  "G": crushedDriedReed, # Ground Dried Swamp Reed
  "©": <ore:dustCoke>,                     # Coal Dust
  "▲": <ore:dustTinyOctine>,               # Tiny Pile of Octine Dust
  "♠": <ore:dustSmallSulfur>,              # Small Pile of Sulfur Dust
});

//Mud Bricks
craft.remake(<contenttweaker:unfired_mud_brick>*4, ["pretty",
  "M R s",
  "S B S",
  "s R M"], {
  "M": <thebetweenlands:mud>,          # Mud
  "R": <thebetweenlands:items_misc:7>, # Reed Rope
  "s": <thebetweenlands:silt>,                     # Silt
  "S": <thebetweenlands:sludge_ball>,  # Sludge Ball
  "B": <metaitem:wooden_form.brick>.reuse(),     # Brick Wooden Form
});
	furnace.addRecipe(<thebetweenlands:items_misc:10>, <contenttweaker:unfired_mud_brick>);

# [Basic Macerator] from [LV Electric Motor][+5]
craft.make(<metaitem:macerator.lv>, ["pretty",
  "E ○ F",
  "G G V",
  "L L G"], {
  "E": <metaitem:electric.piston.lv>,     # LV Electric Piston
  "○": <metaitem:electric.motor.lv>,     # LV Electric Motor
  "F": <contenttweaker:cragrock_crushing_gear>, # Fuel Catalyst
  "G": <ore:cableGtSingleTin>,         # 1x Tin Cable
  "V": <metaitem:hull.lv>,         # LV Machine Hull
  "L": <ore:circuitLv>,                # Electronic Circuit
});

# [Fuel Catalyst] from [Valonite Shard][+1]
craft.remake(<contenttweaker:cragrock_crushing_gear>, ["pretty",
  "  C  ",
  "C ◊ C",
  "  C  "], {
  "C": <thebetweenlands:cragrock>, # Cragrock
  "◊": <ore:gemValonite>,          # Valonite Shard
});


/*
//First Stack is second in the list
val clusterFluidMap as int[string] = {
val clusterFluidMap as ILiquidStack[IOreDictEntry] = {
val tinyDustMap as IItemStack[IItemStack] = {


} as IItemStack[IItemStack];
for tinyDust, material in tinyDustMap {

	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}

val sinteringMapULV as IItemStack[][IOreDictEntry] = {
    <ore:dustIron>:[<ore:ingotIron>.firstItem, <ore:rodIron>.firstItem],
} as IItemStack[][IOreDictEntry];

for dust, output in sinteringMapULV {
<recipemap:sintering_furnace>.recipeBuilder().duration(40).EUt(7)
	.notConsumable(<metaitem:shape.mold.ingot>)
	.inputs(dust)
	.outputs(output[0])
.buildAndRegister();

	macerator.recipeBuilder()
		.inputs(<thebetweenlands:items_misc:23>)
		.fluidInputs(<liquid:water>)
		.notConsumable(IIngredient[])
		.notConsumable(ILiquidStack[])
		.outputs(<metaitem:dustRawRubber>*3)
		.fluidOutputs(ILiquidStack[])
		.chancedOutput(IItemStack, 0-10000, 0-10000) // IItemStack output, intitial output chance, tier output chance boost. 10000 is 100% chance
		.circuit(int) // circuit number to use, from 0-32
		.hidden()
		.duration(5*20).EUt(4).buildAndRegister();

<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));

<fossil:bio_goo>.addTooltip(format.yellow(n ~ "% chance to give " + output.displayName + " when analyzed."));
*/

//Raw Rubber Pulp
	macerator.recipeBuilder()
		.inputs(<thebetweenlands:items_misc:23>) //Rubber Ball
		.outputs(<metaitem:dustRawRubber>*3)
	.duration(5*20).EUt(4).buildAndRegister();
##########################################################################################
print("==================== end of The Betweenlands/recipes.zs ====================");
