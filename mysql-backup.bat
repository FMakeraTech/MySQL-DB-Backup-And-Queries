@ECHO OFF

REM set a timestamp variable
set TIMESTAMP=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%

REM Export all databases (ocadmin_dbo, openclinic_dbo, ocstats_dbo) into file C:\backups\ 
REM databases names after being exported: 
REM ocadmin_dbo.[year][month][day].sql
REM openclinic_dbo.[year][month][day].sql
REM ocstats_dbo.[year][month][day].sql
REM IP Address of the remote server = 192.168.1.27
REM MySQL port = 3306
REM MySQL user = root
REM MySQL password = no passeword

REM export the 3 databases
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump.exe" --host 192.168.1.27 -P 3306 -u root ocadmin_dbo > "C:\backups\ocadmin_dbo.%TIMESTAMP%.sql" 
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump.exe" --host 192.168.1.27 -P 3306 -u root openclinic_dbo > "C:\backups\openclinic_dbo.%TIMESTAMP%.sql" 
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump.exe" --host 192.168.1.27 -P 3306 -u root ocstats_dbo > "C:\backups\ocstats_dbo.%TIMESTAMP%.sql" 
