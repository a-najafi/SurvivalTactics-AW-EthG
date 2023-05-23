// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "S_ST_ShowJoinGameUI.generated.h"


UCLASS()
class STUECLIENT_API US_ST_ShowJoinGameUI : public UGameInstanceSubsystem
{
	GENERATED_BODY()

	virtual void Initialize(FSubsystemCollectionBase& Collection) override;

	UFUNCTION()
	void OnLevelLoadedIndicatorComponentSet(const FCF_ComponentSetMessageBase LevelLoadedIndicator);
	
};
