$a = 3
if ($a -eq 1)
{
    Write-Host "Un"
}
elseif ($a -eq 2)
{
    Write-Host "Deux"
}
else
{
    Write-Host "Autre"
}

for($i=1;$i -lt 11; $i++)
{
    for($j=1;$j -lt 11; $j++)
    {
        Write-Host "$i - $j"
    } 
} 

$services = Get-Service
foreach($service in $services)
{
    $couleur = "Red"
    if ($service.Status -eq "Running")
    {
        $couleur = "Green"
    }
    Write-Host $service.Name -ForegroundColor $couleur
} 

$services = Get-Service
for($i=0; $i -lt $services.Count; $i++)
{
    $couleur = "Red"
    if ($services[$i].Status -eq "Running")
    {
        $couleur = "Green"
    }
    Write-Host $services[$i].Name -ForegroundColor $couleur
}

$a = 1
switch ($a)
{
    1 
    {
    Write-Host "Un"
    }

    2 
    {
    Write-Host "Un"
    }
    default
    {
        Write-Host "Autre"
    }
}

#Version Commande
Get-WmiObject win32_networkAdapter | where {$_.adapterType -match 'eth'} | foreach { write-host $_.macaddress}

# Version script
$adapters = Get-WmiObject win32_networkAdapter
foreach($ad in $adapters)
{
    if ($ad.adapterType -match 'eth')
    {
    write-host $ad.macaddress
    }
}

