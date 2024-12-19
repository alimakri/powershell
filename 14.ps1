# Exercice Mercredi : tri à bulle

$tableau = @(64, 34, 25, 12, 22, 11, 90)
$tableau
$curseur = 0

while($curseur -lt $tableau.Length-1)
{
    if ($tableau[$curseur] -gt $tableau[$curseur+1])
    {
        # Inversion des 2 éléments
        $tampon = $tableau[$curseur]
        $tableau[$curseur] = $tableau[$curseur+1]
        $tableau[$curseur+1] = $tampon

        $curseur=0
    }
    else
    {
        $curseur++
    }
}
Write-Host "---------------------" -ForegroundColor Yellow
$tableau