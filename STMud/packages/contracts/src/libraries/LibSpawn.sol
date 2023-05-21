// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;


import { Wood, Stone, Cord, Fish, Berry } from "../codegen/Tables.sol";
import { Position, MovementCost } from "../codegen/Tables.sol";
import { IsObstruction, IsBearSpawner, IsWolfSpawner } from "../codegen/Tables.sol";
import { IsChopable, IsMinable, IsFishable, IsLootable, IsPushable } from "../codegen/Tables.sol";
import { ClientContext } from "../codegen/Tables.sol";
import { MaxHP } from "../codegen/Tables.sol";

library LibSpawn {


  function spawnTree(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsChopable.set(entity,true);
    Wood.set(entity,1000);
    IsObstruction.set(entity,true);
    ClientContext.set(entity,"Tree");
    MaxHP.set(entity,50);
    return entity;
  }


  function spawnMud(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    MovementCost.set(entity,2);
    ClientContext.set(entity,"Mud");
    return entity;
  }


  function spawnBoulder(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsMinable.set(entity,true);
    IsPushable.set(entity,true);
    Stone.set(entity,1000);
    IsObstruction.set(entity,true);
    ClientContext.set(entity,"Boulder");
    MaxHP.set(entity,100);
    return entity;
  }

  function spawnVine(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsChopable.set(entity,true);
    Cord.set(entity,1000);
    MovementCost.set(entity,2);
    ClientContext.set(entity,"Vine");
    MaxHP.set(entity,10);
    return entity;
  }
  function spawnBerryBush(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsChopable.set(entity,true);
    Berry.set(entity,1000);
    MovementCost.set(entity,2);
    ClientContext.set(entity,"BerryBush");
    MaxHP.set(entity,10);
    return entity;
  }

  function spawnPond(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsObstruction.set(entity,true);
    IsFishable.set(entity,true);
    Fish.set(entity,1000);
    ClientContext.set(entity,"Pond");
    return entity;
  }

   function spawnLootCrate(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsObstruction.set(entity,true);
    IsPushable.set(entity,true);
    IsLootable.set(entity,true);
    ClientContext.set(entity,"LootCrate");
    MaxHP.set(entity,50);
    return entity;
  }
  function spawnCave(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsObstruction.set(entity,true);
    IsBearSpawner.set(entity,true);
    ClientContext.set(entity,"Cave");
    MaxHP.set(entity,300);
    return entity;
  }
  function spawnWolfDen(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsObstruction.set(entity,true);
    IsWolfSpawner.set(entity,true);
    ClientContext.set(entity,"WolfDen");
    MaxHP.set(entity,200);
    return entity;
  }

}
