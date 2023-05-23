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


    uint32 width = MapConfig.getWidth(LibUtils.getSingletonEntity());

    (uint32 fromX, uint32 fromY) = Position.get(entity);




    uint32 moveSpeed = MoveSpeed.get(entity);



    

    }
}
