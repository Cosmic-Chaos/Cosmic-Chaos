#loader multiblocked

import mods.multiblocked.MBDRegistry;
import mods.multiblocked.MBDParticle;
import mods.multiblocked.tile.Controller;
import mods.multiblocked.functions.IUpdateFormed;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.functions.IReceiveCustomData;
import mods.multiblocked.tile.Component;
import mods.multiblocked.client.LaserParticle;

import crafttweaker.data.IData;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntity;
import crafttweaker.player.IPlayer;

val definition = MBDRegistry.getDefinition("mbd:station_generator_controller") as ControllerDefinition;
