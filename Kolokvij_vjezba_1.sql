drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;


create table sestra_svekar( 
	sifra int not null primary key auto_increment,
	sestra int,
	svekar int
);

create table svekar( 
	sifra int not null primary key auto_increment,
	bojaociju varchar(40),
	prstena int not null,
	dukserica varchar(41) not null,
	lipa decimal (12,7) not null,
	eura decimal (13,8) not null,
	majica varchar (35) not null
);

create table sestra(
	sifra int not null primary key auto_increment,
	introvetno bit not null,
	haljina varchar(31),
	maraka decimal (16.6) not null,
	hlace varchar(46),
	narukvica int
);

create table zena(
	sifra int not null primary key auto_increment,
	treciputa datetime not null,
	hlace varchar(46) not null,
	kratkamajica varchar(31),
	jmbag char(11),
	bojaociju varchar(39),
	haljina varchar(44),
	sestra int
);

create table muskarac(
	sifra int not null primary key auto_increment,
	bojaociju varchar(50),
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal (14,6),
	zena int
);

create table mladic(
	sifra int not null primary key auto_increment,
	suknja varchar(50),
	kuna decimal(16,8),
	drugiputa datetime not null,
	asocijalno bit not null,
	ekstroventno bit,
	dukserica varchar (48),
	muskarac int not null
);

create table punac(
	sifra int not null primary key auto_increment,
	ogrlica int not null,
	gustoca decimal (14,9) not null,
	hlace varchar (41)
);

create table cura(
	sifra int not null primary key auto_increment,
	novcica decimal(16,5),
	gustoca decimal(18,6),
	lipa decimal(13,10) not null,
	ogrlica int,
	bojakose varchar (38) not null,
	suknja varchar(36) not null,
	punac int not null
);


alter table sestra_svekar add foreign key (svekar) references svekar (sifra);





