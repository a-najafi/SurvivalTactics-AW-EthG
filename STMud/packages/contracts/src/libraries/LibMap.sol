pragma solidity >=0.8.0;


import { IsObstruction, MovementCost } from "../codegen/Tables.sol";
import { Position, PositionTableId } from "../codegen/tables/Position.sol";
import { IWorld } from "../codegen/world/IWorld.sol";
import { getKeysWithValue } from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";

library LibMap {

    function distance(uint32 fromX, uint32 fromY, uint32 toX, uint32 toY) internal pure returns (uint32) {
        uint32 deltaX = fromX > toX ? fromX - toX : toX - fromX;
        uint32 deltaY = fromY > toY ? fromY - toY : toY - fromY;
        return deltaX + deltaY;
    }

    function isObstructed(address worldAddress,uint32 x, uint32 y) internal view returns (bool){

        IWorld world = IWorld(worldAddress);
        bytes32[] memory keysWithValue = getKeysWithValue(world, PositionTableId, Position.encode(x,y));
        for(uint32 i = 0; i < keysWithValue.length; i++)
        {
            if(IsObstruction.get(world,keysWithValue[i]))
                return true;
        }
        return false;
    }


    function getMovementCost(address worldAddress,uint32 x, uint32 y) internal view returns (uint32) {
        IWorld world = IWorld(worldAddress);
        bytes32[] memory keysWithValue = getKeysWithValue(world, PositionTableId, Position.encode(x,y));
        for(uint32 i = 0; i < keysWithValue.length; i++)
        {
            uint32 movementCost = MovementCost.get(world,keysWithValue[i]);
            if(movementCost > 0)
                return movementCost;
        }
        return 1;
    }

}