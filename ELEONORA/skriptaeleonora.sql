-- ova datoteka se nalazi na:
-- mysql -ucuturam -p --default_character_set=utf8 < C:\Users\CuturaM\Documents\GitHub\EDUNOVA\ELEONORA\skriptaeleonora.sql

drop database if exists eleonora;
create database eleonora default character set utf8;
use eleonora;



create table korisnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
lozinka int (4) not null,
oib char(11) not null,
email varchar(50) not null,
administrator boolean not null
);



create table artikl(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
zaliha decimal(18,3) not null,
prodajnacijena decimal(18,2) not null,
nabavnacijena decimal(18,2) not null,
normativ decimal (18,3) not null,
kategorija varchar(50) not null,
skladiste varchar(50) not null,
slika varchar(999) not null
);



create table narudzba(
sifra int not null primary key auto_increment,
artikl int not null,
racun int not null,
kolicina decimal(18,3), 
popust decimal(18,2)
);



create table racun(
sifra int not null primary key auto_increment,
vrijeme datetime default now(),
zki varchar(32),
jir varchar(32),
korisnik int not null,
iznos decimal(18,2) not null,
kupac int,
nacinplacanja varchar(50),
pdv int not null,
blagajna varchar(50) not null
);



create table kupac(
sifra int not null primary key auto_increment,
naziv varchar(100) not null,
oib char(11) not null,
iban varchar(32),
grad varchar(50) not null,
ulica varchar(50) not null,
drzava varchar(50) not null
);



create table pdv (
sifra int not null primary key auto_increment,
stopapdv decimal(18,2) not null
);



alter table narudzba add foreign key (artikl) references artikl(sifra);
alter table narudzba add foreign key (racun) references racun(sifra);

alter table racun add foreign key (korisnik) references korisnik(sifra);
alter table racun add foreign key (pdv) references pdv(sifra);
alter table racun add foreign key (kupac) references kupac(sifra);



/* Ubacivanje podataka u bazu */

insert into artikl
(naziv,zaliha,prodajnacijena,nabavnacijena,normativ,kategorija,skladiste,slika) values
/* 1 */
('ESPRESSO',5.000,8.00,0.89,0.007,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=1a-H6zom5oyedSN7Teu3At8t2W3UFj_74'),
/* 2 */
('KAVA S MLIJEKOM',0.000,9.00,0.89,0.007,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=1b8RGnadP3jk6wSWAWgm94wcGwQD_0vEa'),
/* 3 */
('KAVA MLIJEKO PRODUŽENA',0.000,10.00,0.89,0.007,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=11y7DiSGXSvv5cRHGpRr9xF4FSswMJnk2'),
/* 4 */
('CAPPUCCINO',0.000,10.00,0.89,0.007,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=1wkobzO4NXots4FvDXeJmmC4eQQiO67p4'),
/* 5 */
('BIJELA KAVA',0.000,12.00,0.89,0.007,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=1kKi1HzkitR6IcsubHr7igkvjUP8sZ5VB'),
/* 6*/
('NESCAFE',250.000,12.00,1.37,1.000,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=1ldfwjRPD-gqTse3NZ6lvZ9byyaOwsniX'),
/* 7 */
('ČAJ',400.000,10.00,0.40,1.000,'TOPLI NAPITCI','ŠANK1','https://drive.google.com/open?id=1ldfwjRPD-gqTse3NZ6lvZ9byyaOwsniX'),
/* 8 */
('COCA COLA 0.25L',240.000,15.00,3.09,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=15vY9Xn-_PXikAzKeVFcrIWwuYrYN5BeG'),
/* 9 */
('FANTA 0.25L',240.000,15.00,3.09,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1zQP5JnwCbUo9sTgM7OLLlUJ4Dyp2AsN-'),
/* 10 */
('SPRITE 0.25L',240.000,15.00,3.09,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1C6M7rIXE-_WHDmkW1F7TxVMFHuSKjv-l'),
/* 11 */
('SCHWEPPES 0.25L',240.000,15.00,3.20,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1grQiwBmWRgEAQW09L7a2GS9jgyu2j7BM'),
/* 12 */
('PRIRODNI SOK CAPPY 0.20L',200.000,15.00,3.50,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1a8BVXogDk2dQQnXlfK8JlTenLlNxs62J'),
/* 13 */
('LEDENI ČAJ 0.20L',240.000,15.00,2.30,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1mWwYs-avXsl35AD6sKFSMG0malsL3x3Z'),
/* 14 */
('ORANGINA 0.25L',240.000,16.00,4.39,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1jQilEO4pQdYuRzXc0TcpXgXZ9DkFt1xW'),
/* 15 */
('CEDEVITA',400.000,11.00,2.11,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1lwu5fu4Y4Qju9S4jT0-MhOpFes6lOxe6'),
/* 16 */
('COCKTA 0.25L',200.000,15.00,2.79,1.000,'SOKOVI','ŠANK1','https://drive.google.com/open?id=1WXphZ8FDe1omP7ab_c2DS-UnPbqUjOmW');
/* 17 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */

/* 10 */
