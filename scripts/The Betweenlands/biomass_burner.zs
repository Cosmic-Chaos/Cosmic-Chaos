import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

print("==================== loading The Station/biomass_burner.zs ====================");
##########################################################################################

/////////////////////////////////////////////////////////////////////
/////////////////////// BIOMASS BURNNER /////////////////////////////
/////////////////////////////////////////////////////////////////////

# [Primitive Biomass Burner] from [ULV Machine Hull][+4]
craft.remake(<metaitem:devtech:biomass_burner.ulv>, ["pretty",
  "G l G",
  "U L U",
  "G H G"], {
  "G": <ore:wireGtDoubleCopper>,           # 2x Copper Wire
  "l": <metaitem:circuit.vacuum_tube>,                   # Vacuum Tube
  "U": <metaitem:electric.piston.ulv>, # ULV Electric Piston
  "L": <metaitem:hull.ulv>,             # ULV Machine Hull
  "H": <ore:toolHeadBuzzSawCrudeSteel>,    # Crude Steel Buzzsaw Blade
});

# [Basic Biomass Burner] from [LV Machine Hull][+4]
craft.remake(<metaitem:devtech:biomass_burner.lv>, ["pretty",
  "G v G",
  "L V L",
  "G H G"], {
  "G": <ore:wireGtDoubleTin>,      # 2x Tin Wire
  "v": <ore:circuitLv>,            # Electronic Circuit
  "L": <metaitem:electric.piston.lv>, # LV Electric Piston
  "V": <metaitem:hull.lv>,     # LV Machine Hull
  "H": <ore:toolHeadBuzzSawSteel>, # Steel Buzzsaw Blade
});

