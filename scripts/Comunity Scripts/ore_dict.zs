#priority 999

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemDefinition;
import mods.jei.JEI;



val itemstoRemove =
[
<lucraftcore:plate_vibranium>,
<lucraftcore:plate_uru>,
<lucraftcore:plate_uranium>,
<lucraftcore:plate_titanium>,
<lucraftcore:plate_tin>,
<lucraftcore:plate_steel>,
<lucraftcore:plate_silver>,
<lucraftcore:plate_palladium>,
<lucraftcore:plate_osmium>,
<lucraftcore:plate_nickel>,
<lucraftcore:plate_lead>,
<lucraftcore:plate_iron>,
<lucraftcore:plate_iridium>,
<lucraftcore:plate_intertium>,
<lucraftcore:plate_gold_titanium_alloy>,
<lucraftcore:plate_gold>,
<lucraftcore:plate_dwarf_star_alloy>,
<lucraftcore:plate_copper>,
<lucraftcore:plate_bronze>,
<lucraftcore:plate_adamantium>,
<lucraftcore:dust_vibranium>,
<lucraftcore:dust_uru>,
<lucraftcore:dust_uranium>,
<lucraftcore:dust_titanium>,
<lucraftcore:dust_tin>,
<lucraftcore:dust_steel>,
<lucraftcore:dust_silver>,
<lucraftcore:dust_palladium>,
<lucraftcore:dust_osmium>,
<lucraftcore:dust_nickel>,
<lucraftcore:dust_lead>,
<lucraftcore:dust_iron>,
<lucraftcore:dust_iridium>,
<lucraftcore:dust_intertium>,
<lucraftcore:dust_gold_titanium_alloy>,
<lucraftcore:dust_gold>,
<lucraftcore:dust_dwarf_star_alloy>,
<lucraftcore:dust_copper>,
<lucraftcore:dust_coal>,
<lucraftcore:dust_charcoal>,
<lucraftcore:dust_bronze>,
<lucraftcore:dust_adamantium>,
<lucraftcore:hammer>.withTag({}),
]
 as IItemStack[];

for item in itemstoRemove {
	recipes.remove(item);
}


val oreDicCleanUp as IItemStack[IOreDictEntry] = {

    //<ore:dustCoal>:<enderio:item_material:23>,
    //Seems to be unneeded
    //Ender IO
    /*
	<ore:ingotCrudeSteel>: <gregtech:meta_ingot:32001>,
	<ore:blockCrudeSteel>: <gregtech:meta_block_compressed_2000:1>,
	<ore:nuggetCrudeSteel>: <gregtech:meta_nugget:32001>,

    <ore:blockRedstoneAlloy>:<gregtech:meta_block_compressed_37:15>,
    <ore:ingotRedstoneAlloy>:<gregtech:meta_item_1:10607>,
    <ore:nuggetRedstoneAlloy>:<gregtech:meta_item_1:9607>,

    <ore:blockVibrantAlloy>:<gregtech:meta_block_compressed_38>,
    <ore:ingotVibrantAlloy>:<gregtech:meta_item_1:10608>,
    <ore:nuggetVibrantAlloy>:<gregtech:meta_item_1:9608>,

    <ore:blockEnergeticAlloy>:<gregtech:meta_block_compressed_38:1>,
    <ore:ingotEnergeticAlloy>:<gregtech:meta_item_1:10609>,
    <ore:nuggetEnergeticAlloy>:<gregtech:meta_item_1:9609>,

    <ore:blockDarkSteel>:<gregtech:meta_block_compressed_37:12>,
    <ore:ingotDarkSteel>:<gregtech:meta_item_1:10604>,
    <ore:nuggetDarkSteel>:<gregtech:meta_item_1:9604>,

    <ore:blockPulsatingIron>:<gregtech:meta_block_compressed_37:13>,
    <ore:ingotPulsatingIron>:<gregtech:meta_item_1:10605>,
    <ore:nuggetPulsatingIron>:<gregtech:meta_item_1:9605>,

    <ore:blockConductiveIron>:<gregtech:meta_block_compressed_37:14>,
    <ore:ingotConductiveIron>:<gregtech:meta_item_1:10606>,
    <ore:nuggetConductiveIron>:<gregtech:meta_item_1:9606>,

    <ore:blockSoularium>:<gregtech:meta_block_compressed_38:2>,
    <ore:ingotSoularium>:<gregtech:meta_item_1:10610>,
    <ore:nuggetSoularium>:<gregtech:meta_item_1:9610>,

    <ore:blockEndSteel>:<gregtech:meta_block_compressed_37:10>,
    <ore:ingotEndSteel>:<gregtech:meta_item_1:10602>,
    <ore:nuggetEndSteel>:<gregtech:meta_item_1:9602>,

    <ore:blockElectricalSteel>:<gregtech:meta_block_compressed_37:11>,
    <ore:ingotElectricalSteel>:<gregtech:meta_item_1:10603>,
    <ore:nuggetElectricalSteel>:<gregtech:meta_item_1:9603>,

    <ore:blockEnergeticSilver>:<gregtech:meta_block_compressed_38:7>,
    <ore:ingotEnergeticSilver>:<gregtech:meta_item_1:10615>,
    <ore:nuggetEnergeticSilver>:<gregtech:meta_item_1:9615>,

    <ore:blockCrystallinePinkSlime>:<gregtech:meta_block_compressed_38:6>,
    <ore:ingotCrystallinePinkSlime>:<gregtech:meta_item_1:10614>,
    <ore:nuggetCrystallinePinkSlime>:<gregtech:meta_item_1:9614>,

    <ore:blockVividAlloy>:<gregtech:meta_block_compressed_38:8>,
    <ore:ingotVividAlloy>:<gregtech:meta_item_1:10616>,
    <ore:nuggetVividAlloy>:<gregtech:meta_item_1:9616>,

    <ore:blockStellarAlloy>:<gregtech:meta_block_compressed_38:5>,
    <ore:ingotStellarAlloy>:<gregtech:meta_item_1:10613>,
    <ore:nuggetStellarAlloy>:<gregtech:meta_item_1:9613>,

    <ore:blockMelodicAlloy>:<gregtech:meta_block_compressed_38:4>,
    <ore:ingotMelodicAlloy>:<gregtech:meta_item_1:10612>,
    <ore:nuggetMelodicAlloy>:<gregtech:meta_item_1:9612>,

    //Lucraft
    <ore:ingotVibranium>:<gregtech:meta_item_1:10717>,
    <ore:plateVibranium>:<gregtech:meta_item_1:12717>,
    <ore:dustVibranium>:<gregtech:meta_item_1:2717>,

    <ore:blockDwarfStarAlloy>:<gregtech:meta_block_compressed_38:9>,
    <ore:plateDwarfStarAlloy>:<gregtech:meta_item_1:12617>,
    <ore:ingotDwarfStarAlloy>:<gregtech:meta_item_1:10617>,
    <ore:dustDwarfStarAlloy>:<gregtech:meta_item_1:2617>,
    <ore:nuggetDwarfStarAlloy>:<gregtech:meta_item_1:9617>,

    //Refined Storage
    <ore:blockCrystalized>:<gregtech:meta_block_compressed_37:8>,
    <ore:ingotCrystalized>:<gregtech:meta_item_1:10600>,
    <ore:nuggetCrystalized>:<gregtech:meta_item_1:9600>,
*/


    //Wrong Circits
    <ore:circuitBasic>:<lucraftcore:basic_circuit>,
    <ore:circuitAdvanced>:<lucraftcore:advanced_circuit>,

    // Fix Coal Dust
    <ore:dustCoal>:<threng:material:3>,

    <ore:dustCopper>:<enderio:item_material:26>,
    <ore:dustTin>:<enderio:item_material:27>,
    <ore:dustCobalt>:<enderio:item_material:31>,


} as IItemStack[IOreDictEntry];

