drop table if exists contenu;
drop table if exists participe;
drop table if exists etudiant;
drop table if exists manifestation;
drop table if exists epreuve;
drop table if exists iut;
create table iut (
noIut int(5) not null auto_increment,
nomIut varchar(80),
adresse varchar(80),
nbEtudiants int(5),
primary key (noIut)
);

create table epreuve (
numEpreuve int(5) not null auto_increment,
intitule varchar(80),
primary key(numEpreuve)
);

create table manifestation (
numMan int(5) not null auto_increment,
nomMan varchar(80),
dateMan date,
noIut int(5) not null,
primary key (numMan),
foreign key (noIut) references iut(noIut)
);

create table etudiant (
noEtudiant int(5) not null auto_increment,
nom varchar(80),
age int(2),
sexe enum("M", "F"),
noIut int(5) not null,
primary key(noEtudiant),
foreign key (noIut) references iut(noIut)
);

create table participe (
numMan int(5) not null,
numEpreuve int(5) not null,
noEtudiant int(5) not null,
resultat int(5),
primary key (numMan, numEpreuve, noEtudiant),
foreign key (numMan) references manifestation(numMan),
foreign key (numEpreuve) references epreuve(numEpreuve),
foreign key (noEtudiant) references etudiant(noEtudiant)
);

create table contenu (
numMan int(5) not null,
numEpreuve int(5) not null,
primary key (numMan, numEpreuve),
foreign key (numMan) references manifestation(numMan),
foreign key (numEpreuve) references epreuve(numEpreuve)
);

