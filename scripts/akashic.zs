import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide;

val books as IItemStack[] = [
	<industrialforegoing:book_manual>,
	<integrateddynamics:on_the_dynamics_of_integration>,
	<patchouli:guide_book>.withTag({"patchouli:book": "midnight:eternal_night"}),
	<theoneprobe:probenote>,
	<patchouli:guide_book>.withTag({"patchouli:book": "pneumaticcraft:book"}),
	<patchouli:guide_book>.withTag({"patchouli:book": "qmd:guide"}),
	<cookingforblockheads:recipe_book:1>,
	<fossil:dinopedia>,
	<rftools:rftools_manual>,
	<cookingforblockheads:recipe_book:2>,
	<solcarrot:food_book>,
	<rftools:rftools_shape_manual>,
	<jecalculation:item_calculator>,
	<projecte:item.pe_manual>,
	<actuallyadditions:item_booklet>,
	<industrialrenewal:ir_manual>,
	<opencomputers:tool:4>,
	<jecalculation:item_calculator:1>,
	<hammercore:manual>,
	<cookingforblockheads:recipe_book>,
	<betterquesting:guide_book>,
	<xnet:xnet_manual>,
	<patchouli:guide_book>.withTag({"patchouli:book": "nuclearcraft:guide"}),
] as IItemStack[];

for book in books {
	removeAndHide(book);
}
//Removed Useless Books
recipes.addShapeless("akashic_tome", <akashictome:tome>.withTag({"akashictome:is_morphing": 1 as byte, "akashictome:data": {
	industrialforegoing: {id: "industrialforegoing:book_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "industrialforegoing"}, Damage: 0 as short}, 
	integratedtunnels: {id: "integrateddynamics:on_the_dynamics_of_integration", Count: 1 as byte, tag: {"akashictome:definedMod": "integratedtunnels"}, Damage: 0 as short}, 
	pneumaticcraft: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "pneumaticcraft", "patchouli:book": "pneumaticcraft:book"}, Damage: 0 as short}, 
	qmd: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "qmd", "patchouli:book": "qmd:guide"}, Damage: 0 as short}, 
	rftools: {id: "rftools:rftools_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools"}, Damage: 0 as short}, 
	fossil: {id: "fossil:dinopedia", Count: 1 as byte, tag: {"akashictome:displayName": "Dinopedia", "akashictome:definedMod": "fossil", "akashictome:is_morphing": 1 as byte, display: {Name: "§rAkashic Tome (§aDinopedia§r)"}}, Damage: 0 as short}, 
	cookingforblockheads1: {id: "cookingforblockheads:recipe_book", Count: 1 as byte, tag: {"akashictome:displayName": "Cooking for Blockheads II", "akashictome:definedMod": "cookingforblockheads1", "akashictome:is_morphing": 1 as byte, display: {Name: "§rAkashic Tome (§aCooking for Blockheads II§r)"}}, Damage: 2 as short}, 
	solcarrot: {id: "solcarrot:food_book", Count: 1 as byte, tag: {"akashictome:definedMod": "solcarrot"}, Damage: 0 as short}, 
	rftools1: {id: "rftools:rftools_shape_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools1"}, Damage: 0 as short}, 
	jecalculation: {id: "jecalculation:item_calculator", Count: 1 as byte, tag: {"akashictome:definedMod": "jecalculation"}, Damage: 0 as short}, 
	actuallyadditions: {id: "actuallyadditions:item_booklet", Count: 1 as byte, tag: {"akashictome:definedMod": "actuallyadditions"}, Damage: 0 as short}, 
	industrialrenewal: {id: "industrialrenewal:ir_manual", Count: 1 as byte, tag: {"akashictome:displayName": "Industrial Renewal Manual", "akashictome:definedMod": "industrialrenewal", "akashictome:is_morphing": 1 as byte, display: {Name: "§rAkashic Tome (§aIndustrial Renewal Manual§r)"}}, Damage: 0 as short}, 
	opencomputers: {id: "opencomputers:tool", Count: 1 as byte, tag: {"akashictome:displayName": "OpenComputers Manual", "akashictome:definedMod": "opencomputers", "akashictome:is_morphing": 1 as byte, display: {Name: "§rAkashic Tome (§aOpenComputers Manual§r)"}}, Damage: 4 as short}, 
	jecalculation1: {id: "jecalculation:item_calculator", Count: 1 as byte, tag: {"akashictome:definedMod": "jecalculation1"}, Damage: 1 as short}, xnet: {id: "xnet:xnet_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "xnet"}, Damage: 0 as short}, 
	nuclearcraft: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "nuclearcraft", "patchouli:book": "nuclearcraft:guide"}, Damage: 0 as short}}}), 
	[<ore:bookEmpty>, <ore:bookshelf>]);

