#modloaded fluxnetworks

import crafttweaker.item.IItemStack;

print("==================== loading flux_networks.zs ====================");
##########################################################################################

// Flux Core
<recipemap:large_chemical_reactor>.recipeBuilder()
	.inputs(<fluxnetworks:flux>*24, <ore:dustEnderEye>*24, <ore:circuitEv>)
	.fluidInputs(<liquid:octine>*1008, <liquid:indium>*1008)
	.outputs(<fluxnetworks:fluxcore>*2)
.duration(160).EUt(49153).buildAndRegister();


##########################################################################################
print("==================== end of flux_networks.zs ====================");