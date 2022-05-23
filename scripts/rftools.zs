import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

val lubeMap as int[ILiquidStack] = {
	<liquid:lubricant>*10: 2,
	<liquid:distilled_water>*31: 3,
	<liquid:water>*42: 4
} as int[ILiquidStack];

recipes.removeByRecipeName("rftools:machine_base");
for liquid, mult in lubeMap {
	<recipemap:cutter>.recipeBuilder()
		.inputs(<metaitem:gregtech:energy_hatch.input.lv>)
		.fluidInputs(liquid)
		.outputs(<rftools:machine_base>*4)
	.duration(mult*224).EUt(4).buildAndRegister();
}

# [Machine Frame] from [MV Energy Hatch]
craft.reshapeless(<rftools:machine_frame>, "Ϟ", {
  "Ϟ": <gregtech:machine:1212>, # MV Energy Hatch
});

