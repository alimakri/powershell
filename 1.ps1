Set-Location "\" # Aller à la racine du lecteur
# New-Item -Path "MonDossier" -ItemType Directory # Créer un dossier

Set-Location .\MonDossier # Aller dans mon dossier

# Créer un fichier texte avec un contenu
# Set-Content -Path "monfichier1.txt" -Value "Le texte dans le fichier"

# Get-Content -Path "monfichier1.txt"

# Supprimer tous les fichiers dont la taille > 10 Ko
Get-ChildItem -File | Where {$_.Length -gt 9000} | ForEach-Object { $_.Delete()} 

Set-Location HKCU:\
Set-Location ./Software
Set-Location Microsoft
Set-Location C:\

New-Item -Path monfichierA.txt

$a = "Bonjour Hervé"
$a
$a = 'Bonjour Hervé'
$a
$b = ' et Martine'
$a = "Bonjour Hervé $b"
$a

Write-Host "Bonjour tout le monde" -ForegroundColor Yellow
Get-Service

Get-Service | ForEach-Object { if ($_.Status -eq 'Running') { Write-Host "$($_.DisplayName) : $($_.Status)" -ForegroundColor Green } else { Write-Host "$($_.DisplayName) : $($_.Status)" -ForegroundColor Red } }

[int]$i=1
[char]$x=65

$phrase = "Bonjour tout le monde"
$phrase -like "*ou*"

$suite = 1..5
$suite | Measure-Object -sum

$d = Get-Date
$d.Month
$d.Minute

$d.DayOfWeek

$d = Get-Date -Year 1962 -Month 8 -Day 20
$d
$d.AddDays(365)
$e = Get-Date

$e - $d | gm


