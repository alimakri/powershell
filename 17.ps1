# Charger les assemblées nécessaires
Add-Type -AssemblyName PresentationFramework

# Définir l'interface utilisateur en XAML
$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Exemple WPF" Height="200" Width="300">
    <Grid>
        <Button Name="MonBouton" Content="Cliquez-moi" Width="100" Height="50" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</Window>
"@

# Charger le XAML
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [System.Windows.Markup.XamlReader]::Load($reader)

# Ajouter un événement au bouton
$button = $window.FindName("MonBouton")
$button.Add_Click({
    [System.Windows.MessageBox]::Show("Bonjour, monde!", "Message")
})

# Afficher la fenêtre
$window.ShowDialog()
