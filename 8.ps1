# Charger le module SQLServer
Import-Module SQLServer

# Définir les paramètres de connexion
$serverName = ".\SQLEXPRESS"
$databaseName = "AdventureWorks2017"
# $query = "SELECT FirstName, LastName FROM Person.Person where BusinessEntityID=1"
$query = "update Person.Person set FirstName='Albert' where BusinessEntityId=1"
$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;TrustServerCertificate=True;"

# Exécuter la requête SQL
$results = Invoke-Sqlcmd -ConnectionString $connectionString -Query $query

# Afficher les résultats
$results | Format-Table -AutoSize

