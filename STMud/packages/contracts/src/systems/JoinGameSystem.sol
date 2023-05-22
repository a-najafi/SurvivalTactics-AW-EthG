// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { IsAgent, IsObstruction, Position, ActionRecovery } from "../codegen/Tables.sol";
import { LibMap } from "../libraries/LibMap.sol";
import { LibUtils } from "../libraries/LibUtils.sol";

contract JoinGameSystem is System {
  
  function join(uint32 x, uint32 y) public {
    
    bytes32 entity = LibUtils.addressToEntityKey(address(_msgSender()));
    require(!IsAgent.get(entity), "already joined");
    require(!LibMap.isObstructed(_world(),x,y),"this space is obstructed" );
    
    
    IsAgent.set(entity, true);
    Position.set(entity, x, y);
    IsObstruction.set(entity, true);
  
  }

    

}
