# Charger le module ImportExcel
Import-Module ImportExcel

# Récupérer la liste des services
$services = Get-Service | Select-Object Name, DisplayName, Status

# Définir le chemin du fichier Excel
$excelPath = "C:\fichier.xlsx"

# Exporter les services vers une feuille Excel
$services | Export-Excel -Path $excelPath -WorksheetName "Services"

# Ouvrir le fichier Excel
$excel = Open-ExcelPackage -Path $excelPath
$sheet = $excel.Workbook.Worksheets["Services"]

# Ajuster automatiquement la largeur de chaque colonne
$sheet.Cells[$sheet.Dimension.Address].AutoFitColumns()

# Enregistrer et fermer le fichier Excel
Close-ExcelPackage $excel

Write-Output "Les colonnes ont été ajustées automatiquement dans $excelPath."
