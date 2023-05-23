// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { IsAgent, MoveSpeed, Position, MapConfig ,ActionRecovery} from "../codegen/Tables.sol";
import { LibMap } from "../libraries/LibMap.sol";
import { LibUtils } from "../libraries/LibUtils.sol";

contract PushSystem is System {
  
  function push(uint32 x, uint32 y) public {
    
    bytes32 entity = LibUtils.addressToEntityKey(address(_msgSender()));
    
    require(ActionRecovery.get(entity) < block.number,"Still in recovery");
    require(IsAgent.get(entity), "not joined yet");

    (uint32 fromX, uint32 fromY) = Position.get(entity);
    require(LibMap.distance(fromX, fromY, x, y) == 1, "can only push adjacent spaces");
    require(LibMap.isPushableExists(_world(), x, y), "a pushable entity must exist");

    bytes32 pushEntity = LibMap.getIsPushable(_world(), x, y);
    uint32 dirX = x - fromX;
    uint32 dirY = y - fromY;
    Position.set(entity,x,y);
    Position.set(pushEntity,x + dirX,y + dirY);
    ActionRecovery.set(entity, uint32(block.number) + 30);



    

    }
}
