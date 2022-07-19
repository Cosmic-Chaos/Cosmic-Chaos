import crafttweaker.item.IItemStack;

# [Basic Tank] from [Iron Drum][+2]
craft.remake(<fluiddrawers:tank>, ["pretty",
  "G ╱ G",
  "╱ I ╱",
  "G ╱ G"], {
  "G": <ore:paneGlassColorless>, # Glass Pane
  "╱": <ore:stickSteel>,                           # Steel Rod
  "I": <metaitem:drum.steel>,                       # Iron Drum
});

val chestMap as string[IItemStack] = {
	<minecraft:chest>: "oak",
	<quark:custom_chest:0>: "spruce",
	<quark:custom_chest:1>: "birch",
	<quark:custom_chest:2>: "jungle",
	<quark:custom_chest:3>: "acacia",
	<quark:custom_chest:4>: "dark_oak",
} as string[IItemStack];

for chest, material in chestMap {
	# Material [Drawer] from Material [Chest][+1]
	craft.remake(<storagedrawers:basicdrawers>.withTag({material: material}), ["pretty",
	  "# # #",
	  "  c  ",
	  "# # #"], {
	  "#": <ore:plateTreatedWood>, # Treated Wood Plank
	  "c": chest,
	});

	# Material [Drawers 1x2] from Material [Chest][+1]
	craft.remake(<storagedrawers:basicdrawers:1>.withTag({material: material})*2, ["pretty",
	  "# c #",
	  "# # #",
	  "# c #"], {
	  "#": <ore:plateTreatedWood>, # Treated Wood Plank
	  "c": chest,
	});

	# Material [Drawers 2x2] from Material [Chest][+1]
	craft.remake(<storagedrawers:basicdrawers:2>.withTag({material: material})*4, ["pretty",
	  "c # c",
	  "# # #",
	  "c # c"], {
	  "c": chest,
	  "#": <ore:plateTreatedWood>, # Treated Wood Plank
	});

	# Material [Half Drawers 1x2] from Material [Chest][+1]
	craft.remake(<storagedrawers:basicdrawers:3>.withTag({material: material})*2, ["pretty",
	  "c   #",
	  "# # #",
	  "# # c"], {
	  "c": chest,
	  "#": <ore:plateTreatedWood>, # Treated Wood Plank
	});

	# Material [Half Drawers 2x2] from Material [Chest][+1]
	craft.remake(<storagedrawers:basicdrawers:4>.withTag({material: material})*4, ["pretty",
	  "# c #",
	  "c # c",
	  "# c #"], {
	  "#": <ore:plateTreatedWood>, # Treated Wood Plank
	  "c": chest,
	});
}

# [Compacting Drawer] from [LV Robot Arm][+2]
craft.remake(<storagedrawers:compdrawers>, ["pretty",
  "s s s",
  "s c s",
  "c L c"], {
  "s": <ore:stone>, # Stone
  "c": <ore:chestWood>, # Oak Chest
  "L": <metaitem:robot.arm.lv>,    # LV Robot Arm
});

# [Drawer Controller] from [Exquisite Diamond][+2]
craft.remake(<storagedrawers:controller>, ["pretty",
  "s s s",
  "M ◊ M",
  "s M s"], {
  "s": <ore:stone>, # Stone
  "M": <ore:circuitMv>,           # Good Electronic Circuit
  "◊": <ore:gemExquisiteDiamond>, # Exquisite Diamond
});

# [Controller Slave] from [Double Gold Plate][+2]
craft.remake(<storagedrawers:controllerslave>, ["pretty",
  "s s s",
  "L □ L",
  "s L s"], {
  "s": <ore:stone>, # Stone
  "L": <ore:circuitLv>,       # Electronic Circuit
  "□": <ore:plateDoubleGold>, # Double Gold Plate
});

# [Framed Tank] from [Basic Tank][+1]
craft.remake(<fluiddrawers:tank_custom>, ["pretty",
  "# # #",
  "# B #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "B": <fluiddrawers:tank>,    # Basic Tank
});

# [Framed Compacting Drawer] from [Compacting Drawer][+1]
craft.remake(<framedcompactdrawers:framed_compact_drawer>, ["pretty",
  "# # #",
  "# C #",
  "# # #"], {
  "#": <ore:stickTreatedWood>,       # Treated Wood Stick
  "C": <storagedrawers:compdrawers>, # Compacting Drawer
});

# [Framed Drawer Controller] from [Drawer Controller][+1]
craft.remake(<framedcompactdrawers:framed_drawer_controller>, ["pretty",
  "# # #",
  "# D #",
  "# # #"], {
  "#": <ore:stickTreatedWood>,      # Treated Wood Stick
  "D": <storagedrawers:controller>, # Drawer Controller
});

# [Framed Controller Slave] from [Controller Slave][+1]
craft.remake(<framedcompactdrawers:framed_slave>, ["pretty",
  "# # #",
  "# C #",
  "# # #"], {
  "#": <ore:stickTreatedWood>,           # Treated Wood Stick
  "C": <storagedrawers:controllerslave>, # Controller Slave
});

# [Framed Drawer] from [Basic Drawer][+1]
craft.remake(<storagedrawers:customdrawers>, ["pretty",
  "# # #",
  "# B #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "B": <storagedrawers:basicdrawers>,      # Basic Drawer
});

# [Framed Drawers 1x2] from [Basic Drawers 1x2][+1]
craft.remake(<storagedrawers:customdrawers:1>, ["pretty",
  "# # #",
  "# B #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "B": <storagedrawers:basicdrawers:1>,      # Basic Drawers 1x2
});

# [Framed Drawers 2x2] from [Basic Drawers 2x2][+1]
craft.remake(<storagedrawers:customdrawers:2>, ["pretty",
  "# # #",
  "# B #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "B": <storagedrawers:basicdrawers:2>,      # Basic Drawers 2x2
});

# [Framed Half Drawers 1x2] from [Half Drawers 1x2][+1]
craft.remake(<storagedrawers:customdrawers:3>, ["pretty",
  "# # #",
  "# B #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "B": <storagedrawers:basicdrawers:3>,      # Half Drawers 1x2
});

# [Framed Half Drawers 2x2] from [Half Drawers 2x2][+1]
craft.remake(<storagedrawers:customdrawers:4>, ["pretty",
  "# # #",
  "# B #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "B": <storagedrawers:basicdrawers:4>,      # Half Drawers 2x2
});

# [Framed Trim] from [Oak Trim][+1]
craft.remake(<storagedrawers:customtrim>, ["pretty",
  "# # #",
  "# T #",
  "# # #"], {
  "#": <ore:stickTreatedWood>, # Treated Wood Stick
  "T": <ore:drawerTrim>,       # Oak Trim
});
