// Fill out your copyright notice in the Description page of Project Settings.


#include "Systems/MS_ST_BytesBasedBase.h"

#include "Encoding/FL_UEM_Encode.h"
#include "Group/StaticFuntionLibrary/CF_GroupsStatics.h"
#include "WorldSettings/Components/C_UEM_WorldSettings.h"

bool UMS_ST_BytesBasedBase::ShouldCreateSubsystem(UObject* Outer) const
{
	return true;
}

void UMS_ST_BytesBasedBase::Execute(FC_ST_Bytes Bytes)
{

	
	FC_UEM_WorldSettings WorldSettings = UCF_GroupsStatics::GetSingletonComponent<FC_UEM_WorldSettings>(this);
	
	FInstancedStruct JoinGameInstancedStruct;
	JoinGameInstancedStruct.InitializeAs<FC_ST_Bytes>(Bytes);
	
	const FString EncodedArguments = GetEncodedArguments(JoinGameInstancedStruct);
	const TArray<FString> Arguments = GetStringArguments(JoinGameInstancedStruct);
	ExecuteSystemCall(WorldSettings.WorldContractAddress,WorldSettings.WorldContractAbi,GetFunctionToExecute(),Arguments,EncodedArguments);
	
}


const TArray<FString> UMS_ST_BytesBasedBase::GetStringArguments(FInstancedStruct SystemArgumentsStruct)
{
	TArray<FString> Arguments =TArray<FString>();
	Arguments.SetNum(1);
	const FC_ST_Bytes Bytes = SystemArgumentsStruct.Get<FC_ST_Bytes>();
	Arguments[0] = UFL_UEM_Encode::EncodeBytes(Bytes.value);
	return Arguments;
}

const FString UMS_ST_BytesBasedBase::GetEncodedArguments(FInstancedStruct SystemArgumentsStruct)
{
	const FC_ST_Bytes Bytes = SystemArgumentsStruct.Get<FC_ST_Bytes>();
	return UFL_UEM_Encode::EncodeBytes(Bytes.value);
}
