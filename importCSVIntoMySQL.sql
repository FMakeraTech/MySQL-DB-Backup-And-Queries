
/* Query 1*/
/* Create a table patientListTemp in the ocadmin_dbo database to temporarily store data from a CSV file*/
create table ocadmin_dbo.patientListTemp(personid integer(10), numero integer, nom varchar(255),prenom varchar(255),ddn date);

/* Query 2*/
/* Load the data from the CSV file into the patientListTemp table*/
LOAD DATA LOCAL INFILE 'D:/2024/PROJETS/CSV/liste_patients.csv'
INTO TABLE ocadmin_dbo.patientListTemp FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(privateid, personid,numero, nom, prenom,sexe,ddn,phone,adress,pays,clinique);

/* Query 3*/
/*Insert the data from the patientListTemp table into the admin table, completing some similar information that was not present in the CSV file */
insert into ocadmin_dbo.admin(personid,immatnew, lastname, firstname, gender, dateofbirth, sourceid, language,searchname, updatetime, native_country,updateuserid,updateserverid)
select personid,numero,upper(nom), upper(prenom),'',ddn,'1','fr',upper(concat(nom,',',prenom)),now(),'BI',4,'1'
from ocadmin_dbo.patientListTemp;

/* Query 4*/
/* Delete the patientListTemp table, which was temporarily used to store the information from the CSV file*/
drop table ocadmin_dbo.patientListTemp;

/* Query 5*/
/* Load a CSV file containing the list of pathologies into the oc_labels table of the openclinic_dbo database*/
LOAD DATA LOCAL INFILE 'D:/2024/PROJETS/CSV/liste_pathologies.csv' 
INTO TABLE openclinic_dbo.oc_labels FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(OC_LABEL_TYPE,OC_LABEL_ID,OC_LABEL_LANGUAGE,oc_label_value,OC_LABEL_SHOWLINK,OC_LABEL_UPDATETIME,OC_LABEL_UPDATEUSERID
);