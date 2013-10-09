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

insert into iut (nomIut, adresse, nbEtudiants) values ("Tremblay-en-France", "RUE DE LA RAPERIE 93290 TREMBLAY EN FRANCE", "30062");
insert into iut (nomIut, adresse, nbEtudiants) values ("Grenoble-II", "2 PLACE DOYEN GOSSE 38031 GRENOBLE CEDEX", "18672");
insert into iut (nomIut, adresse, nbEtudiants) values ("l'Aisne", "2 RUE PIERRE CURIE 02000 LAON", "36945");
insert into iut (nomIut, adresse, nbEtudiants) values ("Dijon", "BOULEVARD DOCTEUR PETIJEAN 21078 DIJON CEDEX", "24523");
insert into iut (nomIut, adresse, nbEtudiants) values ("Angoulême", "4 AVENUE DE VARSOVIE 16021 ANGOULEME CEDEX", "21366");
insert into iut (nomIut, adresse, nbEtudiants) values ("Saint-Omer - Dunkerque", "AVENUE DESCARTES 62968 LONGUENESSE CEDEX", "32686");
insert into iut (nomIut, adresse, nbEtudiants) values ("Rennes", "3 RUE DU CLOS COURTEL 35014 RENNES CEDEX 7", "17579");
insert into iut (nomIut, adresse, nbEtudiants) values ("Nancy-Charlemagne", "2 TER BOULEVARD CHARLEMAGNE 54052 NANCY CEDEX", "20425");
insert into iut (nomIut, adresse, nbEtudiants) values ("Béziers", "Béziers BP 50438 34505 BEZIERS cedex", "19953");
insert into iut (nomIut, adresse, nbEtudiants) values ("Montreuil", "140 RUE DE LA NOUVELLE FRANCE 93100 MONTREUIL", "33094");
insert into iut (nomIut, adresse, nbEtudiants) values ("Metz", "ILE DU SAULCY 57045 METZ CEDEX 1", "26831");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lille-II", "ROND-POINT DE L'EUROPE 59060 ROUBAIX CEDEX 01", "9268");
insert into iut (nomIut, adresse, nbEtudiants) values ("Epinal-Hubert Curien", "7 RUE DES FUSILLES RESIST 88010 EPINAL CEDEX", "33888");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lens", "7 RUE DE L'UNIVERSITE 62307 LENS CEDEX", "25530");
insert into iut (nomIut, adresse, nbEtudiants) values ("Béziers", "Béziers BP 50438 34505 BEZIERS cedex", "23150");
insert into epreuve (intitule) values ("Perl En Layout Dvorak");
insert into epreuve (intitule) values ("Géométrie En Coca Light Et Mentos");
insert into epreuve (intitule) values ("Basket-ball en Caddie");
insert into epreuve (intitule) values ("Course de Luge sur Gravier");
insert into epreuve (intitule) values ("Course De Vaisselle Du RU");
insert into epreuve (intitule) values ("Scrabble En Allemand");
insert into epreuve (intitule) values ("Golf De La Main Gauche");
insert into epreuve (intitule) values ("Ab'Dominos");
insert into epreuve (intitule) values ("Gobage De Tic-Tacs");
insert into epreuve (intitule) values ("Enigmes Mathématiques");
insert into epreuve (intitule) values ("Challenge Rubick's Cube");
insert into epreuve (intitule) values ("Match De Foot'Bulle De Savon");
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-01-10")), " ", 2012), date("2012-01-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-01-20")), " ", 2012), date("2012-01-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-02-01")), " ", 2012), date("2012-02-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-02-10")), " ", 2012), date("2012-02-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-02-20")), " ", 2012), date("2012-02-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-03-01")), " ", 2012), date("2012-03-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-03-10")), " ", 2012), date("2012-03-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-03-20")), " ", 2012), date("2012-03-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-04-01")), " ", 2012), date("2012-04-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-04-10")), " ", 2012), date("2012-04-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-04-20")), " ", 2012), date("2012-04-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-05-01")), " ", 2012), date("2012-05-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-05-10")), " ", 2012), date("2012-05-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-05-20")), " ", 2012), date("2012-05-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-06-01")), " ", 2012), date("2012-06-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-06-10")), " ", 2012), date("2012-06-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-06-20")), " ", 2012), date("2012-06-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-07-01")), " ", 2012), date("2012-07-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-07-10")), " ", 2012), date("2012-07-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-07-20")), " ", 2012), date("2012-07-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-08-01")), " ", 2012), date("2012-08-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-08-10")), " ", 2012), date("2012-08-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-08-20")), " ", 2012), date("2012-08-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-09-01")), " ", 2012), date("2012-09-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-09-10")), " ", 2012), date("2012-09-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-09-20")), " ", 2012), date("2012-09-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-10-01")), " ", 2012), date("2012-10-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-10-10")), " ", 2012), date("2012-10-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-10-20")), " ", 2012), date("2012-10-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-11-01")), " ", 2012), date("2012-11-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-11-10")), " ", 2012), date("2012-11-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-11-20")), " ", 2012), date("2012-11-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-12-01")), " ", 2012), date("2012-12-01") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-12-10")), " ", 2012), date("2012-12-10") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2012-12-20")), " ", 2012), date("2012-12-20") from iut order by rand() limit 1;
insert into manifestation (noIut, nomMan, dateMan) select noIut, concat(nomIut, " ", monthname(date("2013-01-01")), " ", 2013), date("2013-01-01") from iut order by rand() limit 1;
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mouad Mohamed" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Yvelise Morvan" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Paul-marie Gautier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Alric Mace" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-odile Vallet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Saida Raynaud" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Efflam Bertin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nais Menard" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-paul Fort" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hakan Caron" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Haby Benoit" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tuba Leblanc" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Anice Guichard" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mallaurie Masse" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bertrand Barbe" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Monia Dupre" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yehouda Billard" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-aimée Tessier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Wiem Regnier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chayma Boucher" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Joanie Claude" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Malek Blondeau" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laeticia Cordier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chaimae Bouvier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Faouzi Lucas" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Colette Wagner" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Tugay Vallee" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ihab Marin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-anne Bouquet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Elsa Pelletier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alma Mace" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Barthélemy Moulin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Erik Lefort" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laurina Neveu" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lorea Lambert" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Emilie Laroche" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maiana Benard" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Sebastian Brault" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Arthus Thierry" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Khadija Serre" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hermine Auger" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Fatna Marques" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Guylene Girault" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Annaëlle Dias" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Naia Doucet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Niakale Robert" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Frederick Aline" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Leeroy Chretien" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Patrice Pages" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gaylor Delannoy" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chaimaa Bernard" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Vianney Royer" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Calogero Hamon" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Flavy Millet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Driss Colin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Virgil Raynaud" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mariana Cohen" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Solveig Pages" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Fredy Guillaume" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alma Granger" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ilker Poisson" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dan David" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Zeinab Colin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Flora Robert" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Oscar Combes" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Noël Bazin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Jeromine Lejeune" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Azzedine Georges" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Matteu Lamy" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Aris Grenier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Madeline Descamps" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Quang Etienne" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mohamed-ali Neveu" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Etienne Masson" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Oren Pelletier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Fallon Peltier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Steffie Perrot" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Flavien Charrier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Matilde Lemaire" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nidal Husson" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Eray Husson" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anna-maria Raynaud" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nessim Etienne" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jamal Granger" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ilana Sanchez" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Meghan Gonzalez" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Wallerand Brunet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Edouard Smith" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Azdine Dumont" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "William Salmon" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Jeanine Comte" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Fethi Guillaume" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Angeline Pasquier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierre-nicolas Marchand" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Antonella Dupond" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Messaouda Pelletier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Berenice Simon" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Tou Estelle" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nisrine Breton" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nassim Labbe" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yoann Masse" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Virginie Laporte" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Valentina Favre" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lena Guillot" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Constance Baudry" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hatouma Bailly" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alisone Weber" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nadim Francoise" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Indra Louis" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Christa Pires" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Houssem Cohen" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-sara Humbert" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dilara Courtois" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Armelle Tran" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bobby Poisson" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ferhat Bouvet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ayse Bouvier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dalla Lambert" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Kader Barbier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Colyne Jamet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Filip Michel" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dora Fort" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-guy Bernier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Faustin Agnes" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Fodil Cros" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Cyrus Lemoine" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Farida Guillon" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Souad Maury" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-marcel Lefebvre" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maite Martins" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Florianne Grandjean" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Brieg Menard" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anne-laure Hamel" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Vianney Mathieu" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Désiré Laine" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-briac Hoffmann" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Souhila Besse" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Naomie Lejeune" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Iban Mimi" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cheryne Estelle" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aubane Ribeiro" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Argitxu Lebrun" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chirel Pinto" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dean Laurent" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lory Huet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yasser Lelievre" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-claude Elisabeth" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Micheline Gaudin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aicha Pages" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Luna Hamel" , 18 from iut order by rand() limit 1);
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
