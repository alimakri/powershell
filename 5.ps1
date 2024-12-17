$services = Get-service
$body = "<h1>Liste des services</h1>"
$body += "<table>"
foreach($service in $services)
{
    $couleur ="pink"
    if ($service.Status -eq "Running") { $couleur="lightGreen" }
    $body += "<tr style=""background-color:$couleur""><td><b>" + $service.Name + "</b></td><td>" + $service.Status + "</td></tr>"
}
$body += "</table>"
$html = "<html><head><title>$env:ComputerName</title></head><body>$body</body></html>"
Set-Content -Path "c:\services.html" -Value $html