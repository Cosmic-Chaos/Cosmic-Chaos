// By hacatu
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI;
import crafttweaker.item.IItemDefinition;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.Recipe;
import mods.gregtech.recipe.RecipeBuilder;
import mods.gregtech.recipe.InputIngredient;

print("----------------Food Start-------------------");

val utensils as IItemStack[] = [
	<ore:toolCuttingboard>.firstItem,
	<ore:toolPot>.firstItem,//
	<ore:toolSkillet>.firstItem,
	<ore:toolSaucepan>.firstItem,
	<ore:toolBakeware>.firstItem,
	<ore:toolMortarandpestle>.firstItem,//
	<ore:toolMixingbowl>.firstItem,//
	<ore:toolJuicer>.firstItem//
] as IItemStack[];

recipes.remove(<harvestcraft:blackberrycobbleritem>);
recipes.remove(<harvestcraft:raspberrypieitem>);

<recipemap:electric_blast_furnace>.recipeBuilder()
	.inputs(<ore:cropBlackberry>, <ore:listAllsugar>, <ore:foodDough>)
	.outputs(<harvestcraft:blackberrycobbleritem>)
	.duration(100).EUt(17).buildAndRegister();

<recipemap:electric_blast_furnace>.recipeBuilder()
	.inputs(<ore:cropRaspberry>, <ore:listAllsugar>, <ore:foodDough>)
	.outputs(<harvestcraft:raspberrypieitem>)
	.duration(100).EUt(17).buildAndRegister();

<recipemap:electric_blast_furnace>.recipeBuilder()
	.inputs(<ore:listAllporkraw>, <ore:foodFlour>, <ore:foodBlackpepper>)
	.fluidInputs(<liquid:gtfo_olive_oil>*100)
	.outputs(<harvestcraft:schnitzelitem>)
	.duration(100).EUt(17).buildAndRegister();

<recipemap:cuisine_assembler>.recipeBuilder()
	.inputs(<ore:foodPorksausage>, <ore:foodPickles>, <ore:cropOnion>, <ore:foodBread>)
	.outputs(<harvestcraft:bratwurstitem>)
	.duration(100).EUt(68).buildAndRegister();

<recipemap:assembler>.recipeBuilder()
	.inputs(<harvestcraft:lambkebabitem>, <harvestcraft:plainyogurtitem>, <harvestcraft:heavycreamitem>, <harvestcraft:garlicitem>, <harvestcraft:spiceleafitem>, <harvestcraft:limeitem>)
	.notConsumable(<ore:toolMixingbowl>)
	.outputs(<harvestcraft:saucedlambkebabitem>)
	.duration(100).EUt(17).buildAndRegister();

<recipemap:electric_blast_furnace>.recipeBuilder()
	.inputs(<ore:listAllbeefcooked>, <ore:foodBatter>, <ore:foodBlackpepper>)
	.fluidInputs(<liquid:gtfo_apple_extract>*100)
	.outputs(<harvestcraft:swedishmeatballsitem>)
	.duration(100).EUt(17).buildAndRegister();

