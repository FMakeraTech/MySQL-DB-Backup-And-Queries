


use openclinic_dbo;


/*Requete 1*/
/* Sortir les patients qui ont été consulté en 2023*/
select 
    t.updatetime as Date,
    a.personid as ID,
    a.firstname as prenom,
    a.lastname as Nom,
    a.gender as Sexe,
    a.ddn as Date_naissance,
    p.city as Ville,
    p.mobile as Telephone_mobile,
    (select value from items where transactionid = t.transactionid and type = 'item.type.symptom') as Symptome,
    (select value from items where transactionid = t.transactionid and type = 'item.type.anamnesis') as Motif_de_consultation,
    (select value from items where transactionid = t.transactionid and type = 'item.type.diagnostic') as Pathology,

from items i, transactions t, healthrecord h, adminview a, privateview p
where i.transactionid = t.transactionid
and t.healthrecordid = h.healthrecordid
and h.personid = a.personid
and a.peronid = p.personid
and t.updatetime between '2023-01-01 00:00:00' and '2023-12-31 23:59:59';

/*Requete 2*/
/*Sortir le nombre de patients de moins de 5 ans en 2023 et qui ont comme symptome fievre  */

select count(personid) as nombreDepatients from items i, transactions t, healthrecord h, adminview a, privateview p
where i.transactionid = t.transactionid
and t.healthrecordid = h.healthrecordid
and h.personid = a.personid
and a.peronid = p.personid
and t.updatetime between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'
and diff(t.updatetime - a.ddn) < 5
and i.type = 'item.type.symptom'
and i.value like '%fievre%';

/*Requete 3*/
/*Sortir les chiffres sur le nombre de patient recu par pathologie en 2023 */

select count(personid) as nombreDePatients, i.value as Pathologie from items i, transactions t, healthrecord h, adminview a, privateview p
where i.transactionid = t.transactionid
and t.healthrecordid = h.healthrecordid
and h.personid = a.personid
and a.peronid = p.personid
and t.updatetime between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'
and i.type = 'item.type.diagnosis'
group by i.value;