# Définir les paramètres de connexion
$serverName = ".\SQLEXPRESS"
$databaseName = "M2i"
$tableName = "Service"

# Créer la chaîne de connexion
cls
$connectionString = "Server=$serverName;Integrated Security=True;TrustServerCertificate=True"

# Créer la base de données
$queryCreateDatabase = "CREATE DATABASE [$databaseName];"
Invoke-Sqlcmd -ConnectionString $connectionString -Query $queryCreateDatabase

# Mettre à jour la chaîne de connexion pour inclure la base de données
$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;TrustServerCertificate=True"

# Créer la table
$queryCreateTable = @"
CREATE TABLE $tableName (
    id INT IDENTITY(1,1),
    nom NVARCHAR(50),
    etat NVARCHAR(50)
);
"@
Invoke-Sqlcmd -ConnectionString $connectionString -Query $queryCreateTable
