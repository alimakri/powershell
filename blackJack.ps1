cls
# Définir les cartes et les valeurs
$cartes = @("2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A")
$valeurs = @{
    "2" = 2; "3" = 3; "4" = 4; "5" = 5; "6" = 6; "7" = 7; "8" = 8; "9" = 9; "10" = 10
    "J" = 10; "Q" = 10; "K" = 10; "A" = 11
}

# Fonction pour tirer une carte aléatoire
function Tirer-Carte {
    return $cartes | Get-Random
}

# Fonction pour calculer la valeur d'une main
function Calculer-Valeur {
    param (
        [string[]]$main
    )
    $valeur = 0
    $nombreAs = 0
    foreach ($carte in $main) {
        $valeur += $valeurs[$carte]
        if ($carte -eq "A") {
            $nombreAs++
        }
    }
    while ($valeur -gt 21 -and $nombreAs -gt 0) {
        $valeur -= 10
        $nombreAs--
    }
    return $valeur
}

# Initialiser les mains du joueur et du croupier
$mainJoueur = @()
$mainCroupier = @()

# Tirer deux cartes pour le joueur et le croupier
$mainJoueur += Tirer-Carte
$mainJoueur += Tirer-Carte
$mainCroupier += Tirer-Carte
$mainCroupier += Tirer-Carte

# Afficher les mains initiales
Write-Output "Main du joueur: $($mainJoueur -join ', ') (Valeur: $(Calculer-Valeur -main $mainJoueur))"
Write-Output "Main du croupier: $($mainCroupier[0]), ?"

# Tour du joueur
while ((Calculer-Valeur -main $mainJoueur) -lt 21) {
    $choix = Read-Host "Voulez-vous tirer une carte (T) ou rester (R)?"
    if ($choix -eq "T") {
        $mainJoueur += Tirer-Carte
        Write-Output "Main du joueur: $($mainJoueur -join ', ') (Valeur: $(Calculer-Valeur -main $mainJoueur))"
    } elseif ($choix -eq "R") {
        break
    }
}

# Tour du croupier
while ((Calculer-Valeur -main $mainCroupier) -lt 17) {
    $mainCroupier += Tirer-Carte
}

# Afficher les mains finales
Write-Output "Main du joueur: $($mainJoueur -join ', ') (Valeur: $(Calculer-Valeur -main $mainJoueur))"
Write-Output "Main du croupier: $($mainCroupier -join ', ') (Valeur: $(Calculer-Valeur -main $mainCroupier))"

# Déterminer le gagnant
$valeurJoueur = Calculer-Valeur -main $mainJoueur
$valeurCroupier = Calculer-Valeur -main $mainCroupier

if ($valeurJoueur -gt 21) {
    Write-Output "Le joueur a dépassé 21. Le croupier gagne!"
} elseif ($valeurCroupier -gt 21 -or $valeurJoueur -gt $valeurCroupier) {
    Write-Output "Le joueur gagne!"
} elseif ($valeurJoueur -lt $valeurCroupier) {
    Write-Output "Le croupier gagne!"
} else {
    Write-Output "Égalité!"
}
