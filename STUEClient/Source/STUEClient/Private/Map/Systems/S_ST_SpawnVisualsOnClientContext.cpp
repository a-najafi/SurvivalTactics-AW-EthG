// Fill out your copyright notice in the Description page of Project Settings.


#include "Map/Systems/S_ST_SpawnVisualsOnClientContext.h"

#include "Core/Component/Messages/ComponentSet/CF_ComponentSetMessage.h"
#include "Core/StaticFunctionLibrary/CF_Statics.h"
#include "EventSystem/StaticFuntionLibrary/CF_EventStatics.h"
#include "EventSystem/Subsystems/S_CF_Event.h"
#include "TableDefinitions/C_ST_ClientContext.h"


void US_ST_SpawnVisualsOnClientContext::Initialize(FSubsystemCollectionBase& Collection)
{

	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_ST_ClientContext>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase MapConfigComponentSet)
	{
		OnClientContextComponentSet(MapConfigComponentSet);
	});
	
}


void US_ST_SpawnVisualsOnClientContext::OnClientContextComponentSet(
	const FCF_ComponentSetMessageBase MapConfigComponentSet)
{
	FC_ST_ClientContext ClientContext = UCF_Statics::GetComponentOfContextId<FC_ST_ClientContext>(this,MapConfigComponentSet.ContextId);
	UE_LOG(LogTemp, Log, TEXT("Client Context Added: %s" ),*ClientContext.value);
	
}
