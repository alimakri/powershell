# Chifoumi
# On gagne si trois succès DE SUITE
# Afficher les choix et le score à chaque proposition
# 1 : pierre -  2 : Feuille - 3 : Ciseau

$pointsUser = 0
$pointsMachine = 0

while($pointsMachine -ne 3 -and $pointsUser -ne 3)
{
    $propMachine = Get-Random -Minimum 1 -Maximum 3 # Choix machine
    $propUser = Read-Host                          # Choix User

    $reponse = 0
    # Egalité
    if ($propMachine -eq $propUser) 
    {
        $reponse = 0
    }
    # Machine gagne
    elseif (($propMachine -eq 1 -and $propUser -eq 3) `
            -or                                       `
            ($propMachine -eq 2 -and $propUser -eq 1) `
            -or                                       `
            ($propMachine -eq 3 -and $propUser -eq 2))
    {
        $reponse = -1
    } 
    # User gagne
    else
    {
        $reponse = 1
    }
    Write-Host "$propUser - $propMachine -> $reponse" -ForegroundColor Yellow
    if ($reponse -eq 1)
    {
        $pointsUser ++
        $pointsMachine = 0
    }
    elseif ($reponse -eq -1)
    {
        $pointsUser = 0
        $pointsMachine++
    }
    Write-Host "Score : User = $pointsUser - Machine = $pointsmachine" -ForegroundColor Yellow
}