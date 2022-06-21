#priority 998

import crafttweaker.item.IItemStack;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.InputIngredient;
import crafttweaker.block.IBlockState;

static primaryColors as string[] = ["Red", "Green", "Blue"] as string[];

static stationCrystalsByStats as IBlockState[][string] = {
	"Blue": [
		<blockstate:contenttweaker:crystal_cluster_blue_1>,
		<blockstate:contenttweaker:crystal_cluster_blue_2>,
		<blockstate:contenttweaker:crystal_cluster_blue_3>,
		<blockstate:contenttweaker:crystal_cluster_blue_4>,
		<blockstate:contenttweaker:crystal_cluster_blue_5>,
		<blockstate:contenttweaker:crystal_cluster_blue_6>,
		<blockstate:contenttweaker:crystal_cluster_blue_7>,
		<blockstate:actuallyadditions:block_crystal_cluster_lapis:facing=up>,
	],
	"Red": [
		<blockstate:contenttweaker:crystal_cluster_red_1>,
		<blockstate:contenttweaker:crystal_cluster_red_2>,
		<blockstate:contenttweaker:crystal_cluster_red_3>,
		<blockstate:contenttweaker:crystal_cluster_red_4>,
		<blockstate:contenttweaker:crystal_cluster_red_5>,
		<blockstate:contenttweaker:crystal_cluster_red_6>,
		<blockstate:contenttweaker:crystal_cluster_red_7>,
		<blockstate:actuallyadditions:block_crystal_cluster_redstone:facing=up>,
	],
	"Green": [
		<blockstate:contenttweaker:crystal_cluster_green_1>,
		<blockstate:contenttweaker:crystal_cluster_green_2>,
		<blockstate:contenttweaker:crystal_cluster_green_3>,
		<blockstate:contenttweaker:crystal_cluster_green_4>,
		<blockstate:contenttweaker:crystal_cluster_green_5>,
		<blockstate:contenttweaker:crystal_cluster_green_6>,
		<blockstate:contenttweaker:crystal_cluster_green_7>,
		<blockstate:actuallyadditions:block_crystal_cluster_emerald:facing=up>,
	],
	"Cyan": [
		<blockstate:contenttweaker:crystal_cluster_cyan_1>,
		<blockstate:contenttweaker:crystal_cluster_cyan_2>,
		<blockstate:contenttweaker:crystal_cluster_cyan_3>,
		<blockstate:contenttweaker:crystal_cluster_cyan_4>,
		<blockstate:contenttweaker:crystal_cluster_cyan_5>,
		<blockstate:contenttweaker:crystal_cluster_cyan_6>,
		<blockstate:contenttweaker:crystal_cluster_cyan_7>,
		<blockstate:actuallyadditions:block_crystal_cluster_diamond:facing=up>,
	],
	"Magenta": [
		<blockstate:contenttweaker:crystal_cluster_magenta_1>,
		<blockstate:contenttweaker:crystal_cluster_magenta_2>,
		<blockstate:contenttweaker:crystal_cluster_magenta_3>,
		<blockstate:contenttweaker:crystal_cluster_magenta_4>,
		<blockstate:contenttweaker:crystal_cluster_magenta_5>,
		<blockstate:contenttweaker:crystal_cluster_magenta_6>,
		<blockstate:contenttweaker:crystal_cluster_magenta_7>,
		<blockstate:contenttweaker:crystal_cluster_magenta_8>,
	],
	"Yellow": [
		<blockstate:contenttweaker:crystal_cluster_yellow_1>,
		<blockstate:contenttweaker:crystal_cluster_yellow_2>,
		<blockstate:contenttweaker:crystal_cluster_yellow_3>,
		<blockstate:contenttweaker:crystal_cluster_yellow_4>,
		<blockstate:contenttweaker:crystal_cluster_yellow_5>,
		<blockstate:contenttweaker:crystal_cluster_yellow_6>,
		<blockstate:contenttweaker:crystal_cluster_yellow_7>,
		<blockstate:contenttweaker:crystal_cluster_yellow_8>,
	],
	"White": [
		<blockstate:contenttweaker:crystal_cluster_white_1>,
		<blockstate:contenttweaker:crystal_cluster_white_2>,
		<blockstate:contenttweaker:crystal_cluster_white_3>,
		<blockstate:contenttweaker:crystal_cluster_white_4>,
		<blockstate:contenttweaker:crystal_cluster_white_5>,
		<blockstate:contenttweaker:crystal_cluster_white_6>,
		<blockstate:contenttweaker:crystal_cluster_white_7>,
		<blockstate:actuallyadditions:block_crystal_cluster_iron:facing=up>,
	],
} as IBlockState[][string];

