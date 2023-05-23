// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UnrealGameplayFramework/ContextWrapper/BaseClasses/Actor/CF_WrapperActor.h"
#include "UObject/Object.h"
#include "DS_ST_Map.generated.h"

/**
 * 
 */
UCLASS(Config=Game, defaultconfig, meta = (DisplayName="Map Settings")) // Give it a better looking name in UI
class STUECLIENT_API UDS_ST_Map : public UDeveloperSettings
{
	GENERATED_BODY()
public:
	UPROPERTY(Config,EditDefaultsOnly,BlueprintReadOnly)
	TSoftClassPtr<AActor> Tile;

	UPROPERTY(Config,EditDefaultsOnly,BlueprintReadOnly)
	TMap<FString,TSoftClassPtr<ACF_WrapperActor>> ClientContextWrappers;
	
};
