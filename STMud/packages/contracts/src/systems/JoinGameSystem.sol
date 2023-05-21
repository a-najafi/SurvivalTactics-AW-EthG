// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { IsAgent, IsObstruction, Position } from "../codegen/Tables.sol";
import { LibMap } from "../libraries/LibMap.sol";

contract JoinGameSystem is System {
  
  function join(uint32 x, uint32 y) public {
    
    bytes32 entity = addressToEntityKey(address(_msgSender()));
    require(!IsAgent.get(entity), "already joined");
    require(!LibMap.isObstructed(x,y),"this space is obstructed" );
    
    
    IsAgent.set(entity, true);
    Position.set(entity, x, y);
    IsObstruction.set(entity, x, y);

  
  }

    

}
