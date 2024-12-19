
cls
function pingAll
{
    param($liste)

    $reponse=@()
    foreach($pc in $listePC)
    {
        $pingSuccess = Test-Connection -ComputerName $pc.nom -Count 1 -Quiet
        $reponse += @{
                      Nom=$pc.nom 
                      Etat= $pingSuccess
                     }
    }
    return $reponse
}
$listePC = Import-Csv -Path "C:\Users\Administrateur\Desktop\Support\listePC.csv" 


