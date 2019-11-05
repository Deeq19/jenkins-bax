function Start_Stop{
    Param(

        [Parameter (Mandatory=$true)] [String]$Server,
        [String]$Services

        )
        
    Write-Output $Server
    Write-Output $Services

  
}
Start_Stop 
