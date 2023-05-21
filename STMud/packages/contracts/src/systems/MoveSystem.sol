// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { IsAgent, MoveSpeed, Position, MapConfig } from "../codegen/Tables.sol";
import { LibMap } from "../libraries/LibMap.sol";
import { LibUtils } from "../libraries/LibUtils.sol";

contract MoveSystem is System {
  
  function move(bytes memory path) public {
    
    bytes32 entity = LibUtils.addressToEntityKey(address(_msgSender()));
    require(IsAgent.get(entity), "not joined yet");

    uint32 width = MapConfig.getWidth();
    uint32 height = MapConfig.getHeight();

    (uint32 fromX, uint32 fromY) = Position.get(entity);
    uint32 moveSpeed = MoveSpeed.get(entity);

    for(uint32 i = 0; i < path.Length; i++)
    {
        uint32 toX = uint32(path[i]) % width;
        uint32 toY = uint32(path[i]) / width;
        
        uint32 movementCost = LibMap.getMovementCost(_world(),toX,toY);
        require(movementCost < moveSpeed, "movement cost is higher then leftover move speed");
        require(LibMap.distance(fromX, fromY, toX, toY) == 1, "can only move to adjacent spaces");
        require(!LibMap.isObstructed(_world(),toX, toY), "can not pass through obstruction");

        Position.set(entity,toX,toY);

        fromX = toX;
        fromY = toY;
        moveSpeed -= movementCost;

    }
  
  }

    

}
