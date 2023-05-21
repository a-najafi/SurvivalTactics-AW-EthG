// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { MapConfig} from "../codegen/Tables.sol";

import { TerrainType } from "../codegen/Types.sol";
import { LibUtils } from "../libraries/LibUtils.sol";
import { LibSpawn } from "../libraries/LibSpawn.sol";


bytes32 constant SingletonKey = bytes32(uint256(0x060D));

contract PostDeploy is Script {
  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);

    // ------------------ EXAMPLES ------------------

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

    MapConfig.set(SingletonKey, width, height);
    for (uint32 y = 0; y < height; y++) {
      for (uint32 x = 0; x < width; x++) {
        TerrainType terrainType = map[y][x];
        if (terrainType == TerrainType.None) 
          continue;
        else if(terrainType == TerrainType.Tree)
          LibSpawn.spawnTree(x,y);
        else if(terrainType == TerrainType.Mud)
          LibSpawn.spawnMud(x,y);
        else if(terrainType == TerrainType.Boulder)
          LibSpawn.spawnBoulder(x,y);
        else if(terrainType == TerrainType.Vine)
          LibSpawn.spawnVine(x,y);
        else if(terrainType == TerrainType.LootCrate)
          LibSpawn.spawnLootCrate(x,y);
        else if(terrainType == TerrainType.BerryBush)
          LibSpawn.spawnBerryBush(x,y);
        else if(terrainType == TerrainType.Pond)
          LibSpawn.spawnPond(x,y);
        else if(terrainType == TerrainType.WolfDen)
          LibSpawn.spawnWolfDen(x,y);
        else if(terrainType == TerrainType.Cave)
          LibSpawnspawnCave(x,y);

        }
      }


    vm.stopBroadcast();
  }
}
