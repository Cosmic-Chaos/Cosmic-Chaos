import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

print("==================== loading The Station/astroid_mining.zs ====================");
##########################################################################################

/* in crushing tank.zs
//Asteroid Dust
crushing_tank.recipeMap.recipeBuilder()
    .duration(80)
    .EUt(8)
    .inputs(<contenttweaker:block_rock_asteroid>)
    .outputs(<metaitem:dustAsteroidDust>*2)
	.chancedOutput(<metaitem:dustAsteroidDust>, 7500, 1000)
.buildAndRegister();
*/

//Asteroid Dust Centurfuge
centrifuge.recipeBuilder()
  .inputs(<metaitem:dustAsteroidDust>)
	.chancedOutput(<metaitem:dustSmallIron>, 8000, 1000)
	.chancedOutput(<metaitem:dustSmallCopper>, 8000, 1000)
	.chancedOutput(<metaitem:dustSmallTin>, 6000, 1000)
	.chancedOutput(<metaitem:dustSmallLead>, 4000, 1000)
	.chancedOutput(<metaitem:dustSmallRedstone>, 5000, 1000)
	.chancedOutput(<metaitem:dustSmallHeavyAsteroidDust>, 1000, 1000)
	.EUt(5)
	.duration(50*20)
	.buildAndRegister();


##########################################################################################
print("==================== end of The Station/astroid_mining.zs ====================");
