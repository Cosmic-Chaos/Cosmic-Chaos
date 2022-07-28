print("==================== loading The Betweenlands/semiconductor_process.zs ====================");
##########################################################################################
val Diode = <gregtech:meta_item_1:521>;
val SiliconBoule = <gregtech:meta_item_1:361>;

<recipemap:mixer>.recipeBuilder()
    .inputs(<thebetweenlands:items_crushed:17>) // Ground dried reed
    .fluidInputs(<liquid:chloroform> * 1000)
    .fluidOutputs(<liquid:swamp_reed_extract> * 1000)
    .outputs(<ore:bioChaff>.firstItem)
    .EUt(7)
    .duration(100)
    .buildAndRegister();

<recipemap:macerator>.recipeBuilder() // Dried swamp reed maceration
    .inputs(<thebetweenlands:items_misc:6>)
    .outputs(<thebetweenlands:items_crushed:17>)
    .EUt(2)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(0)
    .fluidInputs(<liquid:swamp_reed_extract> * 1000)
    .fluidOutputs(<liquid:chloroform> * 800)
    .outputs(<ore:dustSmallEightHydroxyquinoline>.firstItem)
    .EUt(30)
    .duration(100)
    .buildAndRegister();

<recipemap:chemical_reactor>.recipeBuilder()
    .inputs(<ore:dustAluminium>)
    .inputs(<ore:dustTinyOctine>)
    .fluidInputs(<liquid:hydrochloric_acid> * 3000)
    .fluidOutputs(<liquid:hydrogen> * 3000)
    .outputs(<ore:dustAluminiumTrichloride>.firstItem)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:chemical_reactor>.recipeBuilder()
    .inputs(<ore:dustAluminiumTrichloride>)
    .inputs(<ore:dustEightHydroxyquinoline> * 3)
    .outputs(<ore:dustAluminiumComplex>.firstItem)
    .fluidOutputs(<liquid:hydrochloric_acid> * 3000)
    .EUt(30)
    .duration(60)
    .buildAndRegister();

<recipemap:assembler>.recipeBuilder()
    .inputs(<ore:dustSmallAluminiumComplex>)
    .inputs(<ore:wireFineCopper> * 4)
    .fluidInputs(<liquid:glass> * 144)
    .outputs(Diode * 1)
    .EUt(30)
    .duration(400)
    .buildAndRegister();

<recipemap:assembler>.recipeBuilder()
    .inputs(<ore:dustSmallAluminiumComplex>)
    .inputs(<ore:wireFineCopper> * 4)
    .fluidInputs(<liquid:plastic> * 144)
    .outputs(Diode * 2)
    .EUt(30)
    .duration(400)
    .buildAndRegister();

<recipemap:assembler>.recipeBuilder()
    .inputs(<ore:dustSmallAluminiumComplex>)
    .inputs(<ore:wireFineAnnealedCopper> * 4)
    .fluidInputs(<liquid:plastic> * 144)
    .outputs(Diode * 6)
    .EUt(30)
    .duration(400)
    .buildAndRegister();

<recipemap:electric_blast_furnace>.recipeBuilder()
    .inputs(<ore:dustSilicon> * 32)
    .inputs(<ore:dustSmallAluminiumComplex>)
    .outputs(SiliconBoule)
    .duration(9000)
    .EUt(120)
    .property("temperature",1784)
    .buildAndRegister();

##########################################################################################
print("==================== end of The Betweenlands/semiconductor_process.zs ====================");
