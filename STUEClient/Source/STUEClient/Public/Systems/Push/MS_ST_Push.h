﻿// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Systems/MS_ST_BytesBasedBase.h"
#include "Systems/MS_ST_PositionBasedBase.h"
#include "UObject/Object.h"
#include "MS_ST_Push.generated.h"

/**
 * 
 */


UCLASS()
class STUECLIENT_API UMS_ST_Push : public UMS_ST_PositionBasedBase
{
	GENERATED_BODY()

public:
	virtual const FString GetFunctionToExecute() override;
};

