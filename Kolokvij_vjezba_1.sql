drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;


create table sestra_svekar( 
	sifra int not null primary key auto_increment,
	sestra int not null,
	svekar int not null
);

create table svekar( 
	sifra int not null primary key auto_increment,
	bojaociju varchar(40)not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal (12,7),
	eura decimal (13,8),
	majica varchar (35)
);

create table sestra(
	sifra int not null primary key auto_increment,
	introvetno bit,
	haljina varchar(31) not null,
	maraka decimal (16.6),
	hlace varchar(46) not null,
	narukvica int not null
);

create table zena(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null
);

create table muskarac(
	sifra int not null primary key auto_increment,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal (14,6) not null,
	zena int not null
);

create table mladic(
	sifra int not null primary key auto_increment,
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstroventno bit,
	dukserica varchar (48) not null,
	muskarac int
);

create table punac(
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal (14,9),
	hlace varchar (41) not null
);

create table cura(
	sifra int not null primary key auto_increment,
	novcica decimal(16,5 )not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar (38),
	suknja varchar(36),
	punac int
);


alter table sestra_svekar add foreign key (svekar) references svekar (sifra);
alter table sestra_svekar add foreign key (sestra) references sestra (sifra);
alter table zena add foreign key (sestra) references sestra (sifra);
alter table muskarac add foreign key (zena) references zena (sifra);
alter table mladic add foreign key (muskarac) references muskarac (sifra);
alter table cura add foreign key (punac) references punac (sifra);

#1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka.

select * from sestra;

insert into sestra (haljina,maraka,hlace,narukvica) values
('crna',11111.2222,'plava',1),
('plava',115.3234,'crna',2),
('crna',2121.1,'crvena',3);

delete from sestra where sifra > 3 ;

select * from zena;

insert into zena (kratkamajica,jmbag,bojaociju,sestra) values
('crna',12345678910,'bijela',1),
('plava',12345678911,'plava',2),
('??uta',12345678912,'crna',3);

select * from muskarac;

insert into muskarac (bojaociju, hlace, modelnaocala,maraka,zena) values
('sme??a','plave','crulle',12345,1),
('zelena','sme??e','ray-ban',23415,2),
('crvene','??ute','persol',88888,3);

#2. U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77.

insert into punac(hlace) values
('kratke'),('duge'),('prevelike');

insert into cura (novcica,gustoca,ogrlica,punac) values
(1234,1020,2,1),(1234,1030,2,1),(1234,10120,2,1);

select * from cura; 
update cura set gustoca = 15.77 where novcica = 1234;

#3. U tablici mladic obri??ite sve zapise ??ija je vrijednost kolone kuna ve??e od 15,78. (4)

delete from mladic where kuna<15.78;


#4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadr??e slova ana. (6)

select kratkamajica from zena where hlace='%ana%';

#5. Prika??ite dukserica iz tablice svekar, asocijalno iz tablice mladic te hlace iz tablice muskarac 
#uz uvjet da su vrijednosti kolone hlace iz tablice zena po??inju slovom a
#te da su vrijednosti kolone haljina iz tablice sestra sadr??e niz znakova ba. 
#Podatke poslo??ite po hlace iz tablice muskarac silazno. (10)


select f.dukserica, a.asocijalno, b.hlace
from mladic a 
inner join muskarac b on a.muskarac = b.sifra
inner join zena c on b.zena = c.sifra 
inner join sestra d on c.sestra = d.sifra
inner join sestra_svekar e on d.sifra = e.sestra 
inner join svekar f on e.svekar = f.sifra 
where c.hlace like 'a%' or d.haljina like '%ba%'
order by b.hlace desc;

