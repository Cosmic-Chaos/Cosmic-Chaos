#loader gregtech
#priority 1002
import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.machine.Renderer;
print("==================== loading new_machines.zs ====================");
##########################################################################################

//Water Electrolyzer
MachineBuilder.create(32100, "water_electrolyzer")
.setRecipeMap(
	FactoryRecipeMap.start("water_electrolyzer")
		.maxFluidInputs(1)
		.maxFluidOutputs(2)
		.build()
).setRenderer("machines/electrolyzer")
.addTier(0)
.buildAndRegister();

//Scrap Sorter
MachineBuilder.create(32101, "electromagnetic_separator")
.setRecipeMap(RecipeMaps.ELECTROMAGNETIC_SEPARATOR_RECIPES)
.setRenderer("machines/electromagnetic_separator")
.addTier(0)
.buildAndRegister();

//Sintering Furnace
MachineBuilder.create(32102, "sintering_furnace")
.setRecipeMap(
	FactoryRecipeMap.start("sintering_furnace")
		.maxInputs(2)
		.maxOutputs(1)
		.build()
).setRenderer("machines/electric_furnace")
.addTier(0)
.buildAndRegister();

//Biomass Burrner
MachineBuilder.create(32103, "biomass_burner")
.setRecipeMap(
	FactoryRecipeMap.start("biomass_burner")
		.maxInputs(1)
		.build()
)
.setRenderer(Renderer.create("generators/biomass_burner", "side"))
.addTier(0,1)
.setGenerator()
.setTankScalingFunction(function(tier as int) as int {
    return 4000*(tier+1);
})
.buildAndRegister();
//each tier takes up a ID slot

//Station Wiremill
MachineBuilder.create(32105, "station_wiremill")
.setRecipeMap(
	FactoryRecipeMap.start("station_wiremill")
		.maxInputs(1)
		.maxOutputs(1)
		.build()
).setRenderer("machines/wiremill")
.addTier(0)
.buildAndRegister();

/* has a lang key
//Centrifuge
MachineBuilder.create(32103, "centrifuge")
.setRecipeMap(RecipeMaps.CENTRIFUGE_RECIPES)
.setRenderer("machines/centrifuge")
.addTier(0)
.buildAndRegister();
*/
##################################################################
print("==================== end of new_machines.zs ====================");
