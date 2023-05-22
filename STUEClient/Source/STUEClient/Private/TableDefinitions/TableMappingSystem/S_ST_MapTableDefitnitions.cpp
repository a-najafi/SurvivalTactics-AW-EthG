// Fill out your copyright notice in the Description page of Project Settings.


#include "TableDefinitions/TableMappingSystem/S_ST_MapTableDefitnitions.h"

#include "Contract/Tables/C_UEM_TableDefinitions.h"
#include "Core/Subsystems/S_CF_Core.h"
#include "Group/SubSystems/S_CF_Groups.h"
#include "TableDefinitions/C_ST_ActionRecovery.h"
#include "TableDefinitions/C_ST_Berry.h"
#include "TableDefinitions/C_ST_CanAttack.h"
#include "TableDefinitions/C_ST_CanChop.h"
#include "TableDefinitions/C_ST_CanMine.h"
#include "TableDefinitions/C_ST_CanShoot.h"
#include "TableDefinitions/C_ST_CanThrow.h"
#include "TableDefinitions/C_ST_ClientContext.h"
#include "TableDefinitions/C_ST_Cord.h"
#include "TableDefinitions/C_ST_CurrentHP.h"
#include "TableDefinitions/C_ST_EquipedItem.h"
#include "TableDefinitions/C_ST_Fish.h"
#include "TableDefinitions/C_ST_IsAgent.h"
#include "TableDefinitions/C_ST_IsBearSpawner.h"
#include "TableDefinitions/C_ST_IsChopable.h"
#include "TableDefinitions/C_ST_IsEquipment.h"
#include "TableDefinitions/C_ST_IsItem.h"
#include "TableDefinitions/C_ST_IsLootable.h"
#include "TableDefinitions/C_ST_IsMinable.h"
#include "TableDefinitions/C_ST_IsObstruction.h"
#include "TableDefinitions/C_ST_IsPushable.h"
#include "TableDefinitions/C_ST_IsWolfSpawner.h"
#include "TableDefinitions/C_ST_MapConfig.h"
#include "TableDefinitions/C_ST_MaxHP.h"
#include "TableDefinitions/C_ST_MovementCost.h"
#include "TableDefinitions/C_ST_MoveSpeed.h"
#include "TableDefinitions/C_ST_OwnedBy.h"
#include "TableDefinitions/C_ST_Position.h"
#include "TableDefinitions/C_ST_Recovery.h"
#include "TableDefinitions/C_ST_Stone.h"
#include "TableDefinitions/C_ST_Strength.h"
#include "TableDefinitions/C_ST_Weight.h"
#include "TableDefinitions/C_ST_Wood.h"


void US_ST_MapTableDefitnitions::Initialize(FSubsystemCollectionBase& Collection)
{
	Collection.InitializeDependency(US_CF_Core::StaticClass());
	Collection.InitializeDependency(US_CF_Groups::StaticClass());
	Collection.InitializeDependency(US_CF_Event::StaticClass());
	Super::Initialize(Collection);


	FC_UEM_TableDefinitions TableDefinitionsComponent =FC_UEM_TableDefinitions();




	TableDefinitionsComponent.TableDefinitions.Add("__Position", FC_ST_Position::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__ActionRecovery", FC_ST_ActionRecovery::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Berry", FC_ST_Berry::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__CanAttack", FC_ST_CanAttack::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__CanChop", FC_ST_CanChop::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__CanMine", FC_ST_CanMine::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__CanShoot", FC_ST_CanShoot::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("_CanThrow", FC_ST_CanThrow::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__ClientContext", FC_ST_ClientContext::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Cord", FC_ST_Cord::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__CurrentHP", FC_ST_CurrentHP::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__EquipedItem", FC_ST_EquipedItem::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Fish", FC_ST_Fish::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsAgent", FC_ST_IsAgent::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsBearSpawner", FC_ST_IsBearSpawner::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsChopable", FC_ST_IsChopable::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsEquipment", FC_ST_IsEquipment::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsItem", FC_ST_IsItem::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsLootable", FC_ST_IsLootable::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsMinable", FC_ST_IsMinable::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsObstruction", FC_ST_IsObstruction::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsPushable", FC_ST_IsPushable::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__IsWolfSpawner", FC_ST_IsWolfSpawner::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__MapConfig", FC_ST_MapConfig::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__MaxHP", FC_ST_MaxHP::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__MovementCost", FC_ST_MovementCost::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__MoveSpeed", FC_ST_MoveSpeed::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__OwnedBy", FC_ST_OwnedBy::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Recovery", FC_ST_Recovery::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Stone", FC_ST_Stone::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Strength", FC_ST_Strength::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Weight", FC_ST_Weight::StaticStruct());
	TableDefinitionsComponent.TableDefinitions.Add("__Wood", FC_ST_Wood::StaticStruct());
	
	
	
	
	
	const FCF_Context TableDefinitionsContext = UCF_Statics::CreateNewContext(this);
	UCF_Statics::SetComponentOfContextId<FC_UEM_TableDefinitions>(this,TableDefinitionsContext.ContextId,TableDefinitionsComponent);
	
}
