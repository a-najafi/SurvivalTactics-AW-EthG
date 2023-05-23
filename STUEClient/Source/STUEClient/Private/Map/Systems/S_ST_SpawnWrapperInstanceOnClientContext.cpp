// Fill out your copyright notice in the Description page of Project Settings.


#include "Map/Systems/S_ST_SpawnWrapperInstanceOnClientContext.h"

#include "Core/Component/Messages/ComponentSet/CF_ComponentSetMessage.h"
#include "Core/StaticFunctionLibrary/CF_Statics.h"
#include "EventSystem/StaticFuntionLibrary/CF_EventStatics.h"
#include "EventSystem/Subsystems/S_CF_Event.h"
#include "Group/StaticFuntionLibrary/CF_GroupsStatics.h"
#include "Map/Components/C_ST_MapSettings.h"
#include "Map/Settings/DS_ST_Map.h"
#include "TableDefinitions/C_ST_ClientContext.h"
#include "TableDefinitions/C_ST_Position.h"
#include "UnrealGameplayFramework/ContextWrapper/Components/ContextWrapperType/C_CF_ContextWrapperType.h"


void US_ST_SpawnWrapperInstanceOnClientContext::Initialize(FSubsystemCollectionBase& Collection)
{

	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_ST_ClientContext>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase MapConfigComponentSet)
	{
		OnClientContextComponentSet(MapConfigComponentSet);
	});

	
	
}


void US_ST_SpawnWrapperInstanceOnClientContext::OnClientContextComponentSet(
	const FCF_ComponentSetMessageBase MapConfigComponentSet)
{
	const FC_ST_ClientContext ClientContext = UCF_Statics::GetComponentOfContextId<FC_ST_ClientContext>(this,MapConfigComponentSet.ContextId);
	//const FC_ST_Position Position = UCF_Statics::GetComponentOfContextId<FC_ST_Position>(this,MapConfigComponentSet.ContextId);
	//const FC_ST_MapSettings MapSettings = UCF_GroupsStatics::GetSingletonComponent<FC_ST_MapSettings>(this);
	const UDS_ST_Map* MapSettings = GetDefault<UDS_ST_Map>();
	if(!MapSettings->ClientContextWrappers.Contains(ClientContext.context))
		return;;

	const FC_CF_ContextWrapperType ContextWrapperType = FC_CF_ContextWrapperType(MapSettings->ClientContextWrappers[ClientContext.context]);
	UCF_Statics::SetComponentOfContextId<FC_CF_ContextWrapperType>(this,MapConfigComponentSet.ContextId,ContextWrapperType);
	UE_LOG(LogTemp, Log, TEXT("Client Context Added: %s" ),*ClientContext.context);
	
}
