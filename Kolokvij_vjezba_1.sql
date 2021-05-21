drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;

create table sestra_svekar( 
	sifra int,
	sestra int,
	scekar int
);

create table svekar( 
	sifra int,
	bojaociju varchar(40),
	prstena int not null,
	dukserica varchar(41) not null,
	lipa decimal (12,7) not null,
	eura decimal (13,8) not null,
	majica varchar (35) not null
);

create table sestra(
	sifra int,
	introvetno bit not null,
	haljina varchar(31),
	maraka decimal (16.6) not null,
	hlace varchar(46),
	narukvica int
);

create table zena(
	treciputa datetime not null,
	hlace varchar(46) not null,
	kratkamajica varchar(31),
	jmbag char(11),
	bojaociju varchar(39),
	haljina varchar(44),
	sestra int
);

create table muskarac(
	sifra int,	
	bojaociju varchar(50),
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal (14,6),
	zena int
);

create table mladic(
	sifra int,
	suknja varchar(50);

);








