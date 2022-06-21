
#priority 997
import crafttweaker.item.IItemStack;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.ore.OrePrefix;
import crafttweaker.liquid.ILiquidStack;

import scripts.g.stationCrystalsByStats;

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
////////////////       The Aurorian      ////////////////
/////////////////////////////////////////////////////////

// Crystal
<ore:gemAurorianGeode>.add(<theaurorian:crystal>);

//Crystalline
<ore:ingotCrystalline>.add(<theaurorian:crystallineingot>);

//Umbra
<ore:ingotUmbra>.add(<theaurorian:umbraingot>);

//Aurorianite
<ore:ingotAurorianite>.add(<theaurorian:aurorianiteingot>);

/////////////////////////////////////////////////////////
////////////////       The Midnight      ////////////////
/////////////////////////////////////////////////////////

// Tenebrum
<ore:ingotTenebrum>.add(<midnight:tenebrum_ingot>);

//Nagrilite
<ore:ingotNagrilite>.add(<midnight:nagrilite_ingot>);

//Ebony
<ore:gemEbony>.add(<midnight:ebonys>);

//Archaic Shard
<ore:gemArchaicShard>.add(<midnight:archaic_shard>);



/////////////////////////////////////////////////////////
////////////////////       AE 2      ////////////////////
/////////////////////////////////////////////////////////


// Fluix
<ore:gemFluix>.add(<appliedenergistics2:material:7>);
<ore:blockFluix>.add(<appliedenergistics2:fluix_block>);

// Sky Stone
<ore:skyStone>.add(<appliedenergistics2:sky_stone_block>);
//<ore:stoneSkyStone>.add(<appliedenergistics2:sky_stone_block>);
<ore:dustSkyStone>.add(<appliedenergistics2:material:45>);

/////////////////////////////////////////////////////////
//////////////////       Custom         /////////////////
/////////////////////////////////////////////////////////

// Remove centrifuge recipes that break apart station alloys
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustRedAlloy>], null).remove();
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustBlueAlloy>], null).remove();
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustGreenCrystalAlloy>*5], null).remove();

// Fix implosion compressor for station crystals
for colorName in stationCrystalsByStats {
	val input as IOreDictEntry = oreDict["dust"~colorName~"Crystal"];
	val output as IItemStack = oreDict["gem"~colorName~"Crystal"].firstItem;
	<recipemap:implosion_compressor>.findRecipe(30, [input.firstItem*4, <metaitem:dynamite>], null).remove();
	<recipemap:implosion_compressor>.findRecipe(30, [input.firstItem*4, <minecraft:tnt>*2], null).remove();
	<recipemap:implosion_compressor>.recipeBuilder()
		.inputs(input*4)
		.property("explosives", 2)
		.outputs(output*3, <metaitem:dustSmallDarkAsh>)
		.duration(20).EUt(30).buildAndRegister();
	<recipemap:implosion_compressor>.recipeBuilder()
		.inputs(input*4)
		.property("explosives", <metaitem:dynamite>)
		.outputs(output*3, <metaitem:dustSmallDarkAsh>)
		.duration(20).EUt(30).buildAndRegister();
}

// Fix missing or broken recipes for other gem materials for gems from other mods
val lateGemNames as string[] = ["ArchaicShard", "Ebony", "Fluix", "AurorianGeode", "CertusQuartz"] as string[];
val cutterFluidMap as int[ILiquidStack] = {
	<fluid:lubricant>*1: 20,
	<fluid:distilled_water>*3: 30,
	<fluid:water>*4: 40,
} as int[ILiquidStack];

for name in lateGemNames {
	val crushedPurified as IOreDictEntry = oreDict["crushedPurified"~name];
	val gemExquisite as IOreDictEntry = oreDict["gemExquisite"~name];
	val gemFlawless as IOreDictEntry = oreDict["gemFlawless"~name];
	val gem as IOreDictEntry = oreDict["gem"~name];
	val dustPure as IOreDictEntry = oreDict["dustPure"~name];
	val dust as IOreDictEntry = oreDict["dust"~name];
	val block as IOreDictEntry = oreDict["block"~name];
	val ore as IOreDictEntry = oreDict["ore"~name];
	// Fix sifting if the gem has an ore
	if (!crushedPurified.empty) {
		<recipemap:sifter>.findRecipe(16, [crushedPurified.firstItem], null).remove();
		<recipemap:sifter>.recipeBuilder()
			.inputs(crushedPurified)
			.chancedOutput(gemExquisite.firstItem, 300, 100)
			.chancedOutput(gemFlawless.firstItem, 1000, 150)
			.chancedOutput(gem.firstItem, 3500, 500)
			.chancedOutput(dustPure.firstItem, 5000, 750)
			.duration(400).EUt(16).buildAndRegister();
	}
	<recipemap:implosion_compressor>.findRecipe(30, [dust.firstItem*4, <metaitem:dynamite>], null).remove();
	<recipemap:implosion_compressor>.findRecipe(30, [dust.firstItem*4, <minecraft:tnt>*2], null).remove();
	<recipemap:implosion_compressor>.recipeBuilder()
		.inputs(dust*4)
		.property("explosives", 2)
		.outputs(gem.firstItem*3, <metaitem:dustSmallDarkAsh>)
		.duration(20).EUt(30).buildAndRegister();
	<recipemap:implosion_compressor>.recipeBuilder()
		.inputs(dust*4)
		.property("explosives", <metaitem:dynamite>)
		.outputs(gem.firstItem*3, <metaitem:dustSmallDarkAsh>)
		.duration(20).EUt(30).buildAndRegister();
	for fluidStack in cutterFluidMap {
		val duration as int = cutterFluidMap[fluidStack] as int;
		<recipemap:cutter>.recipeBuilder()
			.inputs(gemFlawless)
			.fluidInputs(fluidStack)
			.outputs(gem.firstItem*2)
			.duration(duration).EUt(16).buildAndRegister();
	}
	// Add forge hammer and uncrafting recipe if gems can be turned into blocks
	if (!isNull(<recipemap:compressor>.findRecipe(2, [gem.firstItem*9], null))) {
		<recipemap:forge_hammer>.recipeBuilder()
			.inputs(block)
			.outputs(gem.firstItem*9)
			.duration(100).EUt(24).buildAndRegister();
		recipes.addShapeless(gem.firstItem*9, [block]);
	}
	<recipemap:laser_engraver>.recipeBuilder()
		.notConsumable(<ore:craftingLensWhite>)
		.inputs(gem*2)
		.outputs(gemFlawless.firstItem)
		.duration(300).EUt(240).buildAndRegister();
	/*
	<recipemap:compressor>.recipeBuilder()
		.inputs(gem*9)
		.outputs(block.firstItem)
		.duration(300).EUt(2).buildAndRegister();
	*/
	<recipemap:macerator>.recipeBuilder()
		.inputs(gem)
		.outputs(dust.firstItem)
		.duration(20).EUt(2).buildAndRegister();
}

##########################################################################################
print("==================== end of new_materials.zs ====================");
