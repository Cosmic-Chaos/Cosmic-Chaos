import crafttweaker.item.IItemStack;
import mods.chisel.Carving;

<chisel:technicalnew:2>.displayName = "Hull Block";
<chisel:factory:9>.displayName = "Rusty Hull";
<chisel:laboratory:11>.displayName = "Tough Hull";

<contenttweaker:crowbar>.addShiftTooltip("You feel like you probably shouldn't speak while holding it.");
<contenttweaker:crowbar_t2>.addShiftTooltip("You walk a little taller now that you have it.");


//furnace.setFuel(<contenttweaker:internals_t1>, 400);
//furnace.setFuel(<contenttweaker:internals_t2>, 800);

//iron hull crafting changed
Carving.removeVariation("factory", <chisel:technicalnew:2>);

//Copper Hull
Carving.removeVariation("factory", <chisel:factory:9>);

//Dense Hull
Carving.removeVariation("laboratory", <chisel:laboratory:11>);

//Fancy Hull
Carving.removeVariation("laboratory", <chisel:laboratory:5>);
Carving.removeVariation("laboratory", <chisel:laboratory:15>);

//For Walking
recipes.addShaped(<chisel:laboratory:8> * 4, [[null, <contenttweaker:hull_plate_t1>, null],[<contenttweaker:hull_plate_t3>, <contenttweaker:internals_t1>, <contenttweaker:hull_plate_t3>], [null, <contenttweaker:hull_plate_t1>, null]]);
Carving.removeVariation("laboratory", <chisel:laboratory:8>);

//No Fans
Carving.removeVariation("factory", <chisel:technical:14>);

//scaffold crafting changed
Carving.removeVariation("factory", <chisel:technical:0>);
