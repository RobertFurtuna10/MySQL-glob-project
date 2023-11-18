create database glob;

use glob;

drop table tara;
drop table orase;
drop table limba;
drop table persoane;

create table tara
(id int not null AUTO_INCREMENT,
nume_tara varchar(50) not null,
continent varchar(50) not null,
suprafata_tara int, 
populatie_tara int,
idlimba int,
idpers int,
idoras int,
PRIMARY KEY(id)
);

create table orase
(id int not null  primary key,
nume_oras varchar(20) not null,
judet varchar(20) not null,
populatie int
);

create table limba
(id int not null auto_increment primary key,
limba_tara varchar(20) not null
);

create table persoane
(id int not null auto_increment primary key,
nume varchar(20) not null,
prenume varchar(20) not null,
data_nasterii date
); 

alter table tara
add foreign key(idoras) references orase(id);

alter table tara
add foreign key(idlimba) references limba(id);

alter table tara
add foreign key(idpers) references persoane(id);

insert into tara (nume_tara, continent, suprafata_tara, populatie_tara, idlimba, idpers, idoras)
values ("Romania", "Europa", 238397, 19120000, 1, 4, 4),
("Argentina", "America de Sud", 288400, 45810000, 2, 1, 2),
("Japonia", "Asia", 377973, 125700000, 3, 2, 1),
("Brazilia", "America de Sud", 8510000, 214300000, 4, 3, 3);
select * from tara;

insert into orase (id, nume_oras, judet, populatie)
values (1, "Kioto", "Kyoto", 1461974), (2, "Rafael Castillo", "Buenos Aires", 103992), (3,"Campo grande", "Alagoas", 8142), (4, "Iasi", "Iasi", 271692);
select * from orase;

insert into limba (limba_tara)
values("romana"), ("spaniola"), ("japoneza"), ("portugheza");
select * from limba;

insert into persoane (nume, prenume, data_nasterii)
values ("Lucas", "Augustin", '1980-01-30'), ("Reny", "Sakura", '2005-05-17'), ("Diego", "Franco", '1976-02-03'), ("Marinescu", "Ion", '1999-12-05');
select * from persoane;

-------------------------------------------------------------------------------------------------------------------
#1. afistai toate datele pentru tara cu id-ul 4
select * from tara 
where id=4;

#2. afisati numele tarii care se afla pe Continentul Asia
select nume_tara from tara
where continent = "Asia";

#3. afisati tarile care au populatia mai mica de 50.000.000
select nume_tara as Tara, populatie_tara as populatie from tara
where populatie_tara<50000000;

#4. afisati nr total de tari care au suprafata mai mare de 300.000 km
select count(*) as nr_tari from tara
where suprafata_tara>300000;

#5. afisati numele complet al persoanelor nascute intre anii 1970 si 1990
select nume, prenume, data_nasterii from persoane
where data_nasterii between '1970-01-01' and '1990-01-01';
 

#6. afisati numele tarii si limba vorbita de fiecare tara in parte
select tara.nume_tara, limba.limba_tara
from tara inner join limba
on tara.idlimba=limba.id;

#7 afisati numele tarii, continentul si orasul de provenienta a persoanei care are numele de Marinescu 
select tara.nume_tara, continent, orase.nume_oras, persoane.nume
from tara inner join orase inner join persoane
on tara.idoras=orase.id and tara.idpers=persoane.id
where nume='Marinescu';




       


        
        
 
 
 
 