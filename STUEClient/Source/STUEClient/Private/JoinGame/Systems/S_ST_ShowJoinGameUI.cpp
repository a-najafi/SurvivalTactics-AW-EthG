// Fill out your copyright notice in the Description page of Project Settings.


#include "JoinGame/Systems/S_ST_ShowJoinGameUI.h"

#include "Blueprint/UserWidget.h"
#include "Core/StaticFunctionLibrary/CF_Statics.h"
#include "JoinGame/Components/C_ST_JoinGameUI.h"
#include "JoinGame/Settings/DS_ST_JoinGame.h"
#include "Level/Components/C_ST_LevelLoadedIndicator.h"

void US_ST_ShowJoinGameUI::Initialize(FSubsystemCollectionBase& Collection)
{
	Super::Initialize(Collection);


	Super::Initialize(Collection);
	Collection.InitializeDependency(US_CF_Event::StaticClass());

	

	UCF_EventStatics::AddLambdaListener<FCF_ComponentSetMessageBase,FC_ST_LevelLoadedIndicator>(this,
		[this](const UObject* Invoker,const FCF_ComponentSetMessageBase LevelLoadedIndicator)
	{
		OnLevelLoadedIndicatorComponentSet(LevelLoadedIndicator);
	});
}

void US_ST_ShowJoinGameUI::OnLevelLoadedIndicatorComponentSet(const FCF_ComponentSetMessageBase LevelLoadedIndicator)
{
	const TSubclassOf<UUserWidget> JoinGameUIClass = GetDefault<UDS_ST_JoinGame>()->JoinGameUI.LoadSynchronous();
	APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
	UUserWidget* JoinGameUI = CreateWidget(PlayerController,JoinGameUIClass);
	JoinGameUI->AddToViewport();

	auto Context = UCF_Statics::CreateNewContext(this);
	UCF_Statics::SetComponentOfContextId(this,Context.ContextId,FC_ST_JoinGameUI(JoinGameUI));
}
