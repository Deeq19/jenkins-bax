function startStopServices{

 Param(
        [Parameter (Mandatory=$true)] [String] $startStop,
        [Parameter (Mandatory=$true)] [String] $server, #USOHCOGAPP901
        [String[]] $services) #DISP0X

        
   
    [String] $sortOrder = ($startStop + "_Order")
    [String] $waitTime = ($startStop + "_Wait")
    # Write-Output ($services -Join ",")
        
    $Sourcefile = "./Cognos_ControlFile.csv"
    $StartProperties = Import-Csv $Sourcefile | Where-Object { ($_.Server_Name -eq $server) -and ($_.Service_Code -match ($services -Join "|"))} `
                                               | Select Server_Name, Service_Code, Service_Name, Start_Order, Stop_Order, Start_Flag, Start_Wait, Stop_Wait `
                                               | Sort-Object -Property {[int]$_.$sortOrder}
    $StartProperties
    
    foreach($line in $StartProperties){
       Write-Output ($startStop `
                + " " + [string]$line.'Service_Name' `
                + " " + " Timeout " + [string]$line.$waitTime)
    }
}