insert into iut (nomIut, adresse, nbEtudiants) values ("Bordeaux-I", "15 RUE NAUDET 33175 GRADIGNAN CEDEX", "22922");
insert into iut (nomIut, adresse, nbEtudiants) values ("Bayonne", "2 ALLEE DU PARC MONTAURY 64600 ANGLET", "20484");
insert into iut (nomIut, adresse, nbEtudiants) values ("Cherbourg", "RUE MAX POL FOUCHET 50130 CHERBOURG OCTEVILLE", "38558");
insert into iut (nomIut, adresse, nbEtudiants) values ("Bourges", "63 AVENUE DE LATTRE DE TASSIGNY 18020 BOURGES CEDEX", "38558");
insert into iut (nomIut, adresse, nbEtudiants) values ("Saint-Denis", "PLACE DU 8 MAI 1945 93206 ST DENIS CEDEX", "20472");
insert into iut (nomIut, adresse, nbEtudiants) values ("Chambéry", "DOMAINE SCIENTIFIQUE DU BOURGET-DU-LAC 73376 LE BOURGET DU LAC CEDEX", "28489");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lille-III", "35 RUE SAINTE BARBE 59208 TOURCOING CEDEX", "12812");
insert into iut (nomIut, adresse, nbEtudiants) values ("Besançon", "30 AVENUE DE L' OBSERVATOIRE 25009 BESANCON CEDEX", "15563");
insert into iut (nomIut, adresse, nbEtudiants) values ("Le Mans", "AVENUE OLIVIER MESSIAEN 72085 LE MANS CEDEX 9", "10295");
insert into iut (nomIut, adresse, nbEtudiants) values ("Saint-Dié-des-Vosges", "11 RUE DE L'UNIVERSITE 88100 ST DIE", "24471");
insert into iut (nomIut, adresse, nbEtudiants) values ("Dijon", "BOULEVARD DOCTEUR PETIJEAN 21078 DIJON CEDEX", "33870");
insert into iut (nomIut, adresse, nbEtudiants) values ("Troyes", "9 RUE DE QUEBEC 10026 TROYES CEDEX", "25790");
insert into iut (nomIut, adresse, nbEtudiants) values ("Orsay", "PLATEAU DE MOULON 91400 ORSAY", "24052");
insert into iut (nomIut, adresse, nbEtudiants) values ("Metz", "ILE DU SAULCY 57045 METZ CEDEX 1", "17084");
insert into iut (nomIut, adresse, nbEtudiants) values ("Vélizy", "10 AVENUE DE L'EUROPE 78129 VELIZY VILLACOUBLAY", "34702");
insert into epreuve (intitule) values ("Course De Vaisselle Du RU");
insert into epreuve (intitule) values ("Course de Luge sur Gravier");
insert into epreuve (intitule) values ("Enigmes Mathématiques");
insert into epreuve (intitule) values ("Géométrie En Coca Light Et Mentos");
insert into epreuve (intitule) values ("Perl En Layout Dvorak");
insert into epreuve (intitule) values ("Basket-ball en Caddie");
insert into epreuve (intitule) values ("Scrabble En Allemand");
insert into epreuve (intitule) values ("Challenge Rubick's Cube");
insert into epreuve (intitule) values ("Ab'Dominos");
insert into epreuve (intitule) values ("Gobage De Tic-Tacs");
insert into epreuve (intitule) values ("Golf De La Main Gauche");
insert into epreuve (intitule) values ("Match De Foot'Bulle De Savon");
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-01-10)), 2012), date(2012-01-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-01-20)), 2012), date(2012-01-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-02-01)), 2012), date(2012-02-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-02-10)), 2012), date(2012-02-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-02-20)), 2012), date(2012-02-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-03-01)), 2012), date(2012-03-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-03-10)), 2012), date(2012-03-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-03-20)), 2012), date(2012-03-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-04-01)), 2012), date(2012-04-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-04-10)), 2012), date(2012-04-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-04-20)), 2012), date(2012-04-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-05-01)), 2012), date(2012-05-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-05-10)), 2012), date(2012-05-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-05-20)), 2012), date(2012-05-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-06-01)), 2012), date(2012-06-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-06-10)), 2012), date(2012-06-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-06-20)), 2012), date(2012-06-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-07-01)), 2012), date(2012-07-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-07-10)), 2012), date(2012-07-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-07-20)), 2012), date(2012-07-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-08-01)), 2012), date(2012-08-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-08-10)), 2012), date(2012-08-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-08-20)), 2012), date(2012-08-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-09-01)), 2012), date(2012-09-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-09-10)), 2012), date(2012-09-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-09-20)), 2012), date(2012-09-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-10-01)), 2012), date(2012-10-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-10-10)), 2012), date(2012-10-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-10-20)), 2012), date(2012-10-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-11-01)), 2012), date(2012-11-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-11-10)), 2012), date(2012-11-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-11-20)), 2012), date(2012-11-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-12-01)), 2012), date(2012-12-01) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-12-10)), 2012), date(2012-12-10) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2012-12-20)), 2012), date(2012-12-20) from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, monthname(date(2013-13-01)), 2013), date(2013-13-01) from iut order by rand() limit 1;
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maëlle Valentin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Naomie Guillemin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Curtis Sabine" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marjane Vial" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "John Lopez" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dino Garnier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Amaria Hamel" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Victorine Roux" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Luca Coulon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Bahar Gaillard" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ali Perrot" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mélie Pelletier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jimmy Devaux" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Iliasse Vaillant" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hadi Bataille" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Laurin Clerc" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ramon Barbe" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Santiago Chartier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Rayhan Mimi" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mattis Bertrand" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Wesley Dumoulin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Gulcan Rousset" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierre-antoine Besse" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ali Coulon" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-chantal Brunet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nassim Ferreira" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Eileen Lacoste" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Anas Becker" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cylia Raymond" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dia Giraud" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Galaad Dupont" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sephora Berthier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yvon Rodrigues" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Najat Melanie" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Divine Rousseau" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cyntia Cohen" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nabil Picard" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chiara Prevost" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Aboubakary Fischer" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-christian Laval" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Khaled Riviere" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yonathan Loiseau" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Esra Roland" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Bérangère Claude" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ufuk Boulay" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cécile Benoit" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Samuel Barbe" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Abdelmalik Humbert" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ruddy Masson" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jonas Verdier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alyzée Boyer" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bayram Cousin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Fadi Prat" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Norbert Bouvet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Alpha Cros" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Naila Bailly" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Arie Parmentier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Guenaelle Hubert" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Seny Simon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Sammy Perrier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Abdullah Lopes" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Rejane Martel" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Howard Blondeau" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Elona Grenier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cyrielle Marechal" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-charlotte Camus" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Garance Bernier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Rubens Perrin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Bianca Nicolas" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marin Fournier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Arthus Delorme" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Samanta Schmitt" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Gaëlle Blanchet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Joana Poulain" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Kentin Dupuy" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ida Pasquier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Felicite Charrier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierre-emmanuel Camus" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Baudoin Gros" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Annelise Hardy" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Molly Ferreira" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maela Grandjean" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hadidja Collet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yanisse Mace" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Moche Masson" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Guillaume Pages" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Eugene Grand" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Isaie Thibault" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Christie Lemoine" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Styven Robert" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bob Combes" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Meghan Laval" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Silvia Bocquet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Émile Brault" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Emeric Poncet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mouhamadou Marchal" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mickael Merlin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nabila Regnier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marc Marchand" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Eliane Verdier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Jehanne Boutin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jahid Benoist" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jordan Lopez" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Stéphane Lecomte" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Kenny Michaud" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Valerian Fouquet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dounia Moreau" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Driss Chapuis" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Farah Dupre" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Soufian Mace" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Keziah Carre" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laurette Guibert" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nahia Evrard" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Judikael Cros" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Lohan Potier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yehouda Dupon" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hakima Perrin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Annaick Neveu" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cansel Arnaud" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Milos Robin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Valerie Michel" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Claudius Favre" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Veysel Collin" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aleyna Robert" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Noëlle Arnaud" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Wael Sanchez" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anouk Duchemin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Lenaic Payet" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Seta Lemaitre" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nawael Michel" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Elfriede Robin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Eztitxu Dupond" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Brice Blot" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Wilfried Alain" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Melody Moulin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Aly Boulay" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Myrtille Carpentier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mia Jamet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sezen Arnaud" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Badre Delattre" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Oona Lebrun" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yani Langlois" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anastasia Delahaye" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Yasmin Roland" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hyacinthe Baudry" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Even Gregory" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Loucif Couturier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gautier Bazin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Rayane Roques" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Keziah Pujol" , 27 from iut order by rand() limit 1);
insert into participe (numMan, numEpreuve, noEtudiant) select distinct numMan, numEpreuve, noEtudiant from manifestation, epreuve, etudiant order by rand() limit 2000 ;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
update participe p, (select *, count(u.noEtudiant) as cpt from participe u where u.resultat is NULL group by u.numMan, u.numEpreuve) t set p.resultat = cpt where p.resultat is NULL and p.numMan = t.numMan and p.numEpreuve = t.numEpreuve and p.noEtudiant = t.noEtudiant;
insert into contenu (numMan, numepreuve) select distinct numMan, numEpreuve from participe;
