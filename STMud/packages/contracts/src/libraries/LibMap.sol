pragma solidity >=0.8.0;


import { Position, PositionId } from "../codegen/tables/Position.sol";
import { getKeysWithValue } from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";

library LibMap {

    function distance(uint32 fromX, uint32 fromY, uint32 toX, uint32 toY) internal pure returns (uint32) {
        uint32 deltaX = fromX > toX ? fromX - toX : toX - fromX;
        uint32 deltaY = fromY > toY ? fromY - toY : toY - fromY;
        return deltaX + deltaY;
    }

    function isObstructed(uint32 x, uint32 y) internal pure returns (bool){

        bytes32[] memory keysWithValue = getKeysWithValue(world, PositionId, Position.encode(x,y));
        for(uint32 i = 0; i < keysWithValue.Length; i++)
        {
            if(IsObstruction.get(keysWithValue[i]))
                return true;
        }
        return false;
    }


    function getMovementCost(uint32 x, uint32 y) internal pure returns (uint32) {
        bytes32[] memory keysWithValue = getKeysWithValue(world, PositionId, Position.encode(x,y));
        for(uint32 i = 0; i < keysWithValue.Length; i++)
        {
            uint32 movementCost = MovementCost.get(keysWithValue[i]);
            if(movementCost > 0)
                return movementCost;
        }
        return 1;
    }

}