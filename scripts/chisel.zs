import crafttweaker.item.IItemStack;
import mods.chisel.Carving;

Carving.addGroup("honeycomb");
Carving.addVariation("honeycomb", <erebus:honey_comb>);
Carving.addVariation("honeycomb", <harvestcraft:honeycomb>);

Carving.addGroup("ebonite");
Carving.addVariation("ebonite", <midnight:ebonys_block>);
Carving.addVariation("ebonite", <metaitem:blockEbony>);

Carving.addGroup("mold");
val moldsToAdd =
[
//    <metaitem:shape.empty>,
    <metaitem:shape.mold.plate>,
    <metaitem:shape.mold.gear>,
    <metaitem:shape.mold.credit>,
    <metaitem:shape.mold.bottle>,
    <metaitem:shape.mold.ingot>,
    <metaitem:shape.mold.ball>,
    <metaitem:shape.mold.block>,
    <metaitem:shape.mold.nugget>,
    <metaitem:shape.mold.cylinder>,
    <metaitem:shape.mold.anvil>,
    <metaitem:shape.mold.name>,
    <metaitem:shape.mold.gear.small>,
    <metaitem:shape.mold.rotor>,
    <contenttweaker:mold_rod>,
]
 as IItemStack[];

for item in moldsToAdd {
Carving.addVariation("mold", item);
}


Carving.addGroup("extruder");
val extrudersToAdd =
[
//    <metaitem:shape.empty>,
    <gregtech:meta_item_1:31>, //To many to use gt hand
    <gregtech:meta_item_1:36>,
    <gregtech:meta_item_1:32>,
    <gregtech:meta_item_1:33>,
    <gregtech:meta_item_1:34>,
    <gregtech:meta_item_1:35>,
    <gregtech:meta_item_1:36>,
    <gregtech:meta_item_1:37>,
    <gregtech:meta_item_1:38>,
    <gregtech:meta_item_1:57>,
    <gregtech:meta_item_1:48>,
    <gregtech:meta_item_1:49>,
    <gregtech:meta_item_1:50>,
    <gregtech:meta_item_1:51>,
    <gregtech:meta_item_1:52>,
    <gregtech:meta_item_1:53>,
    <gregtech:meta_item_1:54>,
    <gregtech:meta_item_1:55>,
    <gregtech:meta_item_1:56>,
    <gregtech:meta_item_1:39>,
    <gregtech:meta_item_1:40>,
    <gregtech:meta_item_1:41>,
    <gregtech:meta_item_1:42>,
    <gregtech:meta_item_1:43>,
    <gregtech:meta_item_1:44>,
    <gregtech:meta_item_1:45>,
    <gregtech:meta_item_1:46>,
    <gregtech:meta_item_1:47>,
]
 as IItemStack[];

for item in extrudersToAdd {
Carving.addVariation("extruder", item);
}

Carving.addGroup("worm_bricks");
val wormPillar =
[
<thebetweenlands:worm_dungeon_pillar>,
<thebetweenlands:worm_dungeon_pillar:1>,
<thebetweenlands:worm_dungeon_pillar:2>,
<thebetweenlands:worm_dungeon_pillar:3>,
<thebetweenlands:worm_dungeon_pillar:4>,
<thebetweenlands:worm_dungeon_pillar:6>,
<thebetweenlands:worm_dungeon_pillar:7>,
<thebetweenlands:worm_dungeon_pillar:8>,
<thebetweenlands:worm_dungeon_pillar:9>,
<thebetweenlands:worm_dungeon_pillar:10>,
]
 as IItemStack[];

for item in wormPillar {
	recipes.remove(item);
    Carving.addVariation("worm_bricks", item);
}


Carving.addGroup("carved_mud_bricks");
val muddyBricks =
[
<thebetweenlands:mud_bricks_carved>,
<thebetweenlands:mud_bricks_carved:1>,
<thebetweenlands:mud_bricks_carved:2>,
<thebetweenlands:mud_bricks_carved:3>,
<thebetweenlands:mud_bricks_carved:4>,
<thebetweenlands:mud_bricks_carved:5>,
<thebetweenlands:mud_bricks_carved:6>,
<thebetweenlands:mud_bricks_carved:7>,
<thebetweenlands:mud_bricks_carved:8>,
<thebetweenlands:mud_bricks_carved:9>,
<thebetweenlands:mud_bricks_carved:10>,
<thebetweenlands:mud_bricks_carved:11>,
<thebetweenlands:mud_bricks_carved:12>,
<thebetweenlands:mud_bricks_carved:13>,
]
 as IItemStack[];

for item in muddyBricks {
	recipes.remove(item);
    Carving.addVariation("carved_mud_bricks", item);
}
