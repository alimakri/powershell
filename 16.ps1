# Charger les assemblées nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

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



#Exemple d'utilisation
#$listePC = Import-Csv -Path "C:\Users\Administrateur\Desktop\Support\listePC.csv" 

#$r= pingAll($listePC)

# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "Etat du réseau"
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = "CenterScreen"
#$iconPath = "icon1.png" 
#$form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($iconPath)

#Création des labels
$listePC = Import-Csv -Path "C:\Users\Administrateur\Desktop\Support\listePC.csv" 
$pcs = pingAll($listePC)
$top = 20 
foreach($pc in $pcs)
{
    $label = New-Object System.Windows.Forms.Label 
    $label.Size = New-Object System.Drawing.Size(120, 20) 
    $label.Location = New-Object System.Drawing.Point(5, $top) 
    $label.Text = $pc.nom
    if($pc.Etat)
    {
        $label.ForeColor = [System.Drawing.Color]::Green    
    }
    else
    {
        $label.ForeColor = [System.Drawing.Color]::Green    
    }
    $form.Controls.Add($label)
    $top += 20
}


# Créer un bouton
$button = New-Object System.Windows.Forms.Button
$button.Size = New-Object System.Drawing.Size(100, 50)
$button.Location = New-Object System.Drawing.Point(150, 30)
$button.Text = "Cliquez-moi"

# Ajouter un événement au bouton
$button.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Bonjour, monde!", "Message")
})

# Ajouter le bouton à la fenêtre
$form.Controls.Add($button)

# Afficher la fenêtre
[void]$form.ShowDialog()

