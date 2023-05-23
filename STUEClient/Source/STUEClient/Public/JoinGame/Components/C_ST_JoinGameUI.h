// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Object.h"
#include "Core\Component\CF_Component.h"
#include "C_ST_JoinGameUI.generated.h"

USTRUCT()
struct STUECLIENT_API FC_ST_JoinGameUI : public FCF_Component
{
	
	GENERATED_BODY()
	
	FC_ST_JoinGameUI() = default;

	explicit FC_ST_JoinGameUI(UUserWidget* const JoinGameUI)
		: JoinGameUI(JoinGameUI)
	{
	}


	UPROPERTY(BlueprintReadOnly,EditAnywhere)
	UUserWidget* JoinGameUI = nullptr;

	
};
