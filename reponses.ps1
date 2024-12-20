function Exo1_CalculTva
{
    param([decimal]$montantHT, [decimal]$codeTva)
    $tva=0
    switch($codeTva)
    {
        1 {$tva=1.33}
        default {$tva=1.2}
    }
    return $montantHT * $tva
}

function exo2_Location
{
    param($jour, $km,  [int]$code)
    if ($jour -gt 30)
    {
        return 0.5 * $km + 60 * $jour
    }
    else
    {
        switch($Code)
        {
            0 {
                Write-Host "Code à zéro" -ForegroundColor Yellow
                return 0.5 * $km + 60 * $jour
                }
            1 {return 0.8 * $km + 50 * $jour}
            default {return 0.9 * $km }
        }
    }
}

function Calculette
{
    param([string]$operateur, [decimal] $a, [decimal] $b)
    switch($operateur)
    {
        "+" { return $a + $b}
        "-" { return $a - $b}
        "*" { return $a * $b}
        "/" {
                if($b -eq 0) { return "Erreur"} 
                else { return $a / $b }
            }
        defalut { return "Erreur"}
    }
}

function Exo4_Services
{
    $services = Get-Service
    $servicesStopped = $services | where {$_.Status -eq "Stopped"}
    $servicesRunning = $services | where {$_.Status -eq "Running"}
    Write-Host $servicesStopped.Count "services arrêtés" -ForegroundColor Yellow
    write-host $servicesStopped -ForegroundColor Yellow
    write-host 
    Write-Host $servicesRunning.Count "services démarrés" -ForegroundColor Green
    write-host $servicesRunning -ForegroundColor Green
}

cls
# Exo1
$m1_1 = Exo1_CalculTva -montantHT 100 -codeTva 1
$m1_2 = Exo1_CalculTva -montantHT 100 -codeTva 3
Write-Host "Exo1 : $m1_1 | $m1_2"

#Exo2
$m2_1 = exo2_Location -jour 45 -km 120 -code 0
$m2_2 = exo2_Location -jour 5 -km 20 -code 3
Write-Host "Exo2 : $m2_1 | $m2_2"

#Exo3
$m3_1 = Calculette -operateur + -a 13 -b 12
$m3_2 = Calculette -operateur / -a 13 -b 12
$m3_3 = Calculette -operateur / -a 13 -b 0
$m4_3 = Calculette -operateur $ -a 13 -b 0
Write-Host "Exo3 : $m3_1 | $m3_2 | $m3_3 | $m3_4"

#Exo4
Exo4_Services