for item in loadedMods["harvestcraft"].items {
	if(item.isFood){
		val methane as double = 9.0*item.healAmount*(1.0 + item.saturation);
		if(methane >= 100){//(6, 1.2)
			val itemRecipes = recipes.getRecipesFor(item);
			if(itemRecipes.length != 0){
				val inputs as IIngredient[] = itemRecipes[0].ingredients1D as IIngredient[];
				var builder as RecipeBuilder = null as RecipeBuilder;
				if((inputs[0].matches(<ore:toolPot>.firstItem) ||
				    inputs[0].matches(<ore:toolMixingbowl>.firstItem)) &&
				   inputs.length <= 5
				){
					builder = <recipemap:mixer>.recipeBuilder();
				}else if((inputs[0].matches(<ore:toolMortarandpestle>.firstItem) ||
				          inputs[0].matches(<ore:toolJuicer>.firstItem)) &&
				         inputs.length <= 7
				){
					builder = <recipemap:forming_press>.recipeBuilder();
				}else if(inputs[0].matches(<ore:toolCuttingboard>.firstItem)){
					if(inputs.length <= 3){
						builder = <recipemap:slicer>.recipeBuilder();
					}else if(inputs.length <= 7){
						builder = <recipemap:cuisine_assembler>.recipeBuilder();
					}
				}else if(inputs[0].matches(<ore:toolSkillet>.firstItem) ||
				         inputs[0].matches(<ore:toolSaucepan>.firstItem) ||
				         inputs[0].matches(<ore:toolBakeware>.firstItem)
				){
					if(inputs.length <= 2){
						builder = <recipemap:baking_oven>.recipeBuilder();//TODO do these recipes get mirrored by the ebo?
					}else if(inputs.length <= 4){
						builder = <recipemap:electric_blast_furnace>.recipeBuilder();
					}
				}
				if(isNull(builder)){
					if(inputs.length <= 6){
						builder = <recipemap:cuisine_assembler>.recipeBuilder();
					}else{
						builder = <recipemap:assembler>.recipeBuilder();
					}
					if(inputs[0].items.length != 0 &&
					   inputs[0].items[0].ores.length != 0 &&
					   inputs[0].items[0].ores[0].name.startsWith("tool")
					){
						builder.notConsumable(inputs[0]);
					}else{
						builder.inputs(inputs[0]);
					}
				}
				for i in 1 .. inputs.length {
					builder.inputs(inputs[i]);
				}
				builder.outputs(itemRecipes[0].output)
					.duration(100).EUt(methane >= 200 ? 68 : 17)
					.buildAndRegister();
				recipes.remove(item);
			}else{
				print("!!!!"~item.name~" has no recipe");
			}
		}
		/*
		var usedUtensils as string = ": ";
		val itemRecipes = recipes.getRecipesFor(item);
		if(itemRecipes.length != 0){
			for input in itemRecipes[0].ingredients1D {
				for utensil in utensils {
					if(input.matches(utensil)){
						usedUtensils += utensil.name~", ";
					}
				}
			}
		}
		print(item.name + ": " + item.healAmount + ", " + item.saturation + usedUtensils);
		*/
	}
}

recipes.remove(<harvestcraft:saltitem>);
/* // Should be unnecessary because we added oredicts to greg items
recipes.addShapeless("convert_salt", <harvestcraft:saltitem>*2, [
	<ore:dustSalt>, <ore:dustSalt>]);
recipes.addShapeless("convert_flour", <harvestcraft:flouritem>*2, [
	<ore:dustWheat>, <ore:dustWheat>
]);
*/
recipes.remove(<nuclearcraft:dominos>);
<recipemap:assembler>.recipeBuilder()
	.inputs(
		<ore:foodBread>*8,
		<ore:listAllporkcooked>*2,
		<ore:listAllbeefcooked>*2,
		<ore:listAllchickencooked>*2,
		<ore:listAllmuttoncooked>*2,
		<ore:cropTomato>*2,
		<ore:foodCheese>*2,
		<ore:listAllmushroom>*2)
	.outputs(<nuclearcraft:dominos>*4)
	.duration(100).EUt(68).buildAndRegister();

<recipemap:centrifuge>.findRecipe(30, [<minecraft:mycelium>], [null]).remove();
<recipemap:centrifuge>.recipeBuilder().inputs(<minecraft:mycelium>)
	.chancedOutput(<minecraft:brown_mushroom>, 2500, 900)
	.chancedOutput(<minecraft:red_mushroom>, 2500, 900)
	.chancedOutput(<quark:glowshroom>, 400, 700)
	.chancedOutput(<nuclearcraft:glowing_mushroom>, 400, 700)
	.chancedOutput(<harvestcraft:whitemushroomitem>, 400, 700)
	.chancedOutput(<randomthings:glowingmushroom>, 100, 400)
	.duration(650).EUt(30).buildAndRegister();


// remove gtfo fruits because they are redundant with pam's
<recipemap:centrifuge>.findRecipe(6, [<minecraft:leaves:0>], [null]).remove();
<recipemap:centrifuge>.findRecipe(6, [<minecraft:leaves:3>], [null]).remove();
<recipemap:centrifuge>.findRecipe(6, [<minecraft:leaves2:0>], [null]).remove();

// Make gtfo zest recipes take oredict
val zestable as IIngredient = (<ore:cropOrange> | <ore:cropLemon> | <ore:cropLime>) as IIngredient;
recipes.addShapeless("hand_zest", <ore:dustZest>.firstItem, [zestable, zestable, zestable, zestable, <ore:craftingToolMortar>]);
<recipemap:extractor>.findRecipe(5, [<metaitem:food.orange>], [null]).remove();
<recipemap:extractor>.recipeBuilder().inputs(<ore:cropOrange>)
	.outputs(<ore:dustZest>.firstItem)
	.fluidOutputs(<liquid:gtfo_orange_extract>*100)
