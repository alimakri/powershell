# Algorithmique
# Devinez un nombre compris entre 1 et 100
# 1. La machine défnit le nombre à deviner
# 2. L'utilisateur propose un nombre
# 3. La machine répond trop petit, trop grand, Gagné
# 4. Version 2 : on peut perdre si le nombre de coups est > 7

$nombreADeviner = Get-Random -Minimum 1 -Maximum 101
# Write-Host $nombreADeviner -ForegroundColor Yellow
$proposition = 0
$nCoup = 0
$continuer = $true

While($Continuer)
{
    Write-Host "Donnez un nombre: ($nCoup)"
    $propStr = Read-Host 
    if (-not [int]::TryParse($propStr, [ref]$proposition) -or $proposition -lt 1 -or $proposition -gt 100 )
    {
        Write-Host "Proposition non valide"
    }
    else
    {
        $nCoup ++

        if ($nCoup -ge 8) 
        {
            Write-Host "Perdu"
            $continuer = $false
        }
        elseif ($proposition -lt $nombreADeviner)
        {
            Write-Host "Trop petit"
        }
        elseif ($proposition -gt $nombreADeviner)
        {
            Write-Host "Trop grand"
        }
        else
        {
            Write-Host "Gagné"
            $continuer = $false
        }
    }
}

