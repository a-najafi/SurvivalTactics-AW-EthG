// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "S_ST_SetupMapBasedOnConfig.generated.h"

/**
 * 
 */
UCLASS()
class STUECLIENT_API US_ST_SetupMapBasedOnConfig : public UGameInstanceSubsystem
{
	GENERATED_BODY()

	virtual void Initialize(FSubsystemCollectionBase& Collection) override;

	UFUNCTION()
	void OnMapConfigComponentSet(const FCF_ComponentSetMessageBase ECSStreamGrpcContextComponentSet);
};
