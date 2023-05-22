// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Contract/Systems/MS_UEM_Base.h"
#include "TableDefinitions/C_ST_Bytes.h"
#include "UObject/Object.h"
#include "MS_ST_BytesBasedBase.generated.h"

/**
 * 
 */
UCLASS()
class STUECLIENT_API UMS_ST_BytesBasedBase : public UMS_UEM_Base
{
	GENERATED_BODY()

	
public:
	virtual bool ShouldCreateSubsystem(UObject* Outer) const override;

	
	UFUNCTION(BlueprintCallable)
	void Execute(FC_ST_Bytes Bytes);

	virtual const TArray<FString> GetStringArguments(FInstancedStruct SystemArgumentsStruct) override;

	virtual const FString GetEncodedArguments(FInstancedStruct SystemArgumentsStruct) override;
};
