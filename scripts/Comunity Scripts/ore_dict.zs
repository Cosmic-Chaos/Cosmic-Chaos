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


static mods as string[] = ["minecraft",  "gregtech", "gtadditions", "devtech","enderio","nuclearcraft", "advancedrocketry", "libvulpes", "lucraftcore", "chisel", "actuallyadditions", "threng", "appliedenergistics2"];
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

/*
// Certus Compatability
<ore:crystalCertusQuartz>.add(<metaitem:gemCertusQuartz>);
<ore:gemCertusQuartz>.remove(<ore:gemCertusQuartz>.firstItem);
*/
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


<ore:bioChaff>.add(<metaitem:bio_chaff>);

//Needs the extra i
<ore:sheetAluminium>.add(<libvulpes:productsheet:9>);

/*
//Fix EIO Dusts
<enderio:item_material:23>.displayName = "Coal Dust";


<enderio:item_material:25>.displayName = "Gold Dust";
<enderio:item_material:29>.displayName = "Obsidian Dust";
<enderio:item_material:24>.displayName = "Iron Dust";
<enderio:item_material:32>.displayName = "Lapis Dust";
<enderio:item_material:33>.displayName = "Quartz Dust";
*/
//<enderio:item_material:26>.displayName = "Copper Dust";
//<enderio:item_material:27>.displayName = "Tin Dust";

// Remove redundant mushroom stew recipes
recipes.removeByRecipeName("quark:mushroom_stew");
recipes.removeByRecipeName("harvestcraft:minecraft_mushroomstew");

val oreNameMap as IItemStack[][string] = {
	"listAllmushroom": [		
		<advancedrocketry:electricmushroom:0>,
		<erebus:materials:48>,
		<erebus:double_plant:5>,
		<erebus:double_plant:6>,
		<erebus:dark_capped_mushroom:0>,
		<erebus:sarcastic_czech_mushroom:0>,
		<erebus:grandmas_shoes_mushroom:0>,
		<erebus:dutch_cap_mushroom:0>,
		<erebus:kaizers_fingers_mushroom:0>,
		<nuclearcraft:glowing_mushroom:0>,
		<quark:glowshroom:0>,
		<randomthings:glowingmushroom:0>,
		<theaurorian:mushroomsmall:0>
	]
} as IItemStack[][string];

for name, itemList in oreNameMap {
	for item in itemList {
		oreDict.get(name).add(item);
	}
}

<ore:foodFlour>.add(<metaitem:dustWheat>);
<ore:foodSalt>.add(<metaitem:dustWheat>);

<ore:gemSulfur>.add(<thebetweenlands:items_misc:18>);

<ore:gemCertusQuartz>.add(<appliedenergistics2:material>);

<ore:gemGreenCrystal>.add(<actuallyadditions:item_crystal_shard:4>);
<ore:gemRedCrystal>.add(<actuallyadditions:item_crystal_shard>);
<ore:gemBlueCrystal>.add(<actuallyadditions:item_crystal_shard:1>);

<ore:paper>.add(<contenttweaker:root_paper>);