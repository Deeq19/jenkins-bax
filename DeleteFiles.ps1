# Script includes five deletion scenarios. 

#Scripts requires a source path, file extention (.txt, .docx, tc), file size (0 for now), and an output summary destination file (herea file will be created). 
 function DeleteFiles{

    #Param (
        #[Parameter (Mandatory=$true)] [STRING] $SourcePath,
        #[Parameter (Mandatory=$true)] [STRING] $FileExtension,
        #[Parameter (Mandatory=$true)] [STRING] $FileSize, #Specify size metric kb, mb, gb


        #for testing purposes. Where you want to see the output file. 
        #[Parameter (Mandatory=$true)] [STRING] $OutputSummary #example path: C:\Users\jessica.gutierrez\Desktop\FunctionOutputs\Delete_ExecutionSummary.txt
        #)
    
    #$TargetPath = "${env:SourcePath}"
    #Return $TargetPath

    #$DestinationPath = "$($DestPath)"
    #Return $DestinationPath 
   
# -----------------

   # Deletes all files in source path (folder level)  
   
   Remove-Item ${env:SourcePath}\*.*
   Write-Output ("All files from "+ ${env:SourcePath} + " have been deleted.") #| Out-File ${env:OutputSummary}
   
# ------------------

   # Delete files that start with UDA, regardless of file type. Delete ALL files with UDA.
   
   #Remove-Item $SourcePath\*UDA*
   #Write-Output ("Files starting with UDA in " + $SourcePath + " have been deleted.")| Out-File $OutputSummary

# ----------------------------

   # Delete all files with a specific extenstion type 

   #Get-ChildItem $SourcePath -Include *.$FileExtention -Recurse | foreach ($_) {Remove-Item $_.fullname}
   #Write-Output ("All files with extention "+ "." + $FileExtention + " have been deleted from " + $SourcePath) | Out-File $OutputSummary

# ---------------------------

   # Delete files base on Size 

   #Get-ChildItem $SourcePath -Recurse | ForEach-Object{
    #    if ($_.Length -ge $FileSize ) {
     #       Remove-Item $_.FullName -WhatIf}
      #  }
   #Write-Output ("All files >= " + $FileSize + " have been deleted") | Out-File $OutputSummary


# ------------------

   #Delete files based on time 
   #Notes, - Recurse takes all objects in path (files/folders/subfolders) 

   #Get-ChildItem ${env:SourcePath} -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-5))} | Remove-Item -WhatIf        
   #Write-Output ("Files have been deleted based on LastWritenTime")| Out-File ${env:OutputSummary}

} 
DeleteFiles
