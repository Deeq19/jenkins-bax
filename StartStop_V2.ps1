function Start_Stop{
    Param(

        #[Parameter (Mandatory=$true)] [String] $JenkinsStart_Stop = $env:Start_Stop
        [Parameter (Mandatory=$true)] [String]$JenkinsServer = ${env:CognosServer}
        )


    $Sourcefile = "C:\Users\jessica.gutierrez\OneDrive - Slalom\Baxter\Powershell Scripts\ControlFile\Cognos_ControlFile_CLEAN10182019.csv"

    $StartProperties = Import-Csv $Sourcefile |Select Server_Name, Service_Name, Start_Order, Start_Flag, Start_Wait  | Sort-Object -Property Server_Name, {[int]$_.Start_Order} 


    foreach($line in $StartProperties){
        if ([string]$line.'Server_Name' -eq $JenkinsServer){ 
        $Server_Name = [string]$line.'Server_Name'
        $Service_Name = [string]$line.'Service_Name'
        $Start_Order = [string]$line.'Start_Order'
        $Start_Wait= [string]$line.'Start_Wait' 

        $file = #"Matches? " + $Server_Name
                "Start " + $Service_Name + "  " + " Timeout " + $Start_Wait
        Write-Output $file }
        }

        
  

  













}
Start_Stop 
