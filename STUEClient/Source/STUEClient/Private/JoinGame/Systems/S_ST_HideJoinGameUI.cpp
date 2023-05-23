// Fill out your copyright notice in the Description page of Project Settings.


#include "JoinGame/Systems/S_ST_HideJoinGameUI.h"

#include "Blueprint/UserWidget.h"
#include "Core/Component/Messages/ComponentSet/CF_ComponentSetMessage.h"
#include "Core/StaticFunctionLibrary/CF_Statics.h"
#include "EventSystem/StaticFuntionLibrary/CF_EventStatics.h"
#include "EventSystem/Subsystems/S_CF_Event.h"
#include "Group/StaticFuntionLibrary/CF_GroupsStatics.h"
#include "JoinGame/Components/C_ST_JoinGameUI.h"
#include "Sync/FL_ST_Sync.h"
#include "TableDefinitions/C_ST_IsAgent.h"
#include "Wallet/Components/Wallet/C_UEM_WalletAddress.h"


struct FC_UEM_WalletAddress;

void US_ST_HideJoinGameUI::Initialize(FSubsystemCollectionBase& Collection)
{

	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_ST_IsAgent>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase IsAgentComponentSet)
	{
		OnIsAgentComponentSet(IsAgentComponentSet);
	});

	
	
}


void US_ST_HideJoinGameUI::OnIsAgentComponentSet(
	const FCF_ComponentSetMessageBase IsAgentComponentSet)
{
	FString walletAddress = UCF_GroupsStatics::GetSingletonComponent<FC_UEM_WalletAddress>(this).EthWalletAddress;
	walletAddress = walletAddress.Mid(2);
	const FString entityId = FString::Printf(TEXT("\"0x%064s\""),*walletAddress);
	const FString debugEntityId = entityId;
	if(!UFL_ST_Sync::GetEntityIdForContextId(this,IsAgentComponentSet.ContextId).Equals(debugEntityId))
		return;

	const FC_ST_JoinGameUI JoinGameUIComponent = UCF_GroupsStatics::GetSingletonComponent<FC_ST_JoinGameUI>(this);
	JoinGameUIComponent.JoinGameUI->RemoveFromParent();
	UCF_GroupsStatics::RemoveSingletonComponent<FC_ST_JoinGameUI>(this);
	
	
}
