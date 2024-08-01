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

REM Change working directory to the location of the DB dump file to.
C:
CD C:\backups\

REM Compression of the DB dump files into CAB files
MAKECAB "ocadmin_dbo.%TIMESTAMP%.sql" "ocadmin_dbo.%TIMESTAMP%.sql.cab"
MAKECAB "openclinic_dbo.%TIMESTAMP%.sql" "openclinic_dbo.%TIMESTAMP%.sql.cab"
MAKECAB "ocstats_dbo.%TIMESTAMP%.sql" "ocstats_dbo.%TIMESTAMP%.sql.cab"

REM Import the 3 databases in the windows MySQL DB 
REM the windows  credentials for MySQL are:
REM user: root
REM password: openclinic
 "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -popenclinic ocadmin_dbo < "ocadmin_dbo.%TIMESTAMP%.sql" 
 "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -popenclinic openclinic_dbo < "openclinic_dbo.%TIMESTAMP%.sql"
 "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -popenclinic ocstats_dbo < "ocstats_dbo.%TIMESTAMP%.sql"

REM Delete uncompressed DB dump files to free space.
 DEL /q /f "ocadmin_dbo.%TIMESTAMP%.sql"
 DEL /q /f "openclinic_dbo.%TIMESTAMP%.sql"
 DEL /q /f "ocstats_dbo.%TIMESTAMP%.sql"