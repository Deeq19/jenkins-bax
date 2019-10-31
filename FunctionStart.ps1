#Summary: 
    # As of now script returns only data from the requested $Server_Name. 
    # Output returns all services within that server and their respected Start_Wait 
    # Only takes 1 server for now. 
    
#To Run in Command line:
# powershell -command .\test2.ps1 -Region "testRegion" -Env "Test" -Services "TestServices"

#Next Steps:
    #1. FIX the sort order output. Right now, output is order by Service Name and NOT by Start_Order!!!!! 

    #2. how to request multiple $Server_Name (s)
        #2.1 Change parameter to array of string 
           # [String[]] 
        #2.2 Change if statement
            # if ([string]$line.'Server_Name' -in $Server_Name) {


    #3. To Start Individual services = easy, make $Services mandatory --> How to start multiple individual services 
 #---------------------------------------------------------------------------------------------------------------------

 function StartServer{

    Param (
        [Parameter (Mandatory=$true)] [STRING] $Region,
        [Parameter (Mandatory=$true)] [STRING] $Env,
        #[STRING] $Env,
        [Parameter (Mandatory=$true)] [STRING] $ScriptName, #$ScriptName 
        [Parameter (Mandatory=$true)] [STRING] $Server_Name
        #[STRING] $Server,
        #[STRING] $Services
    )
    #Write-Output ("Region: "+ $Region + " Env: " + $Env  + " ScriptName: " + $ScriptName + " Server_Name: " + $Server)

    #$startDate = Get-Date;

    $Sourcefile = "C:\Users\jessica.gutierrez\OneDrive - Slalom\Baxter\Powershell Scripts\ControlFile\Cognos_ControlFile_CLEAN10182019.csv"
    $StartProperties  = (Import-Csv $Sourcefile) 

    $Sorted = $StartProperties |select Server_Name,Service_Name, Start_Order, Start_Flag, Start_Wait  | Sort-Object -Property Server_Name, {[int]$_.Start_Order}|Format-Table
    #$Sorted

    foreach($line in $StartProperties){
        if ([string]$line.'Server_Name' -eq $Server_Name){ 
        $Server_Name = [string]$line.'Server_Name'
        $Service_Name = [string]$line.'Service_Name'
        $Start_Order = [string]$line.'Start_Order'
        $Start_Wait= [string]$line.'Start_Wait' 

        $file = #"Matches? " + $Server_Name
                "Start " + $Service_Name + "  " + " Timeout " + $Start_Wait

        Write-Output $file 
            
        }
    

    }
}
StartServer



