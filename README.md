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