for oreDic, item in oreDicCleanUp {
oreDic.remove(item);
JEI.removeAndHide(item);
//JEI.hide(item);
}


static mods as string[] = ["minecraft",  "gregtech", "gtadditions", "enderio","nuclearcraft", "advancedrocketry", "libvulpes", "lucraftcore", "chisel", "actuallyadditions", "threng"];
static size as int = mods.length - 1;

function unify_oredicts (oredict as [IOreDictEntry]) {
    for ore in oredict {

        // Checks if Ore Dict is empty, true = stop
        if (ore.empty != true) { 

            // If more than 1 item in ore dict
            if (ore.itemArray.length > 1) { 
                unify(ore, 0);
            }
        }
    }
}

function unify (ore as IOreDictEntry, p as int) {
    var pos = p;
    var foundMod as bool = false;

    // For every item in the ore dict, check if one is from the <mod>
    for item in ore.itemArray { 

        // check any item is from current mod
        if (item.definition.owner == mods[pos]) {
            foundMod = true;
        }
    }
    
    // If it is from <mod>, remove everything except the item from <mod>, else try next mod until all mods are exhausted
    if (foundMod) {
        for item in ore.itemArray {

            if (item.definition.owner != mods[pos]) {
                ore.remove(item);
                JEI.hide(item);
            }
        }
    } else if (pos < size) {
        pos += 1;
        unify(ore, pos);
    }
}


// Remove Wrong Aluminium
<ore:blockAluminum>.remove(<ore:blockAluminum>.firstItem);
<ore:ingotAluminum>.remove(<ore:ingotAluminum>.firstItem);

// Certus Compatability
<ore:crystalCertusQuartz>.add(<metaitem:gemCertusQuartz>);
<ore:gemCertusQuartz>.remove(<ore:gemCertusQuartz>.firstItem);

// Silicon Compatability
<ore:itemSilicon>.add(<metaitem:plateSilicon>);
<ore:itemSilicon>.remove(<ore:itemSilicon>.firstItem);

// Ender Pearl Powder Compatability
<ore:nuggetEnderpearl>.add(<ore:dustTinyEnderPearl>.firstItem);




// Maganese Dioxide
<ore:dustManganeseDioxide>.add(<ore:dustRegularPyrolusite>.firstItem);

unify_oredicts(<ore:ingot*>);
unify_oredicts(<ore:plate*>);
unify_oredicts(<ore:block*>);
unify_oredicts(<ore:dust*>);
unify_oredicts(<ore:gear*>);
unify_oredicts(<ore:stick*>);
unify_oredicts(<ore:crystal*>);
unify_oredicts(<ore:nugget*>);
unify_oredicts(<ore:egg*>);


unify(<ore:bioplastic>, 0);
unify(<ore:itemSilicon>, 0);



<ore:fusedGlass>.add(<sonarcore:stableglass>);
<ore:fusedGlass>.add(<sonarcore:clearstableglass>);

//Fix EIO Dusts
<enderio:item_material:23>.displayName = "Coal Dust";
furnace.setFuel(<enderio:item_material:23>, 1600);

<enderio:item_material:25>.displayName = "Gold Dust";
<enderio:item_material:29>.displayName = "Obsidian Dust";
<enderio:item_material:24>.displayName = "Iron Dust";
<enderio:item_material:32>.displayName = "Lapis Dust";
<enderio:item_material:33>.displayName = "Quartz Dust";

//<enderio:item_material:26>.displayName = "Copper Dust";
//<enderio:item_material:27>.displayName = "Tin Dust";