val oreNameMap as IItemStack[][string] = {
	"plants": [		
    <thebetweenlands:edge_moss>,
    <thebetweenlands:edge_leaf>,
    <thebetweenlands:edge_shroom>,
    <thebetweenlands:pitcher_plant>,
    <thebetweenlands:weeping_blue>,
    <thebetweenlands:sundew>,
    <thebetweenlands:black_hat_mushroom>,
    <thebetweenlands:bulb_capped_mushroom>,
    <thebetweenlands:flat_head_mushroom>,
    <thebetweenlands:venus_fly_trap>,
    <thebetweenlands:volarpad>,
    <thebetweenlands:swamp_plant>,
    <thebetweenlands:moss>,
    <thebetweenlands:dead_moss>,
    <thebetweenlands:lichen>,
    <thebetweenlands:dead_lichen>,
    <thebetweenlands:weedwood_bush>,
    <thebetweenlands:mire_coral>,
    <thebetweenlands:deep_water_coral>,
    <thebetweenlands:water_weeds>,
    <thebetweenlands:algae>,
    <thebetweenlands:poison_ivy>,
    <thebetweenlands:arrow_arum>,
    <thebetweenlands:blue_iris>,
    <thebetweenlands:blue_eyed_grass>,
    <thebetweenlands:root>,
    <thebetweenlands:boneset>,
    <thebetweenlands:bottle_brush_grass>,
    <thebetweenlands:broomsedge>,
    <thebetweenlands:button_bush>,
    <thebetweenlands:cardinal_flower>,
    <thebetweenlands:cattail>,
    <thebetweenlands:cave_grass>,
    <thebetweenlands:copper_iris>,
    <thebetweenlands:marsh_hibiscus>,
    <thebetweenlands:marsh_mallow>,
    <thebetweenlands:bladderwort_flower>,
    <thebetweenlands:bladderwort_stalk>,
    <thebetweenlands:bog_bean_flower>,
    <thebetweenlands:golden_club_flower>,
    <thebetweenlands:marsh_marigold_flower>,
    <thebetweenlands:swamp_double_tallgrass>,
    <thebetweenlands:milkweed>,
    <thebetweenlands:nettle>,
    <thebetweenlands:nettle_flowered>,
    <thebetweenlands:pickerel_weed>,
    <thebetweenlands:phragmites>,
    <thebetweenlands:shoots>,
    <thebetweenlands:sludgecreep>,
    <thebetweenlands:tall_sludgecreep>,
    <thebetweenlands:soft_rush>,
    <thebetweenlands:thorns>,
    <thebetweenlands:tall_cattail>,
    <thebetweenlands:swamp_tallgrass>,
    <thebetweenlands:dead_weedwood_bush>,
    <thebetweenlands:weedwood_bush>,
    <thebetweenlands:cave_moss>,
    <thebetweenlands:cryptweed>,
    <thebetweenlands:string_roots>,
    <thebetweenlands:pale_grass>,
    <thebetweenlands:rotbulb>,
    <thebetweenlands:hanger>,
    <thebetweenlands:hanger:3>,
	],"plantItems": [		
    <thebetweenlands:fallen_leaves>,
    <thebetweenlands:swamp_reed_item>,
    <thebetweenlands:items_misc:7>,
    <thebetweenlands:items_plant_drop>,
    <thebetweenlands:items_plant_drop:1>,
    <thebetweenlands:items_plant_drop:2>,
    <thebetweenlands:items_plant_drop:3>,
    <thebetweenlands:items_plant_drop:4>,
    <thebetweenlands:items_plant_drop:5>,
    <thebetweenlands:items_plant_drop:6>,
    <thebetweenlands:items_plant_drop:7>,
    <thebetweenlands:items_plant_drop:8>,
    <thebetweenlands:items_plant_drop:9>,
    <thebetweenlands:items_plant_drop:10>,
    <thebetweenlands:items_plant_drop:11>,
    <thebetweenlands:items_plant_drop:12>,
    <thebetweenlands:items_plant_drop:13>,
    <thebetweenlands:items_plant_drop:14>,
    <thebetweenlands:items_plant_drop:15>,
    <thebetweenlands:items_plant_drop:16>,
    <thebetweenlands:items_plant_drop:18>,
    <thebetweenlands:items_plant_drop:17>,
    <thebetweenlands:items_plant_drop:19>,
    <thebetweenlands:items_plant_drop:20>,
    <thebetweenlands:items_plant_drop:21>,
    <thebetweenlands:items_plant_drop:22>,
    <thebetweenlands:items_plant_drop:23>,
    <thebetweenlands:items_plant_drop:24>,
    <thebetweenlands:items_plant_drop:25>,
    <thebetweenlands:items_plant_drop:26>,
    <thebetweenlands:items_plant_drop:27>,
    <thebetweenlands:items_plant_drop:28>,
    <thebetweenlands:items_plant_drop:29>,
    <thebetweenlands:items_plant_drop:30>,
    <thebetweenlands:items_plant_drop:31>,
    <thebetweenlands:items_plant_drop:32>,
    <thebetweenlands:items_plant_drop:33>,
    <thebetweenlands:items_plant_drop:34>,
    <thebetweenlands:items_plant_drop:35>,
    <thebetweenlands:items_plant_drop:36>,
    <thebetweenlands:items_plant_drop:37>,
    <thebetweenlands:items_plant_drop:38>,
    <thebetweenlands:items_plant_drop:39>,
    <thebetweenlands:items_plant_drop:40>,
    <thebetweenlands:items_plant_drop:41>,
    <thebetweenlands:items_plant_drop:42>,
    <thebetweenlands:items_plant_drop:43>,
    <thebetweenlands:items_plant_drop:44>,
    <thebetweenlands:items_plant_drop:45>,
    <thebetweenlands:items_plant_drop:46>,
    <thebetweenlands:items_plant_drop:47>,
    <thebetweenlands:swamp_kelp_item>,
    <thebetweenlands:tangled_root>,
	],"groundPlants": [		
    <thebetweenlands:items_crushed>,
    <thebetweenlands:items_crushed:1>,
    <thebetweenlands:items_crushed:2>,
    <thebetweenlands:items_crushed:3>,
    <thebetweenlands:items_crushed:4>,
    <thebetweenlands:items_crushed:5>,
    <thebetweenlands:items_crushed:6>,
    <thebetweenlands:items_crushed:7>,
    <thebetweenlands:items_crushed:8>,
    <thebetweenlands:items_crushed:9>,
    <thebetweenlands:items_crushed:10>,
    <thebetweenlands:items_crushed:11>,
    <thebetweenlands:items_crushed:12>,
    <thebetweenlands:items_crushed:13>,
    <thebetweenlands:items_crushed:14>,
    <thebetweenlands:items_crushed:15>,
    <thebetweenlands:items_crushed:16>,
    <thebetweenlands:items_crushed:18>,
    <thebetweenlands:items_crushed:20>,
    <thebetweenlands:items_crushed:22>,
    <thebetweenlands:items_crushed:23>,
    <thebetweenlands:items_crushed:24>,
    <thebetweenlands:items_crushed:25>,
    <thebetweenlands:items_crushed:26>,
    <thebetweenlands:items_crushed:27>,
    <thebetweenlands:items_crushed:29>,
    <thebetweenlands:items_crushed:30>,
    <thebetweenlands:items_crushed:31>,
    <thebetweenlands:items_crushed:33>,
    <thebetweenlands:items_crushed:34>,
    <thebetweenlands:items_crushed:35>,
    <thebetweenlands:items_crushed:36>,
    <thebetweenlands:items_crushed:38>,
    <thebetweenlands:items_crushed:39>,
    <thebetweenlands:items_crushed:40>,
    <thebetweenlands:items_crushed:41>,
    <thebetweenlands:items_crushed:42>,
    <thebetweenlands:items_crushed:43>,
    <thebetweenlands:items_crushed:44>,
    <thebetweenlands:items_crushed:46>,
    <thebetweenlands:items_crushed:47>,
    <thebetweenlands:items_crushed:48>,
    <thebetweenlands:items_crushed:49>,
    <thebetweenlands:items_crushed:50>,
    <thebetweenlands:items_crushed:51>,
    <thebetweenlands:items_crushed:52>,
    <thebetweenlands:items_crushed:53>,
    <thebetweenlands:items_crushed:54>,
    <thebetweenlands:items_crushed:55>,
    <thebetweenlands:items_crushed:56>,
    <thebetweenlands:items_crushed:57>,
    <thebetweenlands:items_crushed:58>,
    <thebetweenlands:items_crushed:59>,
    <thebetweenlands:items_crushed:60>,
	]
} as IItemStack[][string];