static stationCrystalStatsMap as int[string][IBlockState] = {
	//////////////////// BLUE ///////////////
    <blockstate:contenttweaker:crystal_cluster_blue_1>: {"Blue": 0},
    <blockstate:contenttweaker:crystal_cluster_blue_2>: {"Blue": 1},
	<blockstate:contenttweaker:crystal_cluster_blue_3>: {"Blue": 2},
	<blockstate:contenttweaker:crystal_cluster_blue_4>: {"Blue": 3},
	<blockstate:contenttweaker:crystal_cluster_blue_5>: {"Blue": 4},
	<blockstate:contenttweaker:crystal_cluster_blue_6>: {"Blue": 5},
	<blockstate:contenttweaker:crystal_cluster_blue_7>: {"Blue": 6},
    //////////////////// RED ///////////////
    <blockstate:contenttweaker:crystal_cluster_red_1>: {"Red": 0},
    <blockstate:contenttweaker:crystal_cluster_red_2>: {"Red": 1},
    <blockstate:contenttweaker:crystal_cluster_red_3>: {"Red": 2},
    <blockstate:contenttweaker:crystal_cluster_red_4>: {"Red": 3},
    <blockstate:contenttweaker:crystal_cluster_red_5>: {"Red": 4},
	<blockstate:contenttweaker:crystal_cluster_red_6>: {"Red": 5},
	<blockstate:contenttweaker:crystal_cluster_red_7>: {"Red": 6},
    //////////////////// GREEN ///////////////
    <blockstate:contenttweaker:crystal_cluster_green_1>: {"Green": 0},
	<blockstate:contenttweaker:crystal_cluster_green_2>: {"Green": 1},
	<blockstate:contenttweaker:crystal_cluster_green_3>: {"Green": 2},
	<blockstate:contenttweaker:crystal_cluster_green_4>: {"Green": 3},
	<blockstate:contenttweaker:crystal_cluster_green_5>: {"Green": 4},
	<blockstate:contenttweaker:crystal_cluster_green_6>: {"Green": 5},
	<blockstate:contenttweaker:crystal_cluster_green_7>: {"Green": 6},
    //////////////////// CYAN ///////////////
    <blockstate:contenttweaker:crystal_cluster_cyan_1>: {"Cyan": 0},
	<blockstate:contenttweaker:crystal_cluster_cyan_2>: {"Cyan": 1},
	<blockstate:contenttweaker:crystal_cluster_cyan_3>: {"Cyan": 2},
	<blockstate:contenttweaker:crystal_cluster_cyan_4>: {"Cyan": 3},
	<blockstate:contenttweaker:crystal_cluster_cyan_5>: {"Cyan": 4},
	<blockstate:contenttweaker:crystal_cluster_cyan_6>: {"Cyan": 5},
	<blockstate:contenttweaker:crystal_cluster_cyan_7>: {"Cyan": 6},
    //////////////////// MAGENTA ///////////////
    <blockstate:contenttweaker:crystal_cluster_magenta_1>: {"Magenta": 0},
	<blockstate:contenttweaker:crystal_cluster_magenta_2>: {"Magenta": 1},
	<blockstate:contenttweaker:crystal_cluster_magenta_3>: {"Magenta": 2},
	<blockstate:contenttweaker:crystal_cluster_magenta_4>: {"Magenta": 3},
	<blockstate:contenttweaker:crystal_cluster_magenta_5>: {"Magenta": 4},
	<blockstate:contenttweaker:crystal_cluster_magenta_6>: {"Magenta": 5},
	<blockstate:contenttweaker:crystal_cluster_magenta_7>: {"Magenta": 6},
    //////////////////// YELLOW ///////////////
    <blockstate:contenttweaker:crystal_cluster_yellow_1>: {"Yellow": 0},
	<blockstate:contenttweaker:crystal_cluster_yellow_2>: {"Yellow": 1},
	<blockstate:contenttweaker:crystal_cluster_yellow_3>: {"Yellow": 2},
	<blockstate:contenttweaker:crystal_cluster_yellow_4>: {"Yellow": 3},
	<blockstate:contenttweaker:crystal_cluster_yellow_5>: {"Yellow": 4},
	<blockstate:contenttweaker:crystal_cluster_yellow_6>: {"Yellow": 5},
	<blockstate:contenttweaker:crystal_cluster_yellow_7>: {"Yellow": 6},
    //////////////////// WHITE ///////////////
    <blockstate:contenttweaker:crystal_cluster_white_1>: {"White": 0},
	<blockstate:contenttweaker:crystal_cluster_white_2>: {"White": 1},
	<blockstate:contenttweaker:crystal_cluster_white_3>: {"White": 2},
	<blockstate:contenttweaker:crystal_cluster_white_4>: {"White": 3},
	<blockstate:contenttweaker:crystal_cluster_white_5>: {"White": 4},
	<blockstate:contenttweaker:crystal_cluster_white_6>: {"White": 5},
	<blockstate:contenttweaker:crystal_cluster_white_7>: {"White": 6},
} as int[string][IBlockState];

static aaCrystalShardColorMap as string[IItemStack] = {
	<actuallyadditions:item_crystal_shard:0>: "Red",
	<actuallyadditions:item_crystal_shard:1>: "Blue",
	<actuallyadditions:item_crystal_shard:2>: "Cyan",
	<actuallyadditions:item_crystal_shard:4>: "Green",
	<actuallyadditions:item_crystal_shard:5>: "White",
	<contenttweaker:crystal_shard_yellow>: "Yellow",
	<contenttweaker:crystal_shard_magenta>: "Magenta",
} as string[IItemStack];

