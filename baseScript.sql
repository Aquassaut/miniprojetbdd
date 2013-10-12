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
foreign key (noIut) references iut(noIut) on update cascade on delete cascade
);

create table etudiant (
noEtudiant int(5) not null auto_increment,
nom varchar(80),
age int(2),
sexe enum("M", "F"),
noIut int(5) not null,
primary key(noEtudiant),
foreign key (noIut) references iut(noIut) on update cascade on delete cascade
);

create table participe (
numMan int(5) not null,
numEpreuve int(5) not null,
noEtudiant int(5) not null,
resultat int(5),
primary key (numMan, numEpreuve, noEtudiant),
foreign key (numMan) references manifestation(numMan) on update cascade on delete cascade,
foreign key (numEpreuve) references epreuve(numEpreuve) on update cascade on delete cascade,
foreign key (noEtudiant) references etudiant(noEtudiant) on update cascade on delete cascade
);

create table contenu (
numMan int(5) not null,
numEpreuve int(5) not null,
primary key (numMan, numEpreuve),
foreign key (numMan) references manifestation(numMan) on update cascade on delete cascade,
foreign key (numEpreuve) references epreuve(numEpreuve) on update cascade on delete cascade
);

insert into iut (nomIut, adresse, nbEtudiants) values ("Blagnac", "1 PLACE GEORGES BRASSENS 31703 BLAGNAC CEDEX", "13972");
insert into iut (nomIut, adresse, nbEtudiants) values ("Thionville-Yutz", "IMPASSE ALFRED KASTLER 57970 YUTZ", "30952");
insert into iut (nomIut, adresse, nbEtudiants) values ("Epinal-Hubert Curien", "7 RUE DES FUSILLES RESIST 88010 EPINAL CEDEX", "38337");
insert into iut (nomIut, adresse, nbEtudiants) values ("Vannes", "8 RUE MONTAIGNE 56017 VANNES CEDEX", "18602");
insert into iut (nomIut, adresse, nbEtudiants) values ("Saint-Etienne", "28 AVENUE LEON JOUHAUX 42023 ST ETIENNE CEDEX 2", "35957");
insert into iut (nomIut, adresse, nbEtudiants) values ("Limousin", "ALLEE ANDRE MAUROIS 87065 LIMOGES CEDEX", "26807");
insert into iut (nomIut, adresse, nbEtudiants) values ("Cherbourg", "RUE MAX POL FOUCHET 50130 CHERBOURG OCTEVILLE", "11361");
insert into iut (nomIut, adresse, nbEtudiants) values ("Calais - Boulogne", "RUE LOUIS DAVID 62228 CALAIS CEDEX", "38292");
insert into iut (nomIut, adresse, nbEtudiants) values ("Nancy-Charlemagne", "2 TER BOULEVARD CHARLEMAGNE 54052 NANCY CEDEX", "20343");
insert into iut (nomIut, adresse, nbEtudiants) values ("Bobigny", "1 RUE DE CHABLIS 93000 BOBIGNY", "30558");
insert into iut (nomIut, adresse, nbEtudiants) values ("Nice", "41 BOULEVARD NAPOLEON III 06041 NICE CEDEX", "28047");
insert into iut (nomIut, adresse, nbEtudiants) values ("Haguenau", "30 RUE DU MAIRE ANDRE TRABAND 67500 HAGUENAU", "32743");
insert into iut (nomIut, adresse, nbEtudiants) values ("Bourges", "63 AVENUE DE LATTRE DE TASSIGNY 18020 BOURGES CEDEX", "30822");
insert into iut (nomIut, adresse, nbEtudiants) values ("Perpignan", "CHEMIN DE LA PASSIO VELLA 66962 PERPIGNAN CEDEX", "19490");
insert into iut (nomIut, adresse, nbEtudiants) values ("Sceaux", "8 AVENUE CAUCHY 92330 SCEAUX", "26666");
insert into epreuve (intitule) values ("Course De Vaisselle Du RU");
insert into epreuve (intitule) values ("Scrabble En Allemand");
insert into epreuve (intitule) values ("Course de Luge sur Gravier");
insert into epreuve (intitule) values ("Perl En Layout Dvorak");
insert into epreuve (intitule) values ("Ab'Dominos");
insert into epreuve (intitule) values ("Géométrie En Coca Light Et Mentos");
insert into epreuve (intitule) values ("Basket-ball en Caddie");
insert into epreuve (intitule) values ("Challenge Rubick's Cube");
insert into epreuve (intitule) values ("Enigmes Mathématiques");
insert into epreuve (intitule) values ("Gobage De Tic-Tacs");
insert into epreuve (intitule) values ("Golf De La Main Gauche");
insert into epreuve (intitule) values ("Match De Foot'Bulle De Savon");
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-01-10")), " ", 2013), date("2013-01-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-01-20")), " ", 2013), date("2013-01-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-02-01")), " ", 2013), date("2013-02-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-02-10")), " ", 2013), date("2013-02-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-02-20")), " ", 2013), date("2013-02-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-03-01")), " ", 2013), date("2013-03-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-03-10")), " ", 2013), date("2013-03-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-03-20")), " ", 2013), date("2013-03-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-04-01")), " ", 2013), date("2013-04-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-04-10")), " ", 2013), date("2013-04-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-04-20")), " ", 2013), date("2013-04-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-05-01")), " ", 2013), date("2013-05-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-05-10")), " ", 2013), date("2013-05-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-05-20")), " ", 2013), date("2013-05-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-06-01")), " ", 2013), date("2013-06-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-06-10")), " ", 2013), date("2013-06-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-06-20")), " ", 2013), date("2013-06-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-07-01")), " ", 2013), date("2013-07-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-07-10")), " ", 2013), date("2013-07-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-07-20")), " ", 2013), date("2013-07-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-08-01")), " ", 2013), date("2013-08-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-08-10")), " ", 2013), date("2013-08-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-08-20")), " ", 2013), date("2013-08-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-09-01")), " ", 2013), date("2013-09-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-09-10")), " ", 2013), date("2013-09-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-09-20")), " ", 2013), date("2013-09-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-10-01")), " ", 2013), date("2013-10-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-10-10")), " ", 2013), date("2013-10-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-10-20")), " ", 2013), date("2013-10-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-11-01")), " ", 2013), date("2013-11-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-11-10")), " ", 2013), date("2013-11-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-11-20")), " ", 2013), date("2013-11-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-12-01")), " ", 2013), date("2013-12-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-12-10")), " ", 2013), date("2013-12-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-12-20")), " ", 2013), date("2013-12-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2014-01-01")), " ", 2014), date("2014-01-01") from iut order by rand() limit 1;
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Cheick Ferrand" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Milena Marin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mickail Bonhomme" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Melyna Chauvin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Rizlane Dupre" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Valery Vidal" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Billel Besson" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Adélie Gras" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marc Girault" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ferreol Deschamps" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Guirec Charles" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nikola Giraud" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jeoffrey Charles" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yaacov Labbe" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-cecile Fernandez" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Farida Mimi" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Monica Courtois" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ashley Riviere" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ugur Aubry" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Abdessamad Labbe" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Luis Belle" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Priscilia Chartier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Rafik Lambert" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Firmin Rousseau" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Crystal Breton" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Margo Bataille" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hatem Jean" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hassane Huet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anita Besson" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Katie Bertrand" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Rania Fort" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Elliot Lecomte" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chanez Colas" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Koray Leconte" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Jacqueline Bouchet" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-pierre Duchemin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dragan Geoffroy" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Lionel Benard" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Peggy Hubert" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Armelle Salmon" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Celina Lelong" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Oktay Marin" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Amir Marchal" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Emmanuella Devaux" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Celina Humbert" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lucie Dupont" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierre-edouard Lafon" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Alphonse Levy" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Isaline Roland" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Julian Dubreuil" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sandrine Lesage" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lenaig Chauveau" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Conrad Navarro" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Julio Gosselin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Louan Chambon" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Abdoul Maillard" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-jacques Pasquier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ilyasse Merlin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Oceane Duval" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Cheikh Dumont" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Claudine Nguyen" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Leonore Petitjean" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Henri Wagner" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hatoumata Dupre" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Vivian Morvan" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gaël Bouchard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mariam Mahe" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nayel Fred" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Irene Rousseau" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Madjid Mathieu" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sherine Geoffroy" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Joël Simon" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Leonce Poncet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marco Lejeune" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Amaria Rocher" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Severine Gras" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Najwa Tellier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Kristina Poisson" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maureen Leroux" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Phoebe Brunel" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Oceana Chauvin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-josephe Lebrun" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Emilie Aline" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nahim Vallee" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Francesco Bonnet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Younes Poulain" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Emeline Carpentier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nelson Geoffroy" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maialen Boyer" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Joele Jacquot" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Agnes Thierry" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Joshua Parent" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laurena Rocher" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nacima Mercier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Thibaut Estelle" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Zaina Delage" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Shainez Laroche" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nisrine Legros" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Abdullah Brault" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Aloyse Garcia" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tiffanie Normand" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laetitia Nicolas" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-rose Herve" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Zakarya Gomez" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Beverly Guyon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Aymen Becker" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Wilhem Peltier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yahya Schmitt" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laurene Chatelain" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hilal Stephanie" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Flavia Poncet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sibylle Laval" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Gloria Guyot" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ilies Delahaye" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ugo Mahe" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Rodolphe Doucet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Manuel Vallee" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-philippe Pires" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laeticia Thiebaut" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Cyprien Renault" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Elyjah Dupont" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Loona Aubry" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ibtissam Etienne" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-paule Delage" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ornela Gerard" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Agathe Fouquet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yassin Sanchez" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hanane Renault" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Andreia Morvan" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sherley Marin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Harry Jean" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mylena Mary" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Thiebaut Fabre" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Foune Chapuis" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Franck Menard" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Najet Bouchet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-marc Collet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marty Bourdin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Scheherazade Lecomte" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Elvis Weber" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Eneko Wagner" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gildas Brunet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mason Roux" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ilan Clement" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marceline Guibert" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mody Olivier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hermine Santos" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nolane Mimi" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Elyas Gras" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sylvana Bousquet" , 27 from iut order by rand() limit 1);
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
