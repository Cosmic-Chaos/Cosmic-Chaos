import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IIngredient;
print("==================== loading gregtech.zs ====================");
##########################################################################################

val itemstoRemove =
[
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}

//Glass Tubes
recipes.addShaped(<metaitem:component.glass.tube>, [
	[null, <ore:paneGlassColorless>, null],
	[<ore:paneGlassColorless>, null, <ore:paneGlassColorless>], 
	[null, <ore:paneGlassColorless>, null]
]);

//Wrought Iron temp
furnace.addRecipe(<metaitem:ingotIron>, <metaitem:ingotWroughtIron>, 0.1);



// Nutrient Distilation
brewery.recipeBuilder()
    .inputs(<minecraft:brown_mushroom>|<minecraft:red_mushroom>|<minecraft:potato>)
    .fluidInputs([<liquid:water> * 1000])
	.fluidOutputs([<liquid:nutrient_distillation> * 1000])
	.EUt(2)
	.duration(128)
	.buildAndRegister();

// Biomass * 750
<recipemap:brewery>.findRecipe(4, [<metaitem:bio_chaff>], [<liquid:water> * 750]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:red_mushroom:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:potato:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:carrot:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:brown_mushroom:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:beetroot:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:reeds:0>], [<liquid:water> * 20]).remove();
// Biomass * 20
<recipemap:brewery>.findRecipe(3, [<minecraft:reeds:0>], [<liquid:water> * 20]).remove();

// Bio Mass with water
brewery.recipeBuilder()
    .inputs(<metaitem:bio_chaff>)
    .fluidInputs([<liquid:water> * 500])
	.fluidOutputs([<liquid:biomass> * 500])
	.EUt(4)
	.duration(128)
	.buildAndRegister();

// Bio Mass
brewery.recipeBuilder()
    .inputs(<metaitem:bio_chaff>)
    .fluidInputs([<liquid:nutrient_distillation> * 1000])
	.fluidOutputs([<liquid:biomass> * 1000])
	.EUt(4)
	.duration(128)
	.buildAndRegister();

# [ULV Energy Output Hatch] from [ULV Machine Hull][+2]
craft.remake(<mbd:ulv_energy_output>, ["pretty",
  "  U  ",
  "L V L"], {
  "U": <metaitem:voltage_coil.ulv>, # Ultra Low Voltage Coil
  "L": <ore:springLead>,          # Lead Spring
  "V": <metaitem:hull.ulv>,    # ULV Machine Hull
});

# [ULV Dynamo Hatch] from [ULV Energy Output Hatch]
craft.reshapeless(<metaitem:energy_hatch.output.ulv>, "Ϟ", {
  "Ϟ": <mbd:ulv_energy_output>, # ULV Energy Output Hatch
});
<metaitem:energy_hatch.output.ulv>.addTooltip(format.red("Deprecated until proper MBD support"));

/*
val tinyDustMap as IItemStack[IItemStack] = {
} as IItemStack[IItemStack];

for tinyDust, material in tinyDustMap {
	mods.fossils.recipes.addSifterOutput(material, tinyDust, 1);
}


<techreborn:part:13>.displayName = "Constantan Heating Coil";
<astralsorcery:itemcelestialcrystal>.addTooltip(format.aqua("Grows from a Celestal Crystal Cluster"));
*/
##########################################################################################
print("==================== end of gregtech.zs ====================");
