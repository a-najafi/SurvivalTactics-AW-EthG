// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "Core\Component\CF_Component.h"
#include "UnrealGameplayFramework/ContextWrapper/BaseClasses/Actor/CF_WrapperActor.h"
#include "C_ST_MapSettings.generated.h"

USTRUCT()
struct STUECLIENT_API FC_ST_MapSettings : public FCF_Component
{
	FC_ST_MapSettings() = default;

	FC_ST_MapSettings(const TSubclassOf<AActor>& Tile,
	                  const TMap<FString, TSubclassOf<ACF_WrapperActor>>& ClientContextWrappers)
		: Tile(Tile),
		  ClientContextWrappers(ClientContextWrappers)
	{
	}

	GENERATED_BODY()

	UPROPERTY(Config,EditDefaultsOnly,BlueprintReadOnly)
	TSubclassOf<AActor> Tile;

	UPROPERTY(Config,EditDefaultsOnly,BlueprintReadOnly)
	TMap<FString,TSubclassOf<ACF_WrapperActor>> ClientContextWrappers;
};
