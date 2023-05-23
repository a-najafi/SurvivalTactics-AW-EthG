// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "DS_ST_JoinGame.generated.h"

/**
 * 
 */



UCLASS(Config=Game, defaultconfig, meta = (DisplayName="Join Game Settings")) // Give it a better looking name in UI
class STUECLIENT_API UDS_ST_JoinGame : public UDeveloperSettings
{
	
	GENERATED_BODY()
public:
	UPROPERTY(Config,EditDefaultsOnly,BlueprintReadOnly)
	TSoftClassPtr<UUserWidget> JoinGameUI;
	
	
};