.duration(100).EUt(5).buildAndRegister();
<recipemap:extractor>.findRecipe(5, [<metaitem:food.lemon>], [null]).remove();
<recipemap:extractor>.recipeBuilder().inputs(<ore:cropLemon>)
	.outputs(<ore:dustZest>.firstItem)
	.fluidOutputs(<liquid:gtfo_lemon_extract>*100)
.duration(100).EUt(5).buildAndRegister();
<recipemap:extractor>.findRecipe(5, [<metaitem:food.lime>], [null]).remove();
<recipemap:extractor>.recipeBuilder().inputs(<ore:cropLime>)
	.outputs(<ore:dustZest>.firstItem)
	.fluidOutputs(<liquid:gtfo_lime_extract>*100)
.duration(100).EUt(5).buildAndRegister();

// Make gtfo Kebab e Soltani take oredict
<recipemap:cuisine_assembler>.findRecipe(120, [<metaitem:food.kebab.barg>*2, <metaitem:food.kebab.kubide>, <metaitem:crop.tomato>*3, <metaitem:crop.onion>*2, <metaitem:food.lemon>], [<liquid:gtfo_lemon_extract>*250, <liquid:gtfo_stearin>*1000]).remove();
<recipemap:cuisine_assembler>.recipeBuilder()
	.inputs(<metaitem:food.kebab.barg>*2, <metaitem:food.kebab.kubide>, <ore:cropTomato>*3, <ore:cropOnion>*2, <ore:cropLemon>)
	.fluidInputs(<liquid:gtfo_lemon_extract>*250, <liquid:gtfo_stearin>*1000)
	.outputs(<metaitem:food.kebab.soltani>*2, <metaitem:component.skewer>)
.duration(200).EUt(120).buildAndRegister();

// Make gtfo banana separation take oredict
<recipemap:canner>.findRecipe(32, [<metaitem:food.banana>], [null]).remove();
<recipemap:canner>.recipeBuilder().inputs(<ore:cropBanana>)
	.outputs(<metaitem:component.banana_peel>, <metaitem:food.peeled_banana>)
.duration(60).EUt(32).buildAndRegister();

// Make gtfo tomato recipes take oredict
recipes.remove(<metaitem:component.tomato_slice>);
recipes.addShapeless("hand_tomato_slice", <metaitem:component.tomato_slice>*4, [<ore:craftingToolKnife>, <ore:cropTomato>]);
recipes.addShaped("hand_kubide_kebab_meat", <metaitem:kubide_meat_dust>*4, [
	[<ore:foodSalt>, <ore:cropTomato>, <ore:cropOnion>],
	[<ore:dustMeat>, <ore:dustMeat>, <ore:dustMeat>],
	[<ore:ingotFat>, <ore:dustMeat>, <ore:ingotFat>]
]);
recipes.addShaped("hand_kubide_kebab", <metaitem:component.kebab.kubide>, [
	[<ore:craftingToolRollingPin>, <ore:dustKubideMeat>, <ore:dustKubideMeat>],
	[<ore:dustSmallSalt>, <ore:dustKubideMeat>, <ore:dustKubideMeat>],
	[<metaitem:component.skewer>, <ore:cropTomato>, <ore:dustSmallSalt>]
]);
recipes.addShaped("hand_barg_kebab", <metaitem:component.kebab.barg>, [
	[<ore:craftingToolRollingPin>, <ore:dustBargMeat>, <ore:dustBargMeat>],
	[<ore:dustSmallSalt>, <ore:dustBargMeat>, <ore:dustBargMeat>],
	[<metaitem:component.skewer>, <ore:cropTomato>, <ore:dustSmallSalt>]
]);
recipes.addShapeless("hand_tomato_kebab", <metaitem:component.kebab.tomato>*2, [
	<ore:craftingToolKnife>, <ore:dustSalt>, <ore:cropTomato>, <ore:cropTomato>, <metaitem:component.skewer>, <metaitem:component.skewer>
]);
<recipemap:slicer>.findRecipe(18, [<metaitem:crop.tomato>, <metaitem:config.slicer_blade.flat>], [null]).remove();
<recipemap:slicer>.recipeBuilder().inputs(<ore:cropTomato>)
	.notConsumable(<metaitem:config.slicer_blade.flat>)
	.outputs(<metaitem:component.tomato_slice>*8)