for name, itemList in oreNameMap {
	for item in itemList {
		oreDict.get(name).add(item);
	}
}

//Tier scalling is 4x consumption for 4x output if base output is lower tier
////SOLID FUEL
val soildBioFuelMap as int[IItemStack] = {
<metaitem:bio_chaff>:320,
<metaitem:plant_ball>:320,
<actuallyadditions:item_misc:21>:80,
<actuallyadditions:item_misc:1>:80,
} as int[IItemStack];

for input, dur in soildBioFuelMap {
	<recipemap:biomass_burner>.recipeBuilder()
		.inputs(input)
		.duration(dur).EUt(-32).buildAndRegister();
}


val soildBioFuelOreMap as int[IOreDictEntry] = {
<ore:treeLeaves>:40,
<ore:logWood>:160,
<ore:plankWood>:40,
<ore:stickWood>:20,
<ore:treeSapling>:40,

<ore:plants>:80,
<ore:plantItems>:160,
<ore:groundPlants>:200,
} as int[IOreDictEntry];

for input, dur in soildBioFuelOreMap {
	<recipemap:biomass_burner>.recipeBuilder()
		.inputs(input)
		.duration(dur).EUt(-32).buildAndRegister();
}


##########################################################################################
print("==================== end of The Station/biomass_burner.zs ====================");
