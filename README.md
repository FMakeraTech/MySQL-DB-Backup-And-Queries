# MySQL-DB-Backup-And-Queries

# 1. FICHIER : mysql-backup.bat 
# =============================
# =============================
# Le fichier mysql-backup.bat contient des scripts pour effectuer une sauvegarde de bases de données

# CONTEXTE
# ========
# Un serveur sous Linux héberge une application de gestion des informations hospitalières et gère les bases de données avec MySQL. La même application est installée sur un autre serveur sous Windows qui utilise également MySQL. Les deux serveurs sont en réseau local.

# Serveur Linux : Serveur de production
# Serveur Windows : Serveur de backup

# SCRIPTS
# ========
# Le serveur sous Windows effectue des sauvegardes de données en se connectant au serveur de base de données du serveur de production (Linux) grâce à son adresse IP et aux identifiants de son SGBD.

# Après avoir effectué les sauvegardes, il compresse les fichiers SQL en .cab pour les protéger contre des virus potentiels.

# Ensuite, il importe à son tour les bases de données pour maintenir à jour les dernières données dans l'application, afin qu'il puisse remplacer le serveur de production en cas de panne.

# Enfin, il supprime les fichiers de dump pour libérer de l'espace, ayant déjà créé des copies compressées.




# 2. FICHIER : importCSVIntoMySQL.sql
# ===================================
# ===================================
# Le fichier importCSVIntoMySQL.sql contient les requêtes en étapes pour importer des listes CSV dans les tables des bases de données

# CONTEXTE
# ========
# L'application de gestion des dossiers patients utilise trois bases de données :
# OCADMIN_DBO : Stocke les données sur l'identification des patients ainsi que des données statiques comme les classifications des maladies, les pays, etc.
# OPENCLINIC_DBO : Stocke les données cliniques et contient des vues des tables de la base de données OCADMIN_DBO.
# Lorsque des structures de soins migrent vers la digitalisation des données et que leurs données sont initialement dans des fichiers Excel, il est impératif de pouvoir importer ces données dans les tables correspondantes après avoir adapté les colonnes Excel aux colonnes des tables des bases de données et les transformer en fichiers CSV (séparateur point-virgule).

# REQUÊTES
# ========
# La première requête crée une table provisoire dans la base de données ocadmin_dbo pour stocker les données du fichier CSV de la liste des patients. J'évite de les importer directement dans la table réservée aux patients car la liste en CSV manque certaines informations comme la langue, le pays, etc., des informations qui changent rarement pour tous les patients.

# La deuxième requête importe la liste CSV dans la table provisoire créée.

# La troisième requête insère les données de la table provisoire des patients dans la table admin réservée aux patients, en complétant les informations manquantes qui sont les mêmes pour tous les patients.

# La quatrième requête supprime la table provisoire qui n'est plus nécessaire.

# La cinquième requête importe directement la liste des données en CSV dans une table de la base de données openclinic_dbo sans passer par une table provisoire puisque le fichier CSV contient les mêmes colonnes que la table de la base de données.
