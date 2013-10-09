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

insert into iut (nomIut, adresse, nbEtudiants) values ("Villetaneuse", "AVENUE JEAN BAPTISTE CLEMENT 93430 VILLETANEUSE", "21042");
insert into iut (nomIut, adresse, nbEtudiants) values ("l'Aisne", "2 RUE PIERRE CURIE 02000 LAON", "9589");
insert into iut (nomIut, adresse, nbEtudiants) values ("Angoulême", "4 AVENUE DE VARSOVIE 16021 ANGOULEME CEDEX", "27173");
insert into iut (nomIut, adresse, nbEtudiants) values ("Bayonne", "2 ALLEE DU PARC MONTAURY 64600 ANGLET", "25812");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lille-II", "ROND-POINT DE L'EUROPE 59060 ROUBAIX CEDEX 01", "22948");
insert into iut (nomIut, adresse, nbEtudiants) values ("Saint-Brieuc", "18 RUE HENRI WALLON 22015 ST BRIEUC CEDEX", "32574");
insert into iut (nomIut, adresse, nbEtudiants) values ("Rodez", "33 AVENUE DU 8 MAI 1945 12006 RODEZ CEDEX", "25111");
insert into iut (nomIut, adresse, nbEtudiants) values ("Béziers", "Béziers BP 50438 34505 BEZIERS cedex", "22874");
insert into iut (nomIut, adresse, nbEtudiants) values ("Chalon-sur-Saône", "1 ALLEE DES GRANGES FORESTIERS 71100 CHALON SUR SAONE", "33792");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lille-I", "CITE SCIENTIFIQUE 59653 VILLENEUVE D'ASCQ CEDEX", "37901");
insert into iut (nomIut, adresse, nbEtudiants) values ("Grenoble-I", "151 RUE DE LA PAPETERIE 38402 ST MARTIN D HERES CEDEX", "27054");
insert into iut (nomIut, adresse, nbEtudiants) values ("Saint-Dié-des-Vosges", "11 RUE DE L'UNIVERSITE 88100 ST DIE", "28789");
insert into iut (nomIut, adresse, nbEtudiants) values ("Corte", "QUARTIER GRIMALDI 20250 CORTE", "25828");
insert into iut (nomIut, adresse, nbEtudiants) values ("Toulon", "AVENUE DE L'UNIVERSITE 83957 LA GARDE CEDEX", "22269");
insert into iut (nomIut, adresse, nbEtudiants) values ("Roanne", "20 AVENUE DE PARIS 42334 ROANNE CEDEX", "19707");
insert into epreuve (intitule) values ("Course De Vaisselle Du RU");
insert into epreuve (intitule) values ("Géométrie En Coca Light Et Mentos");
insert into epreuve (intitule) values ("Basket-ball en Caddie");
insert into epreuve (intitule) values ("Course de Luge sur Gravier");
insert into epreuve (intitule) values ("Golf De La Main Gauche");
insert into epreuve (intitule) values ("Gobage De Tic-Tacs");
insert into epreuve (intitule) values ("Ab'Dominos");
insert into epreuve (intitule) values ("Enigmes Mathématiques");
insert into epreuve (intitule) values ("Scrabble En Allemand");
insert into epreuve (intitule) values ("Challenge Rubick's Cube");
insert into epreuve (intitule) values ("Perl En Layout Dvorak");
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
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Frederik Delaunay" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Johny Claude" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ramzi Morvan" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cassidy Bernard" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Eytan Grand" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hans Mathieu" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nazim Voisin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jacquie Giraud" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mirabelle Bouvet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Amin Chartier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Kathleen Martin" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Lorenzo Maillot" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ihab Dubois" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alisson Benoist" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chaimae Thierry" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Anas Delmas" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dia Serre" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jeannot Guillon" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Gwenola Blanchard" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Chakib Simon" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maider Fischer" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Fatna Camus" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Dorian Rocher" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Stecie Rossi" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Frédéric Lagarde" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Floriane Berthier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Didier Peltier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lillia Mahe" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tulay Leroy" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Justine Lefebvre" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Thiebault Gomez" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aleth Bousquet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anick Mercier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Octavio Payet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mohamed-lamine Alain" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yasine Girard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Adil Guilbert" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Rosemonde Ruiz" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Luce Allard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mady Lopes" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Scotty Blondel" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lauryne Maillet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Brad Hubert" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierryck Chretien" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Katleen Perrin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gautier Courtois" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Louen Aline" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierre-etienne Lucie" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Sauveur Adam" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ranya Pineau" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maelenn Jourdan" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Emelie Joubert" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Yoel Blondel" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maewenn Boulay" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ameline Pruvost" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lore Legrand" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Judicael Husson" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jovan Allain" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Domitille Delannoy" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lana Vallet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Stanley Smith" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Joséphine Lagarde" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hadi Perrin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Elif Santos" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Salem Ribeiro" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tulay Vallee" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bryan Masse" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Emilien Bonnet" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Meissa Sauvage" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Assya Meunier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anitha Martins" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Steeve Muriel" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Victoria Chauveau" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Elaia Benoit" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Damien Antoine" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Estitxu Maillet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Florient Lacour" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Kardiatou Blondeau" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Elyas Louis" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marlene Stephan" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Amina Blondel" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Celia Delannoy" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alberte Menard" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mathilda Marechal" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Edward Castel" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Nadia Marin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ephraim Lavigne" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Djason Duchemin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bogdan Blanchard" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mareva Delaunay" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Christina Mallet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Toufik Hernandez" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Stéphane Menard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Amel Walter" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Gloria Renault" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lisandra Marechal" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jacob Chauvin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Monika Evrard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Sullyvan Martins" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bérenger Texier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-caroline Bertrand" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Abdelhalim Dufour" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Madisson Lefort" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ossama Courtois" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Xuan Humbert" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Allain Pichon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Colombe Rousset" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Fabian Monique" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Xuan Rossignol" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ghais Perrier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alia Lemaire" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Valentina Bertrand" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alizea Mohamed" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Milica Gaudin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Morgann Royer" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Filipe Blanchet" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Danae Rousset" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hayet Vasseur" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-marcel Valette" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Denys Leblanc" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Fadila Bertrand" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Okan Alexandre" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Zinedine Huet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Isaline Durant" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marise Charbonnier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Xuan Granger" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Paul-henri Dias" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Christian Bataille" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ari Guibert" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Gwenaëlle Moulin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Karima Schmidt" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maiana Albert" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierryck Aline" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mélie Pottier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Fodie Rodriguez" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bilel Dupuy" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sevgi Santos" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alicia Laborde" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Armony Mace" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Armande Leroux" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aurore Buisson" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "François-xavier Mace" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Vasile Lambert" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Meryem Gilles" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mason Jacob" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Davia Poirier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aliya Breton" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Timothee Mary" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sana Delorme" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Foulemata Simon" , 27 from iut order by rand() limit 1);
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
