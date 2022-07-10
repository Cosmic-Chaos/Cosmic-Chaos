import mods.initialinventory.InvHandler;
import crafttweaker.item.IItemStack;

val startingSuit =
[
	<advancedrocketry:spacehelmet>,
	<advancedrocketry:spacechestplate>.withTag({slotInsert: [1, 1, 1, 1, 1, 1] as byte[] as byte[], size: 6, slotExtract: [1, 1, 1, 1, 1, 1] as byte[] as byte[], outputItems: [{Slot: 0 as byte, ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "advancedrocketry:pressuretank", Count: 1 as byte, tag: {Fluid: {FluidName: "oxygen", Amount: 1000}}, Damage: 0 as short}]}),
	<advancedrocketry:spaceleggings>,
	<advancedrocketry:spaceboots>
]
 as IItemStack[];

for item in startingSuit {
	InvHandler.addStartingItem(item);
}

