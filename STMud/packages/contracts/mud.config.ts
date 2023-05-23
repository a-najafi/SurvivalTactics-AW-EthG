import { mudConfig } from "@latticexyz/world/register";
import { resolveTableId } from "@latticexyz/config";

export default mudConfig({
   enums: {
    TerrainType: ["None", "Boulder", "Mud","Tree", "HalfPlatform", "FullPlatform", "LootCrate", "Vine", "WolfDen", "Cave", "BerryBush","Pond"],
  },
  tables: {
    //Agent
	  IsAgent: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsNPC: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    
    //Movement
    MovementCost: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Altitude: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    IsObstruction: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    //Stats
    MaxHP: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    MoveSpeed: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Strength: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Recovery: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Weight: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    //State
	  ActionRecovery: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    CurrentHP: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    //Crafting
    Stone: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Wood: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Cord: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Berry: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    Fish: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "uint32",
    },
    //Interaction
    IsPushable: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsMinable: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsChopable: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsFishable: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsLootable: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    //Damage

    //Item
    IsItem: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsEquipment: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    CanAttack: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {damage: "uint32"},
    },
    CanShoot: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {
        range:"uint32",
        damage: "uint32"
      },
      dataStruct: false,
    },
    CanThrow: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {
        damage: "uint32"
      },
    },
    CanChop: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {damage: "uint32"},
    },
    CanMine: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {damage: "uint32"},
    },
    CanFish: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {damage: "uint32"},
    },

    EquipedItem: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bytes32",
    },
    OwnedBy: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bytes32",
    },
    MapConfig: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {
        width: "uint32",
        height: "uint32",
      },
      dataStruct: false,
    },
    Position: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {
        x: "uint32",
        y: "uint32",
      },
      dataStruct: false,
    },

    //Visual
    ClientContext: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {
        context: "string",
      }
    },
    //Spawner
    IsBearSpawner: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },
    IsWolfSpawner: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bool",
    },


    
  },
  modules: [
    {
      name: "KeysWithValueModule",
      root: true,
      args: [resolveTableId("Position")],
    },
  ],
});
