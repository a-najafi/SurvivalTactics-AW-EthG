// Fill out your copyright notice in the Description page of Project Settings.


#include "Systems/MS_ST_PositionBasedBase.h"
#include "Core/Subsystems/S_CF_Core.h"
#include "Encoding/FL_UEM_Encode.h"
#include "Group/StaticFuntionLibrary/CF_GroupsStatics.h"
#include "TableDefinitions/C_ST_Position.h"
#include "WorldSettings/Components/C_UEM_WorldSettings.h"


bool UMS_ST_PositionBasedBase::ShouldCreateSubsystem(UObject* Outer) const
{
	return true;
}


const TArray<FString> UMS_ST_PositionBasedBase::GetStringArguments(FInstancedStruct SystemArgumentsStruct)
{
	TArray<FString> Arguments =TArray<FString>();
	Arguments.SetNum(2);
	const FC_ST_Position Position = SystemArgumentsStruct.Get<FC_ST_Position>();
	Arguments[0] = UFL_UEM_Encode::EncodeNumber(Position.x);
	Arguments[1] = UFL_UEM_Encode::EncodeNumber(Position.y);
	
	return Arguments;
}

const FString UMS_ST_PositionBasedBase::GetEncodedArguments(FInstancedStruct SystemArgumentsStruct)
{
	const FC_ST_Position Position = SystemArgumentsStruct.Get<FC_ST_Position>();
	return UFL_UEM_Encode::EncodeNumber(Position.x) + UFL_UEM_Encode::EncodeNumber(Position.y, false);
}


void UMS_ST_PositionBasedBase::Execute(FC_ST_Position Position)
{

	FC_UEM_WorldSettings WorldSettings = UCF_GroupsStatics::GetSingletonComponent<FC_UEM_WorldSettings>(this);
	
	FInstancedStruct JoinGameInstancedStruct;
	JoinGameInstancedStruct.InitializeAs<FC_ST_Position>(Position);
	
	const FString EncodedArguments = GetEncodedArguments(JoinGameInstancedStruct);
	const TArray<FString> Arguments = GetStringArguments(JoinGameInstancedStruct);
	ExecuteSystemCall(WorldSettings.WorldContractAddress,WorldSettings.WorldContractAbi,GetFunctionToExecute(),Arguments,EncodedArguments);
	
}
