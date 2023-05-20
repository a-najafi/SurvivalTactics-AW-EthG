import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    //Agent
	  IsAgent: {
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
    OwnedBy: {
      keySchema: {
        entity: "bytes32",
      },
      schema: "bytes32",
    },
    Position: {
      keySchema: {
        entity: "bytes32",
      },
      schema: {
        x: "uint32",
        y: "uint32",
      },
    }
    
  },
});
