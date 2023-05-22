// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "S_ST_SpawnVisualsOnClientContext.generated.h"

/**
 * 
 */
UCLASS()
class STUECLIENT_API US_ST_SpawnVisualsOnClientContext : public UGameInstanceSubsystem
{
	GENERATED_BODY()

	virtual void Initialize(FSubsystemCollectionBase& Collection) override;

	UFUNCTION()
	void OnClientContextComponentSet(const FCF_ComponentSetMessageBase ComponentSet);
};
