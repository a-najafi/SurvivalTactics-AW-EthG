// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;


import { Wood, Stone, Cord, Fish, Berry } from "../codegen/Tables.sol";
import { Position, MovementCost } from "../codegen/Tables.sol";
import { IsObstruction, IsBearSpawner, IsWolfSpawner } from "../codegen/Tables.sol";
import { IsChopable, IsMinable, IsFishable, IsLootable, IsPushable } from "../codegen/Tables.sol";
import { ClientContext } from "../codegen/Tables.sol";
import { MaxHP } from "../codegen/Tables.sol";
import { LibUtils } from "../libraries/LibUtils.sol";
import { IWorld } from "../codegen/world/IWorld.sol";

library LibSpawn {


  function spawnTree(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsChopable.set(world,entity,true);
    Wood.set(world,entity,1000);
    IsObstruction.set(world,entity,true);
    ClientContext.set(world,entity,"Tree");
    MaxHP.set(world,entity,50);
    return entity;
  }


  function spawnMud(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    MovementCost.set(world,entity,2);
    ClientContext.set(world,entity,"Mud");
    return entity;
  }


  function spawnBoulder(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsMinable.set(world,entity,true);
    IsPushable.set(world,entity,true);
    Stone.set(world,entity,1000);
    IsObstruction.set(world,entity,true);
    ClientContext.set(world,entity,"Boulder");
    MaxHP.set(world,entity,100);
    return entity;
  }

  function spawnVine(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsChopable.set(world,entity,true);
    Cord.set(world,entity,1000);
    MovementCost.set(world,entity,2);
    ClientContext.set(world,entity,"Vine");
    MaxHP.set(world,entity,10);
    return entity;
  }
  function spawnBerryBush(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsChopable.set(world,entity,true);
    Berry.set(world,entity,1000);
    MovementCost.set(world,entity,2);
    ClientContext.set(world,entity,"BerryBush");
    MaxHP.set(world,entity,10);
    return entity;
  }

  function spawnPond(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsObstruction.set(world,entity,true);
    IsFishable.set(world,entity,true);
    Fish.set(world,entity,1000);
    ClientContext.set(world,entity,"Pond");
    return entity;
  }

   function spawnLootCrate(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsObstruction.set(world,entity,true);
    IsPushable.set(world,entity,true);
    IsLootable.set(world,entity,true);
    ClientContext.set(world,entity,"LootCrate");
    MaxHP.set(world,entity,50);
    return entity;
  }
  function spawnCave(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsObstruction.set(world,entity,true);
    IsBearSpawner.set(world,entity,true);
    ClientContext.set(world,entity,"Cave");
    MaxHP.set(world,entity,300);
    return entity;
  }
  function spawnWolfDen(address worldAddress,uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    IWorld world = IWorld(worldAddress);
    Position.set(world,entity, x, y);
    IsObstruction.set(world,entity,true);
    IsWolfSpawner.set(world,entity,true);
    ClientContext.set(world,entity,"WolfDen");
    MaxHP.set(world,entity,200);
    return entity;
  }

}
