# A faire ailleurs
$pass = ConvertTo-SecureString "formation" -AsPlainText -force

$credential = New-Object System.Management.Automation.PSCredential "Administrateur", $pass
$servers = Get-Content -Path "C:\serveurs.txt"
foreach($server in $servers)
{
    Get-WmiObject -Class win32_logicalDisk -computer $server -credential $credential
}

