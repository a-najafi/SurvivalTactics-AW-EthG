// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

import { IBaseWorld } from "@latticexyz/world/src/interfaces/IBaseWorld.sol";

import { IJoinGameSystem } from "./IJoinGameSystem.sol";
import { IMoveSystem } from "./IMoveSystem.sol";
import { IPushSystem } from "./IPushSystem.sol";

/**
 * The IWorld interface includes all systems dynamically added to the World
 * during the deploy process.
 */
interface IWorld is IBaseWorld, IJoinGameSystem, IMoveSystem, IPushSystem {

}
