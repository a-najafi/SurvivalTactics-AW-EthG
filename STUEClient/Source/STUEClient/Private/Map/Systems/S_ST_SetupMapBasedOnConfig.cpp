// Fill out your copyright notice in the Description page of Project Settings.


#include "Map/Systems/S_ST_SetupMapBasedOnConfig.h"

#include "Core/Component/Messages/ComponentSet/CF_ComponentSetMessage.h"
#include "EventSystem/StaticFuntionLibrary/CF_EventStatics.h"
#include "EventSystem/Subsystems/S_CF_Event.h"
#include "Group/StaticFuntionLibrary/CF_GroupsStatics.h"
#include "Map/Components/C_ST_MapSettings.h"
#include "Map/Settings/DS_ST_Map.h"
#include "TableDefinitions/C_ST_MapConfig.h"


void US_ST_SetupMapBasedOnConfig::Initialize(FSubsystemCollectionBase& Collection)
{

	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_ST_MapConfig>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase MapConfigComponentSet)
	{
		OnMapConfigComponentSet(MapConfigComponentSet);
	});
	
}


void US_ST_SetupMapBasedOnConfig::OnMapConfigComponentSet(
	const FCF_ComponentSetMessageBase MapConfigComponentSet)
{
	const FC_ST_MapConfig MapConfig = UCF_GroupsStatics::GetSingletonComponent<FC_ST_MapConfig>(this);
	const FC_ST_MapSettings MapSettings = UCF_GroupsStatics::GetSingletonComponent<FC_ST_MapSettings>(this);
	const TSubclassOf<AActor> TileClass = MapSettings.Tile;

	for (int i = 0; i < MapConfig.width * MapConfig.height ; ++i)
	{
		AActor* Tile = GetWorld()->SpawnActor(TileClass);
		FVector WorldLocation = FVector::Zero();
		int32 x = i % MapConfig.width;
		int32 y = i / MapConfig.width;
		WorldLocation = WorldLocation + FVector(100 * x,100 * y,0);
		Tile->SetActorLocation(WorldLocation);
	}
}
