import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IIngredient;


// ULV Station Generator Controller Recipe
craft.remake(<mbd:station_generator_controller>, ["pretty",
  "¤ P ¤",
  "L t L",
  "* ⌂ *"], {
  "¤": <metaitem:gearCrudeSteel>,                    # Small Bronze Gear
  "P": <metaitem:circuit.vacuum_tube>,                   # Vacuum Tube
  "L": <metaitem:electric.motor.ulv>,               # LV Electric Motor
  "t": <contenttweaker:controller_broken_north>, # tile.contenttweaker.controller_broken_north.name
  "*": <ore:wireGtDoubleGreenCrystalAlloy>,      # 2x Green Crystal Alloy Wire
  "⌂": <contenttweaker:station_casing>,          # Derelict Casing
});