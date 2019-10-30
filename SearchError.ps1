#Test Jenkins-Powershell parameter push 

# Summary: this script searches for a prodived error (ie 12345) in all the .txt files in the provided path. 

#Example: I have a folder with 5 text files, 3 of which have '12345' somewhere within the file. Two of those files do not have any errors.
#         The script will return the name of the files where the error was found (ie. Test1.txt, Test2.txt) 
#-------------------------

 function SearchError{

    Param (
        #[Parameter (Mandatory=$true)] [STRING] $SourcePath,
        #[Parameter (Mandatory=$true)] [STRING] $SourceFile,
        #[Parameter (Mandatory=$true)] [STRING] $ErrorCode,
        #[Parameter (Mandatory=$true)] [STRING] $FileType
        #[Parameter (Mandatory=$true)] [STRING] $DestPath
        
        #for testing purposes. Where you want to see the output file.Important to add .\NAMEOFTXTFILE.txt
        #[Parameter (Mandatory=$true)] [STRING] $OutputSummary #example path: C:\Users\jessica.gutierrez\Desktop\FunctionOutputs\CopyFile_OutputSummary.txt
      

        )
    
    #$TargetPath = "$($SourcePath)"
    #$TargetPath = "$($SourcePath)\$($SourceFile)"
    #Return $TargetPath

    #$DestinationPath = "$($DestPath)"
    #Return $DestinationPath 
   

    #foreach($error in $TargetPath) {

    $Files = Get-ChildItem ${env:TargetPath} | Select-String -pattern ${env:ErrorCode} | group path | select name
    #Get-ChildItem $TargetPath | Select-String -pattern $ErrorCode #return text with error code 
    Write-Output ( "Files in " + ${env:TargetPath} + " were search for error code: " + ${env:ErrorCode} + $Files)| Out-File ${env:OutputSummary}
    Write-Output ("Open " + ${env.OutputSummary} + " to see script output" )
    $Files



}
SearchError 


 #[Parameter (Mandatory=$true)] [STRING] $Region,
        #[Parameter (Mandatory=$true)] [STRING] $Env,
        #[STRING] $Env,
        #[Parameter (Mandatory=$true)] [STRING] $ScriptName, #$ScriptName 
        #[Parameter (Mandatory=$true)] [STRING] $Server_Name,
        #[STRING] $Server
        #[STRING] $Services
        #[STRING] $TargetPath