.duration(30).EUt(18).buildAndRegister();

// Make gtfo onion recipes take oredict
recipes.remove(<metaitem:component.onion_slice>*4);
recipes.addShapeless("hand_onion_slice", <metaitem:component.onion_slice>*4, [<ore:craftingToolKnife>, <ore:cropOnion>]);
recipes.addShaped("hand_barg_kebab_meat", <metaitem:barg_meat_dust>*4, [
	[<ore:foodSalt>, <ore:dustMeat>, <ore:cropOlive>],
	[<ore:dustMeat>, <ore:cropOnion>, <ore:dustMeat>],
	[<ore:dustZest>, <ore:dustMeat>, <ore:dustZest>]
]);
recipes.addShapeless("hand_onion_kebab", <metaitem:component.kebab.onion>*2, [
	<ore:craftingToolKnife>, <ore:dustSalt>, <ore:cropOnion>, <ore:cropOnion>, <metaitem:component.skewer>, <metaitem:component.skewer>
]);
<recipemap:slicer>.findRecipe(18, [<metaitem:crop.onion>, <metaitem:config.slicer_blade.flat>], [null]).remove();
<recipemap:slicer>.recipeBuilder().inputs(<ore:cropOnion>)
	.notConsumable(<metaitem:config.slicer_blade.flat>)
	.outputs(<metaitem:component.onion_slice>*8)
.duration(30).EUt(18).buildAndRegister();
<recipemap:cuisine_assembler>.findRecipe(16, [<metaitem:food.chum>*8, <metaitem:component.banana_peel>*2, <metaitem:crop.onion>, <metaitem:mashed_potato_dust>*4, <metaitem:component.skewer>*4], [<liquid:gtfo_stearin>*400, <liquid:gtfo_yolk>*200]).remove();
<recipemap:cuisine_assembler>.recipeBuilder()
	.inputs(<metaitem:food.chum>*8, <metaitem:component.banana_peel>*2, <ore:cropOnion>, <ore:dustMashedPotato>*4, <metaitem:component.skewer>*4)
	.fluidInputs(<liquid:gtfo_stearin>*400, <liquid:gtfo_yolk>*200)
	.outputs(<metaitem:component.kebab.chum>*4)
.duration(400).EUt(16).buildAndRegister();

// Make gtfo cucumber slices take oredict
recipes.remove(<metaitem:component.cucumber_slice>*4);
recipes.addShapeless("hand_cucumber_slice", <metaitem:component.cucumber_slice>*4, [<ore:craftingToolKnife>, <ore:cropCucumber>]);
<recipemap:slicer>.findRecipe(18, [<metaitem:crop.cucumber>, <metaitem:config.slicer_blade.flat>], [null]).remove();
<recipemap:slicer>.recipeBuilder().inputs(<ore:cropCucumber>)
	.notConsumable(<metaitem:config.slicer_blade.flat>)
	.outputs(<metaitem:component.cucumber_slice>*8)
.duration(30).EUt(18).buildAndRegister();

// Make gtfo olive recipes take oredict
recipes.remove(<metaitem:component.olive_slice>*4);
recipes.addShapeless("hand_olive_slice", <metaitem:component.olive_slice>*4, [<ore:craftingToolKnife>, <ore:cropOlive>]);
<recipemap:slicer>.findRecipe(18, [<metaitem:crop.olive>, <metaitem:config.slicer_blade.flat>], [null]).remove();
<recipemap:slicer>.recipeBuilder().inputs(<ore:cropOlive>)
	.notConsumable(<metaitem:config.slicer_blade.flat>)
	.outputs(<metaitem:component.olive_slice>*8)
.duration(30).EUt(18).buildAndRegister();
<recipemap:extractor>.findRecipe(27, [<metaitem:crop.olive>], [null]).remove();
<recipemap:extractor>.recipeBuilder().inputs(<ore:cropOlive>)
	.fluidOutputs(<liquid:gtfo_olive_oil>*100)
.duration(60).EUt(27).buildAndRegister();

