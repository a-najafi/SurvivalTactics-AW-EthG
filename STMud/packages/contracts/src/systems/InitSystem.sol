// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Position, Counter, Wood, Stone, String } from "../codegen/Tables.sol";
import { Position } from "../codegen/Tables.sol";
import { IsChoppable } from "../codegen/Tables.sol";
import { ClientContext } from "../codegen/Tables.sol";
import { TerrainType } from "../src/codegen/Types.sol";
import { LibUtils } from "../src/libraries/LibUtils.sol";

contract InitSystem is System {
  function init() public {

    TerrainType O = TerrainType.None;
    TerrainType T = TerrainType.Tree;
    TerrainType V = TerrainType.Mud;
    TerrainType B = TerrainType.Boulder;
    TerrainType V = TerrainType.Vine;
    TerrainType L = TerrainType.LootCrate;
    TerrainType B = TerrainType.BerryBush;
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
        if (terrainType == TerrainType.None) continue;

        terrain[(y * width) + x] = bytes1(uint8(terrainType));

        bytes32 entity = positionToEntityKey(x, y);
        if (terrainType == TerrainType.Boulder) {
          Position.set(world, entity, x, y);
          Obstruction.set(world, entity, true);
        } else if (terrainType == TerrainType.TallGrass) {
          Position.set(world, entity, x, y);
          EncounterTrigger.set(world, entity, true);
        }
      }
    }

    MapConfig.set(world, width, height);
  }


  function spawnTree(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsChoppable.set(entity,true);
    Wood.set(entity,1000);
    IsObstruction.set(entity,true);
    ClientContext.set(entity,"Tree");
    MaxHp.set(entity,50);
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
    MaxHp.set(entity,100);
    return entity;
  }

  function spawnVine(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsChoppable.set(entity,true);
    String.set(entity,1000);
    MovementCost.set(entity,2);
    ClientContext.set(entity,"Vine");
    MaxHp.set(entity,10);
    return entity;
  }
  function spawnBerryBush(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsChoppable.set(entity,true);
    Berry.set(entity,1000);
    MovementCost.set(entity,2);
    ClientContext.set(entity,"BerryBush");
    MaxHp.set(entity,10);
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
    MaxHp.set(entity,50);
    return entity;
  }
  function spawnCave(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsObstruction.set(entity,true);
    IsBearSpawner.set(entity,true);
    ClientContext.set(entity,"Cave");
    MaxHp.set(entity,300);
    return entity;
  }
  function spawnCave(uint32 x, uint32 y) public returns (bytes32) {
    bytes32 entity = LibUtils.getRandomKey();
    Position.set(entity, x, y);
    IsObstruction.set(entity,true);
    IsWolfSpawner.set(entity,true);
    ClientContext.set(entity,"WolfDen");
    MaxHp.set(entity,200);
    return entity;
  }



}
