# Echec déplacez un cavalier de A1 à H8
function PositionValide 
{ 
    param ( [int]$x, [int]$y ) 
    return ($x -ge 1 -and $x -le 8 -and $y -ge 1 -and $y -le 8) 
}
cls

$mouvements = @(@{dx=2; dy=1}, @{dx=2; dy=-1}, @{dx=-2; dy=1}, @{dx=-2; dy=-1}, @{dx=1; dy=2}, @{dx=1; dy=-2}, @{dx=-1; dy=2}, @{dx=-1; dy=-2} )

$position = "A1"
$compteur = 0
While($position -ne "H8")
{
    $compteur++
    $ligne = $position[0] - 64
    $colonne = $position[1] - 48

    do
    {
        $deplacement = Get-Random -Minimum 0 -Maximum 8
        $newLigne = $ligne + $mouvements[$deplacement].dx
        $newColonne = $colonne + $mouvements[$deplacement].dy
        # Write-Host "$deplacement -> $newLigne | $newColonne"
        # Start-Sleep -Seconds 2
    }
    while(-not (Positionvalide -x $newLigne -y $newColonne))

    $position = [Char]($newLigne + 64) + $newColonne
    Write-Host $compteur ": "  $position
}