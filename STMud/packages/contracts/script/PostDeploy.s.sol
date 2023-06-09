// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { MapConfig} from "../src/codegen/Tables.sol";
import { TerrainType } from "../src/codegen/Types.sol";
import { LibUtils } from "../src/libraries/LibUtils.sol";
import { LibSpawn } from "../src/libraries/LibSpawn.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";

contract PostDeploy is Script {
  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);
    
    TerrainType[][] memory map = setupMapDesign();

    uint32 height = uint32(map.length);
    uint32 width = uint32(map[0].length);

    MapConfig.set(IWorld(worldAddress),LibUtils.getSingletonEntity(),width, height);

    for (uint32 y = 0; y < height; y++) {
      for (uint32 x = 0; x < width; x++) {
        TerrainType terrainType = map[y][x];
        spawnEntityAtPosition(worldAddress,terrainType, x, y);
        }
      }


    vm.stopBroadcast();
  }

  
  function setupMapDesign() internal view returns (TerrainType[][] memory) {
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

    TerrainType[20][20] memory fixedSizeMap = [
      [O, O, O, O, F, O, T, O, O, O, W, O, O, O, O, O, O, O, O, O],
      [O, O, T, O, O, O, O, O, T, O, O, O, O, B, O, O, O, O, O, O],
      [O, T, T, T, T, O, O, O, O, O, O, O, O, O, O, T, T, O, O, O],
      [O, O, T, T, T, T, O, O, F, O, B, O, O, C, O, O, T, O, O, O],
      [O, O, O, O, T, T, O, O, O, O, O, O, O, O, O, O, O, T, O, O],
      [O, O, O, B, B, M, M, M, O, O, O, O, O, O, O, O, O, O, O, O],
      [O, T, O, M, M, B, B, M, O, O, O, T, O, W, O, O, O, B, O, C],
      [O, O, T, T, O, M, M, O, O, T, O, B, O, O, T, O, B, O, O, O],
      [O, O, T, O, O, O, O, T, T, T, O, B, B, O, O, O, O, O, O, O],
      [C, O, O, O, O, O, O, T, T, T, O, B, T, O, T, T, O, O, O, O],
      [O, B, O, O, O, B, O, O, T, T, O, B, O, O, T, T, O, O, O, O],
      [O, O, B, O, W, O, T, O, T, T, O, O, B, T, T, T, O, O, F, O],
      [O, O, B, B, O, O, O, O, T, O, O, O, B, O, T, O, O, F, F, O],
      [O, O, O, B, B, O, O, O, O, O, O, O, O, B, O, T, O, O, O, O],
      [O, O, O, O, B, P, O, O, O, O, O, O, O, O, O, O, O, O, O, O],
      [O, F, O, O, P, P, O, O, O, O, B, B, O, O, T, O, P, P, P, O],
      [O, O, O, O, P, P, O, O, T, B, O, O, O, T, T, O, B, P, O, O],
      [O, O, O, T, O, T, T, T, O, O, O, O, O, T, O, O, P, P, P, O],
      [O, O, O, T, T, T, T, O, O, O, O, T, O, O, O, T, P, P, P, P],
      [O, O, O, O, C, T, O, O, F, O, O, O, O, O, O, O, P, P, P, P]
    ];

    TerrainType[][] memory dynamicSizeMap = new TerrainType[][](20);
    for (uint256 i = 0; i < 20; i++) {
        dynamicSizeMap[i] = new TerrainType[](20);
        for (uint256 j = 0; j < 20; j++) {
            dynamicSizeMap[i][j] = fixedSizeMap[i][j];
        }
    }

    return dynamicSizeMap;
}


  function spawnEntityAtPosition(address worldAddress,TerrainType terrainType, uint32 x, uint32 y) internal {
        
        if(terrainType != TerrainType.None)
          console.log("is spawning not none");
        if(terrainType == TerrainType.Tree)
          LibSpawn.spawnTree(worldAddress,x,y);
        else if(terrainType == TerrainType.Mud)
          LibSpawn.spawnMud(worldAddress,x,y);
        else if(terrainType == TerrainType.Boulder)
          LibSpawn.spawnBoulder(worldAddress,x,y);
        else if(terrainType == TerrainType.Vine)
          LibSpawn.spawnVine(worldAddress,x,y);
        else if(terrainType == TerrainType.LootCrate)
          LibSpawn.spawnLootCrate(worldAddress,x,y);
        else if(terrainType == TerrainType.BerryBush)
          LibSpawn.spawnBerryBush(worldAddress,x,y);
        else if(terrainType == TerrainType.Pond)
          LibSpawn.spawnPond(worldAddress,x,y);
        else if(terrainType == TerrainType.WolfDen)
          LibSpawn.spawnWolfDen(worldAddress,x,y);
        else if(terrainType == TerrainType.Cave)
          LibSpawn.spawnCave(worldAddress,x,y);
  }


}
