print("==================== loading aurorian_gallium.zs ====================");
##########################################################################################
<recipemap:distillery>.recipeBuilder()
    .circuit(1)
    .fluidInputs(<liquid:tamoonwater> * 1000)
    .outputs(<ore:dustMixedMoonwaterSalts>.firstItem)
    .fluidOutputs(<liquid:water> * 900)
    .EUt(30)
    .duration(200)
    .buildAndRegister();

<recipemap:centrifuge>.recipeBuilder()
    .inputs(<ore:dustMixedMoonwaterSalts>)
    .chancedOutput(<ore:dustSalt>.firstItem, 7000, 350) 
    .chancedOutput(<ore:dustRockSalt>.firstItem, 1500, 75)
    .chancedOutput(<ore:dustCalciumChloride>.firstItem, 1000, 50)
    .chancedOutput(<ore:dustGalliumTrichloride>.firstItem, 500, 25)
    .EUt(30)
    .duration(300)
    .buildAndRegister();
##########################################################################################
print("==================== end of aurorian_gallium.zs ====================");