// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { MapConfig} from "../codegen/Tables.sol";
import { Wood, Stone, Cord, Fish, Berry } from "../codegen/Tables.sol";
import { Position, MovementCost } from "../codegen/Tables.sol";
import { IsObstruction, IsBearSpawner, IsWolfSpawner } from "../codegen/Tables.sol";
import { IsChopable, IsMinable, IsFishable, IsFishable, IsPushable } from "../codegen/Tables.sol";
import { ClientContext } from "../codegen/Tables.sol";
import { MaxHP } from "../codegen/Tables.sol";
import { TerrainType } from "../codegen/Types.sol";
import { LibUtils } from "../libraries/LibUtils.sol";


bytes32 constant SingletonKey = bytes32(uint256(0x060D));

contract InitSystem is System {
  function init() public {

    TerrainType O = TerrainType.None;
    TerrainType T = TerrainType.Tree;
    TerrainType M = TerrainType.Mud;
    TerrainType B = TerrainType.Boulder;
    TerrainType V = TerrainType.Vine;
    TerrainType L = TerrainType.LootCrate;
    TerrainType F = TerrainType.BerryBush;
    TerrainType P = TerrainType.Pond;
    TerrainType W = TerrainType.WolfDen;
    TerrainType C = TerrainType.Cave;
    

    TerrainType[20][20] memory map = [
      [O, O, O, O, O, O, T, O, O, O, O, O, O, O, O, O, O, O, O, O],
      [O, O, T, O, O, O, O, O, T, O, O, O, O, B, O, O, O, O, O, O],
      [O, T, T, T, T, O, O, O, O, O, O, O, O, O, O, T, T, O, O, O],
      [O, O, T, T, T, T, O, O, O, O, B, O, O, O, O, O, T, O, O, O],
      [O, O, O, O, T, T, O, O, O, O, O, O, O, O, O, O, O, T, O, O],
      [O, O, O, B, B, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O],
      [O, T, O, O, O, B, B, O, O, O, O, T, O, O, O, O, O, B, O, O],
      [O, O, T, T, O, O, O, O, O, T, O, B, O, O, T, O, B, O, O, O],
      [O, O, T, O, O, O, O, T, T, T, O, B, B, O, O, O, O, O, O, O],
      [O, O, O, O, O, O, O, T, T, T, O, B, T, O, T, T, O, O, O, O],
      [O, B, O, O, O, B, O, O, T, T, O, B, O, O, T, T, O, O, O, O],
      [O, O, B, O, O, O, T, O, T, T, O, O, B, T, T, T, O, O, O, O],
      [O, O, B, B, O, O, O, O, T, O, O, O, B, O, T, O, O, O, O, O],
      [O, O, O, B, B, O, O, O, O, O, O, O, O, B, O, T, O, O, O, O],
      [O, O, O, O, B, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O],
      [O, O, O, O, O, O, O, O, O, O, B, B, O, O, T, O, O, O, O, O],
      [O, O, O, O, T, O, O, O, T, B, O, O, O, T, T, O, B, O, O, O],
      [O, O, O, T, O, T, T, T, O, O, O, O, O, T, O, O, O, O, O, O],
      [O, O, O, T, T, T, T, O, O, O, O, T, O, O, O, T, O, O, O, O],
      [O, O, O, O, O, T, O, O, O, O, O, O, O, O, O, O, O, O, O, O]
    ];

    uint32 height = uint32(map.length);
    uint32 width = uint32(map[0].length);

    for (uint32 y = 0; y < height; y++) {
      for (uint32 x = 0; x < width; x++) {
        TerrainType terrainType = map[y][x];
        if (terrainType == TerrainType.None) 
          continue;
        else if(terrainType == TerrainType.Tree)
          spawnTree(x,y);
        else if(terrainType == TerrainType.Mud)
          spawnMud(x,y);
        else if(terrainType == TerrainType.Boulder)
          spawnBoulder(x,y);
        else if(terrainType == TerrainType.Vine)
          spawnVine(x,y);
        else if(terrainType == TerrainType.LootCrate)
          spawnLootCrate(x,y);
        else if(terrainType == TerrainType.BerryBush)
          spawnBerryBush(x,y);
        else if(terrainType == TerrainType.Pond)
          spawnPond(x,y);
        else if(terrainType == TerrainType.WolfDen)
          spawnWolfDen(x,y);
        else if(terrainType == TerrainType.Cave)
          spawnCave(x,y);

        }
      }
    }

    //MapConfig.set(SingletonKey, width, height);
  


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
