// Fill out your copyright notice in the Description page of Project Settings.


#include "Map/Systems/S_ST_LoadMapSettings.h"

#include "Core/Subsystems/S_CF_Core.h"
#include "Group/SubSystems/S_CF_Groups.h"
#include "Map/Components/C_ST_MapSettings.h"
#include "Map/Settings/DS_ST_Map.h"


void US_ST_LoadMapSettings::Initialize(FSubsystemCollectionBase& Collection)
{
	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Core::StaticClass());
	Collection.InitializeDependency(US_CF_Groups::StaticClass());
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	const UDS_ST_Map* MapSettings = GetDefault<UDS_ST_Map>();
	TSubclassOf<AActor> Tile = MapSettings->Tile.LoadSynchronous();
	TMap<FString,TSubclassOf<ACF_WrapperActor>> ClientContextWrappers = TMap<FString,TSubclassOf<ACF_WrapperActor>>();
	for (auto ClientContextWrapper : MapSettings->ClientContextWrappers)
	{
		ClientContextWrappers.Add(ClientContextWrapper.Key,ClientContextWrapper.Value.LoadSynchronous());
	}

	const FCF_Context WorldSettingsContext = UCF_Statics::CreateNewContext(this);
	const FC_ST_MapSettings MapSettingsComponent = FC_ST_MapSettings(Tile,ClientContextWrappers);
	UCF_Statics::SetComponentOfContextId<FC_ST_MapSettings>(this,WorldSettingsContext.ContextId,MapSettingsComponent);
}
