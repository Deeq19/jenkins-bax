function Start_Stop{
    Param(

        [Parameter (Mandatory=$true)] [String] $Start_Stop,
        [Parameter (Mandatory=$true)] [String]$Server,
        [String[]]$Services

        )
    Write-Output $Start_Stop
    Write-Output $Server
    Write-Output $Services

  
}
Start_Stop 