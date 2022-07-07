print("==================== loading miasma_processing.zs ====================");
##########################################################################################
# Fractionating
<recipemap:distillery>.recipeBuilder()
    .circuit(0)
    .fluidInputs(<liquid:miasma> * 50)
    .fluidOutputs(<liquid:miasma_tar> * 20)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(0)
    .fluidInputs(<liquid:miasma> * 50)
    .fluidOutputs(<liquid:miasma_heavy> * 15)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(0)
    .fluidInputs(<liquid:miasma> * 50)
    .fluidOutputs(<liquid:miasma_light> * 15)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:extractor>.recipeBuilder()
    .inputs(<midnight:miasma_surface>)
    .fluidOutputs(<liquid:miasma_tar> * 200)
    .chancedOutput(<midnight:trenchstone>, 5000, 0)
    .EUt(120)
    .duration(100)
    .buildAndRegister();

# Filtering
<recipemap:chemical_reactor>.recipeBuilder()
    .inputs(<midnight:bulb_fungus_stem>)
    .chancedOutput(<midnight:bulb_fungus_stem>, 9500, 25)
    .fluidInputs(<liquid:miasma_heavy> * 250)
    .fluidOutputs(<liquid:miasma_heavy_filtered> * 250)
    .EUt(30)
    .duration(100)
    .buildAndRegister();

<recipemap:chemical_reactor>.recipeBuilder()
    .inputs(<midnight:bulb_fungus_stem>)
    .chancedOutput(<midnight:bulb_fungus_stem>, 9500, 25)
    .fluidInputs(<liquid:miasma_light> * 250)
    .fluidOutputs(<liquid:miasma_light_filtered> * 250)
    .EUt(30)
    .duration(80)
    .buildAndRegister();

# Re-distilling (this could maybe do with a change later)
<recipemap:distillery>.recipeBuilder()
    .circuit(0)
    .fluidInputs(<liquid:miasma_heavy_filtered> * 50)
    .fluidOutputs(<liquid:lewisite> * 15)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(1)
    .fluidInputs(<liquid:miasma_heavy_filtered> * 50)
    .fluidOutputs(<liquid:phosphorus_trichloride> * 15)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(2)
    .fluidInputs(<liquid:miasma_heavy_filtered> * 50)
    .fluidOutputs(<liquid:chloroform> * 20)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

    <recipemap:distillery>.recipeBuilder()
    .circuit(0)
    .fluidInputs(<liquid:miasma_light_filtered> * 50)
    .fluidOutputs(<liquid:trimethylgallium> * 15)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(1)
    .fluidInputs(<liquid:miasma_light_filtered> * 50)
    .fluidOutputs(<liquid:phosphorus_trifluoride> * 15)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

<recipemap:distillery>.recipeBuilder()
    .circuit(2)
    .fluidInputs(<liquid:miasma_light_filtered> * 50)
    .fluidOutputs(<liquid:fluoroform> * 20)
    .EUt(30)
    .duration(20)
    .buildAndRegister();

# Further processing
# Lewisite -> Sodium Arsenate
<recipemap:chemical_reactor>.recipeBuilder()
    .inputs(<ore:dustSodiumHydroxide> * 3)
    .fluidInputs(<liquid:lewisite> * 1000)
    .fluidOutputs(<liquid:ethylene> * 1000)
    .outputs(<ore:dustSalt>.firstItem * 3)
    .outputs(<ore:dustSodiumArsenate>.firstItem)
    .EUt(30)
    .duration(600)
    .buildAndRegister();

# Sodium Arsenate -> Arsenic
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustSodiumArsenate> * 8], null).remove();
<recipemap:electrolyzer>.recipeBuilder()
    .inputs(<ore:dustSodiumArsenate> * 4)
    .outputs(<ore:dustSodium>.firstItem * 3)
    .outputs(<ore:dustArsenic>.firstItem)
    .fluidOutputs(<liquid:oxygen> * 4000)
    .EUt(30)
    .duration(400)
    .buildAndRegister();

# Trimethylgallium -> Gallium
<recipemap:chemical_reactor>.recipeBuilder()
    .fluidInputs(<liquid:trimethylgallium> * 1000)
    .fluidInputs(<liquid:oxygen> * 5250)
    .fluidOutputs(<liquid:carbon_dioxide> * 3000)
    .fluidOutputs(<liquid:water> * 4500)
    .outputs(<ore:dustGallium>.firstItem)
    .EUt(7)
    .duration(100)
    .buildAndRegister();

##########################################################################################
print("==================== end of miasma_processing.zs ====================");