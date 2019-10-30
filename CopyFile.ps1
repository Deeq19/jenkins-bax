#Test Jenkins-Powershell parameter push 

# Summary: this function requests a Target path, Target File, and a Destination Path. 
#The file requested (TargetFile) will be copied to the DestinationPath provided. 
#-------------------------

 function CopyFile{

    #Param (
        #[Parameter (Mandatory=$true)] [STRING] $Region,
        #[Parameter (Mandatory=$true)] [STRING] $Env,
        #[STRING] $Env,
        #[Parameter (Mandatory=$true)] [STRING] $ScriptName, #$ScriptName 
        #[Parameter (Mandatory=$true)] [STRING] $Server_Name,
        #[STRING] $Server
        #[STRING] $Services
        #[STRING] $TargetPath


        #[Parameter (Mandatory=$true)] [STRING] $TargetPath,
        #[STRING] $TargetFile
        #[Parameter (Mandatory=$true)] [STRING] $TargetFile,
        #[Parameter (Mandatory=$true)] [STRING] $DestPath
        #[Parameter (Mandatory=$true)] [STRING] $DestFile
        #)

    #$TargetPath = "$($TargetPath)\$($TargetFile)"
    #Return $TargetPath

    #$DestinationPath = "$($DestPath)"
    #Return $DestinationPath 
    
    Copy-Item ${env:TargetPath} -Destination ${env:DestinationPath}
    Write-Output "File" ${env:OriginPath} "has been copied to" ${env:DestinationPath}


}
CopyFile
