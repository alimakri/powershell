cls
# Récupération de tous les fichiers
$fichiersExe = Get-ChildItem -Recurse -Path "C:\" -Filter "*.exe" -force -ErrorAction SilentlyContinue | Sort-Object -Property Length

# ** Répartition sur les catégories
# $categorie1 = $fichiersExe | where { $_.Length -lt 1MB }
# $categorie2 = $fichiersExe | where { $_.Length -ge 1MB -and $_.Length -lt 10MB }
# $categorie3 = $fichiersExe | where { $_.Length -ge 10MB }

# ** Répartition sur les catégories
foreach($f in $fichiersExe)
{
    if ($f.Length -lt 1MB)
    {
        $categorie1 += $f
    }
    elseif ($f.Length -ge 1MB -and $f.Length -lt 10MB)
    {
       $categorie2 += $f
    }
    else
    {
       $categorie3 += $f
    }
}



#Fichier HTML
$petitsFichiers = "<table>"
foreach($f in $categorie1)
{
   $petitsFichiers += "<tr><td>" + $f.Name + "</td><td>" + $f.Length + "</td></tr>" 
}
$petitsFichiers += "</table>"

$moyensFichiers = "<table>"
foreach($f in $categorie2)
{
   $moyensFichiers += "<tr><td>" + $f.Name + "</td><td>" + $f.Length + "</td></tr>" 
}
$moyensFichiers += "</table>"

$grandsFichiers = "<table>"
foreach($f in $categorie3)
{
   $grandsFichiers += "<tr><td>" + $f.Name + "</td><td>" + $f.Length + "</td></tr>" 
}
$grandsFichiers += "</table>"


$body = "<h1>Petits fichiers</h1>$petitsfichiers<h1>Moyens fichiers</h1>$moyensfichiers<h1>Petits fichiers</h1>$grandsfichiers"
$html = "<html><head><title>Fichiers par tailles</title></head><body>$body</body></html>"

Set-Content -Path "c:\cat.html" -Value $html