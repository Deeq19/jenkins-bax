function DumpCleanup{

 #------------- Param Logic: TBD (11.1.19)

    Param (
        #[Parameter (Mandatory=$true)] [STRING] $Region,
        #[Parameter (Mandatory=$true)] [STRING] $Env,
        #[STRING] $Env,
        #[Parameter (Mandatory=$true)] [STRING] $server,
        [Parameter (Mandatory=$true)] [STRING] $Services
        
    )

 #------------- DumpFile funtion logic: Done (11.1.19)
    $Sourcefile = "./Cognos_ControlFile.csv"
  
    $StartProperties = Import-Csv $SourceFile | Where-Object { ($_.Service_Code -match $services)} `
                                                | Select Server_Name, Service_Name, Install_Location 

    $StartProperties 

    foreach($line in $StartProperties){
        #if ([string]$line.'Server_Name' -eq $Server_Name){ 
        $Server_Name = [string]$line.'Server_Name'
        $Service_Name = [string]$line.'Service_Name'
        $Install_Location = [string]$line.'Install_Location' 

        
     
 # -----------
        $TempDumps = $Server_Name + "    "  +  $Install_Location + "\temp"
        $TempDumps
    
   <#
        if(Test-Path -Path $TempDumps) #path exists, continue 
            {
                
                Get-ChildItem $TempDumps -Include *.tmp -Recurse | foreach ($_) {Remove-Item $_.fullname} -ErrorAction Stop
                Get-ChildItem $TempDumps -Include *.dmc -Recurse | foreach ($_) {Remove-Item $_.fullname}   -ErrorAction Stop
                Remove-Item $TempDumps\*UDA* -ErrorAction Stop
            }
        else {
              $Error = ( "Files from path " + $TempDumps +  " were not found" )
              Write-Error $Error
             } 

 # ------------
        $XQEDumps = $Server_Name +  "   "  + $Install_Location + "\temp\XQE"
        #$XQEDumps
        if(Test-Path -Path $XQEDumps) #path exists, continue 
            {
                
                Get-ChildItem $XQEDumps -Include *.cache -Recurse | foreach ($_) {Remove-Item $_.fullname} -ErrorAction Stop
                Get-ChildItem $XQEDumps -Include *.tmp -Recurse | foreach ($_) {Remove-Item $_.fullname}   -ErrorAction Stop
            }
        else {
              $Error = ( "Files from path " + $XQEDumps +  " were not found" )
              Write-Error $Error
             } 

    #---Delete by size -- Subsutitive If loop above----
                #Get-ChildItem $XQEDumps -Include *.cache -Recurse | ForEach-Object{
    #                if ($_.Length -ge $FileSize ) {
     #                   Remove-Item $_.FullName -WhatIf} -ErrorAction Stop
                      #  }   
                
                #Get-ChildItem $XQEDumps -Include *.tmp -Recurse | ForEach-Object{
    #                if ($_.Length -ge $FileSize ) {
     #                   Remove-Item $_.FullName -WhatIf} -ErrorAction Stop
                      #  }

 # --------------
        $binDumps = $Server_Name +  $Install_Location + "\bin"
        #$binDumps
        if(Test-Path -Path $binDumps) #path exists, continue 
            {
                Get-ChildItem $binDumps -Include *.phd -Recurse | foreach ($_) {Remove-Item $_.fullname}  -ErrorAction Stop
                Get-ChildItem $binDumps -Include *.dmp -Recurse | foreach ($_) {Remove-Item $_.fullname}   -ErrorAction Stop 
            }
        else {
              $Error = ( "Files from path " + $binDumps +  " were not found" )
              Write-Error $Error
              } 
 # -------------------
        $bin64Dumps = $Server_Name +  $Install_Location + "\bin64"
        #$bin64Dumps
        if(Test-Path -Path $bin64Dumps) #path exists, continue 
           {
                Get-ChildItem $bin64Dumps -Include *.dmp -Recurse | foreach ($_) {Remove-Item $_.fullname} -ErrorAction Stop

           }
        else {
              $Error = ( "Files from path " + $bin64Dumps +  " were not found" )
              Write-Error $Error
             } 

 # ---------
       $wlpDumps = $Server_Name +  $Install_Location + "\wlp"
       #$wlpDumps
       if(Test-Path -Path $wlpDumps) #path exists, continue 
           {
                Get-ChildItem $wlpDumps -Include *.phd -Recurse | foreach ($_) {Remove-Item $_.fullname} -ErrorAction Stop

           }
        else {
              $Error = ( "Files from path " + $wlpDumps +  " were not found" )
              Write-Error $Error
             } 


    
     }
    #> 
    }
}
