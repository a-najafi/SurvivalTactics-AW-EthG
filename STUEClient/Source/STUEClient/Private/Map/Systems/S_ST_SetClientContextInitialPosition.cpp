// Fill out your copyright notice in the Description page of Project Settings.


#include "Map/Systems/S_ST_SetClientContextInitialPosition.h"

#include "Core/Component/Messages/ComponentSet/CF_ComponentSetMessage.h"
#include "Core/StaticFunctionLibrary/CF_Statics.h"
#include "EventSystem/StaticFuntionLibrary/CF_EventStatics.h"
#include "EventSystem/Subsystems/S_CF_Event.h"
#include "Group/StaticFuntionLibrary/CF_GroupsStatics.h"
#include "TableDefinitions/C_ST_MapConfig.h"
#include "TableDefinitions/C_ST_Position.h"
#include "UnrealGameplayFramework/ContextWrapper/Components/ContextWrapperInstance/C_CF_ContextWrapperInstance.h"


void US_ST_SetClientContextInitialPosition::Initialize(FSubsystemCollectionBase& Collection)
{

	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_CF_ContextWrapperInstance>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase ContextWrapperInstanceComponentSet)
	{
		OnContextWrapperOrPositionComponentSet(ContextWrapperInstanceComponentSet);
	});

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_ST_Position>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase PositionComponentSet)
	{
		OnContextWrapperOrPositionComponentSet(PositionComponentSet);
	});
	
	
}


void US_ST_SetClientContextInitialPosition::OnContextWrapperOrPositionComponentSet(
	const FCF_ComponentSetMessageBase ContextWrapperOrPositionComponentSet)
{
	const int32 ContextId = ContextWrapperOrPositionComponentSet.ContextId;
	if(!UCF_Statics::HasComponentForContextId_Template<FC_ST_Position>(this,ContextId) ||
		!UCF_Statics::HasComponentForContextId_Template<FC_CF_ContextWrapperInstance>(this,ContextId))
			return;

	const FC_CF_ContextWrapperInstance ContextWrapperInstance = UCF_Statics::
	GetComponentOfContextId<FC_CF_ContextWrapperInstance>(this,ContextId);
	const FC_ST_Position Position = UCF_Statics::GetComponentOfContextId<FC_ST_Position>(this,ContextId);
	const FVector Location =  FVector(100 * Position.x,100 * Position.y,0);
	ContextWrapperInstance.ContextWrapperInstance->SetActorLocation(Location);

	
}