<recipemap:macerator>.findRecipe(2, [<minecraft:reeds>], [null]).remove();
<recipemap:compressor>.findRecipe(2, [<minecraft:reeds>*8], [null]).remove();
<recipemap:compressor>.findRecipe(2, [<minecraft:wheat>*8], [null]).remove();

val presserRecipes as IItemStack[][IIngredient] = {
	<ore:cropPeach>: [<harvestcraft:peachjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropWalnut>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	<harvestcraft:waxcombitem>: [<harvestcraft:beeswaxitem>, <harvestcraft:beeswaxitem>],
	<ore:cropCarrot>: [<harvestcraft:carrotjuiceitem>, <harvestcraft:veggiebaititem>],
	<ore:cropSunflower>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	<ore:cropKiwi>: [<harvestcraft:kiwijuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropAlmond>: [<harvestcraft:freshmilkitem>*8, <harvestcraft:grainbaititem>],
	<ore:cropSoybean>: [<harvestcraft:silkentofuitem>, <harvestcraft:grainbaititem>],
	<ore:cropCactusfruit>: [<harvestcraft:cactusfruitjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropPomegranate>: [<harvestcraft:pomegranatejuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropAvacado>: [<harvestcraft:oliveoilitem>, <harvestcraft:veggiebaititem>],
	<ore:cropPear>: [<harvestcraft:pearjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropOlive>: [<harvestcraft:oliveoilitem>, <harvestcraft:fruitbaititem>],
	<ore:cropApricot>: [<harvestcraft:apricotjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropMaplesyrup>: [<minecraft:slime_ball>, <harvestcraft:freshwateritem>],
	<ore:foodHoneydrop>: [<minecraft:slime_ball>, <harvestcraft:freshwateritem>],
	<harvestcraft:grapeitem>: [<harvestcraft:grapejuiceitem>, <harvestcraft:fruitbaititem>],
	<harvestcraft:freshwateritem>: [<harvestcraft:bubblywateritem>, <harvestcraft:bubblywateritem>],
	<ore:foodSilkentofu>: [<harvestcraft:firmtofuitem>, <harvestcraft:soymilkitem>],
	<ore:cropCherry>: [<harvestcraft:cherryjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropTealeaf>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	<ore:cropGrapefruit>: [<harvestcraft:grapefruitjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropPapaya>: [<harvestcraft:papayajuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropBlackberry>: [<harvestcraft:blackberryjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropOrange>: [<harvestcraft:orangejuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropCoconut>: [<harvestcraft:coconutmilkitem>, <harvestcraft:veggiebaititem>],
	<ore:cropApple>: [<harvestcraft:applejuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropBeet>: [<minecraft:sugar>, <harvestcraft:veggiebaititem>],
	<ore:seedMustard>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	<ore:sugarcane>: [<minecraft:sugar>, <minecraft:sugar>],
	<ore:seedSesameseed>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	<ore:cropStarfruit>: [<harvestcraft:starfruitjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropMango>: [<harvestcraft:mangojuiceitem>, <harvestcraft:fruitbaititem>],
	//<ore:logWood>: [<minecraft:paper>, <minecraft:paper>],
	<ore:cropPlum>: [<harvestcraft:plumjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropFig>: [<harvestcraft:figjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropPersimmon>: [<harvestcraft:persimmonjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:seedPumpkin>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	<ore:cropCranberry>: [<harvestcraft:cranberryjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropPumpkin>: [<harvestcraft:oliveoilitem>, <harvestcraft:veggiebaititem>],
	<ore:cropLime>: [<harvestcraft:limejuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropStrawberry>: [<harvestcraft:strawberryjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropRaspberry>: [<harvestcraft:raspberryjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:cropBlueberry>: [<harvestcraft:blueberryjuiceitem>, <harvestcraft:fruitbaititem>],
	<ore:seedCotton>: [<harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>],
	//new recipes
	<ore:cropSeaweed>: [<harvestcraft:saltitem>, <harvestcraft:veggiebaititem>],
	<ore:cropNutmeg>: [<harvestcraft:groundnutmegitem>, <harvestcraft:grainbaititem>],
	<ore:cropPeppercorn>: [<harvestcraft:blackpepperitem>, <harvestcraft:veggiebaititem>],
	<ore:cropCinnamon>: [<harvestcraft:groundcinnamonitem>, <harvestcraft:grainbaititem>]
} as IItemStack[][IIngredient];

for input, outputs in presserRecipes {
	<recipemap:macerator>.recipeBuilder().inputs(input).outputs(outputs[0])
		.chancedOutput(outputs[1], 10000, 0)
		.duration(400).EUt(2).buildAndRegister();
}

<recipemap:macerator>.recipeBuilder().inputs(<harvestcraft:queenbeeitem>)
	.outputs(<harvestcraft:royaljellyitem>)
	.chancedOutput(<harvestcraft:royaljellyitem>, 50, 10)
	.duration(400).EUt(16).buildAndRegister();

val grinderMeatRecipes as IItemStack[IIngredient] = {
	<minecraft:beef>: <harvestcraft:groundbeefitem>*2,
	<harvestcraft:rawtofeakitem>: <harvestcraft:groundbeefitem>*2,
	//<twilightforest:raw_meef>: <harvestcraft:groundbeefitem>*2,
	<minecraft:chicken>: <harvestcraft:groundchickenitem>*2,
	<harvestcraft:rawtofickenitem>: <harvestcraft:groundchickenitem>*2,
	<harvestcraft:duckrawitem>: <harvestcraft:groundduckitem>*2,
	<harvestcraft:rawtofuduckitem>: <harvestcraft:groundduckitem>*2,
	<ore:listAllfishfresh>: <harvestcraft:groundfishitem>*2,
	<harvestcraft:rawtofishitem>: <harvestcraft:groundfishitem>*2,
	<minecraft:mutton>: <harvestcraft:groundmuttonitem>*2,
	<harvestcraft:rawtofuttonitem>: <harvestcraft:groundmuttonitem>*2,
	<minecraft:porkchop>: <harvestcraft:groundporkitem>*2,
	<harvestcraft:rawtofaconitem>: <harvestcraft:groundporkitem>*2,
	<harvestcraft:bbqjackfruititem>: <harvestcraft:groundporkitem>*2,
	//<twilightforest:hydra_chop>: <harvestcraft:groundporkitem>*36,
	<minecraft:rabbit>: <harvestcraft:groundrabbititem>*2,
	<harvestcraft:rawtofabbititem>: <harvestcraft:groundrabbititem>*2,
	<harvestcraft:rawtofurkeyitem>: <harvestcraft:groundturkeyitem>*2,
	<harvestcraft:turkeyrawitem>: <harvestcraft:groundturkeyitem>*2,
	<harvestcraft:rawtofenisonitem>: <harvestcraft:groundvenisonitem>*2,
	<harvestcraft:venisonrawitem>: <harvestcraft:groundvenisonitem>*2,
	//<twilightforest:raw_venison>: <harvestcraft:groundvenisonitem>*2,
	<ore:cropCorn>: <harvestcraft:cornmealitem>*2
} as IItemStack[IIngredient];

for input, output in grinderMeatRecipes {
	<recipemap:forge_hammer>.recipeBuilder().inputs(input).outputs(output)
		.duration(100).EUt(33).buildAndRegister();
}

val grainFoods as IIngredient[] = [
	<ore:cropBanana>, <ore:listAllgrain>, <ore:cropPotato>, <ore:cropCoconut>,
	<ore:cropPeas>, <ore:cropChesnut>, <ore:cropBean>, <ore:cropAlmond>,
	<ore:cropSoybean>, <ore:cropTaro>, <ore:cropChickpea>, <ore:cropCassava>
] as IIngredient[];

for food in grainFoods {
	<recipemap:forge_hammer>.recipeBuilder().inputs(food).outputs(<harvestcraft:flouritem>*2)
		.duration(100).EUt(33).buildAndRegister();
}

recipes.removeByRecipeName("harvestcraft:veggiebaititem_x4");
recipes.removeByRecipeName("harvestcraft:fruitbaititem_x4");
recipes.removeByRecipeName("harvestcraft:grainbaititem_x4");

recipes.addShapeless("veggiebait", <harvestcraft:veggiebaititem>, [
	<ore:listAllveggie>, <ore:listAllveggie>, <ore:string>
]);
recipes.addShapeless("fruitbait", <harvestcraft:fruitbaititem>, [
	<ore:listAllfruit>, <ore:listAllfruit>, <ore:string>
]);
recipes.addShapeless("grainbait", <harvestcraft:grainbaititem>, [
	<ore:listAllgrain>, <ore:listAllgrain>, <ore:string>
]);

print("----------------Food End-------------------");

