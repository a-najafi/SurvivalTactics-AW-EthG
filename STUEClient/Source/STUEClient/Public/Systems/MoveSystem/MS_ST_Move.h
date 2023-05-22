// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "Core\Component\CF_Component.h"
#include "Systems/MS_ST_BytesBasedBase.h"
#include "MS_ST_Move.generated.h"


UCLASS()
class STUECLIENT_API UMS_ST_Move : public UMS_ST_BytesBasedBase
{
	GENERATED_BODY()

public:
	virtual const FString GetFunctionToExecute() override;
};
