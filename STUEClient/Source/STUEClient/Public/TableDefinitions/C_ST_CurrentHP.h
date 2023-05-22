// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "Core\Component\CF_Component.h"
#include "C_ST_CurrentHP.generated.h"

USTRUCT()
struct STUECLIENT_API FC_ST_CurrentHP : public FCF_Component
{
	GENERATED_BODY()
	UPROPERTY(BlueprintReadOnly,EditAnywhere)
	int32 value;
};
