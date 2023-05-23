// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "S_ST_LoadMapSettings.generated.h"

/**
 * 
 */


UCLASS()
class STUECLIENT_API US_ST_LoadMapSettings : public UGameInstanceSubsystem
{
	GENERATED_BODY()
public:
	

	virtual void Initialize(FSubsystemCollectionBase& Collection) override;
};
