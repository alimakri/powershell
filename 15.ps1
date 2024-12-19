# Charger les assemblées nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "Exemple WinForms"
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = "CenterScreen"

# Créer un bouton
$button = New-Object System.Windows.Forms.Button
$button.Size = New-Object System.Drawing.Size(100, 50)
$button.Location = New-Object System.Drawing.Point(100, 70)
$button.Text = "Cliquez-moi"

# Ajouter un événement au bouton
$button.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Bonjour, monde!", "Message")
})

# Ajouter le bouton à la fenêtre
$form.Controls.Add($button)

# Afficher la fenêtre
[void]$form.ShowDialog()
