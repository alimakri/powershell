function get-fic ($endroit, $taille)
{
    Set-Location $endroit
    $tousLesFichiers = Get-ChildItem -File
    $lesGrosFichiers = $tousLesFichiers | where {$_.Length -gt $taille} | select -Property Name, Length
    $lesGrosFichiers
}

cls
get-fic c:\ 1KB
get-fic c:\windows 2KB
get-fic C:\Windows\System32 1MB

function Division
{
    param ($a, $b)
    $c = $a/$b
    return $c
}
cls
$resultat = Division 4 0
$resultat