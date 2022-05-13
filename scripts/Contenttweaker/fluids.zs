#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;

#priority 103

print("==================== loading fluids.zs ====================");
##########################################################################################

var emc_fluid = VanillaFactory.createFluid("emc_fluid", Color.fromHex("b0e65a"));
//emc_fluid.temperature = 6000;
//emc_fluid.gaseous = true;
emc_fluid.luminosity = 0.5;
emc_fluid.viscosity = 3000; // lower is slower
emc_fluid.stillLocation = "contenttweaker:fluids/emc_fluid_1_base";
emc_fluid.flowingLocation = "contenttweaker:fluids/emc_fluid_1_base_flowing";
emc_fluid.material = <blockmaterial:lava>;
emc_fluid.register();

var green_crystal_fluid = VanillaFactory.createFluid("green_crystal_fluid", Color.fromHex("34eb4c"));
green_crystal_fluid.viscosity = 3000;
green_crystal_fluid.material = <blockmaterial:lava>;
green_crystal_fluid.register();

var red_crystal_fluid = VanillaFactory.createFluid("red_crystal_fluid", Color.fromHex("db303c"));
red_crystal_fluid.viscosity = 3000;
red_crystal_fluid.material = <blockmaterial:lava>;
red_crystal_fluid.register();

var blue_crystal_fluid = VanillaFactory.createFluid("blue_crystal_fluid", Color.fromHex("2d2de3"));
blue_crystal_fluid.viscosity = 3000;
blue_crystal_fluid.material = <blockmaterial:lava>;
blue_crystal_fluid.register();

##########################################################################################
print("==================== end of fluids.zs ====================");