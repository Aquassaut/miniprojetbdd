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

insert into iut (nomIut, adresse, nbEtudiants) values ("Blois", "3 PLACE JEAN JAURES CS 2903 41029 BLOIS CEDEX", "15593");
insert into iut (nomIut, adresse, nbEtudiants) values ("Nice", "41 BOULEVARD NAPOLEON III 06041 NICE CEDEX", "19336");
insert into iut (nomIut, adresse, nbEtudiants) values ("Chartres", "1 PLACE PIERRE MENDES FRANCE 28000 CHARTRES", "30583");
insert into iut (nomIut, adresse, nbEtudiants) values ("Limousin", "ALLEE ANDRE MAUROIS 87065 LIMOGES CEDEX", "10512");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lannion", "RUE EDOUARD BRANLY 22302 LANNION CEDEX", "24173");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lens", "7 RUE DE L'UNIVERSITE 62307 LENS CEDEX", "32275");
insert into iut (nomIut, adresse, nbEtudiants) values ("La Rochelle", "15 RUE F DE VAUX DE FOLETIER 17026 LA ROCHELLE CEDEX 1", "30131");
insert into iut (nomIut, adresse, nbEtudiants) values ("Tremblay-en-France", "RUE DE LA RAPERIE 93290 TREMBLAY EN FRANCE", "34721");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lille-III", "35 RUE SAINTE BARBE 59208 TOURCOING CEDEX", "33232");
insert into iut (nomIut, adresse, nbEtudiants) values ("Grenoble-I", "151 RUE DE LA PAPETERIE 38402 ST MARTIN D HERES CEDEX", "32284");
insert into iut (nomIut, adresse, nbEtudiants) values ("Evreux", "55 RUE SAINT GERMAIN 27000 EVREUX", "28274");
insert into iut (nomIut, adresse, nbEtudiants) values ("Blagnac", "1 PLACE GEORGES BRASSENS 31703 BLAGNAC CEDEX", "29332");
insert into iut (nomIut, adresse, nbEtudiants) values ("Mulhouse", "61 RUE ALBERT CAMUS 68093 MULHOUSE CEDEX", "24568");
insert into iut (nomIut, adresse, nbEtudiants) values ("Lyon-I", "1 RUE DE LA TECHNOLOGIE 69622 VILLEURBANNE CEDEX", "12969");
insert into iut (nomIut, adresse, nbEtudiants) values ("Nancy-Charlemagne", "2 TER BOULEVARD CHARLEMAGNE 54052 NANCY CEDEX", "28644");
insert into epreuve (intitule) values ("Course de Luge sur Gravier");
insert into epreuve (intitule) values ("Course De Vaisselle Du RU");
insert into epreuve (intitule) values ("Géométrie En Coca Light Et Mentos");
insert into epreuve (intitule) values ("Challenge Rubick's Cube");
insert into epreuve (intitule) values ("Golf De La Main Gauche");
insert into epreuve (intitule) values ("Perl En Layout Dvorak");
insert into epreuve (intitule) values ("Ab'Dominos");
insert into epreuve (intitule) values ("Enigmes Mathématiques");
insert into epreuve (intitule) values ("Scrabble En Allemand");
insert into epreuve (intitule) values ("Basket-ball en Caddie");
insert into epreuve (intitule) values ("Gobage De Tic-Tacs");
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
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Sylviane Lemaire" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Hawa Marechal" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Riyad Marechal" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Sezer Fortin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Cyndy Potier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ugo Delahaye" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mayeul Lebrun" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Maverick Lamy" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Amor Cornu" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bradley Chauveau" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Liam Fournier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marty Brun" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mahmoud Roland" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Béatrice Buisson" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Randy Gerard" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anabelle Hebert" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Houari Gautier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Laurent Lafon" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jonathan Blanchet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marwane Vallet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Kadidia Bocquet" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Petru Bertin" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maude Duhamel" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Abigaël Bernier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alizée Camus" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Mickail Bousquet" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gorka Barbier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Laetizia Prevost" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Louen Devaux" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nolhan Mallet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ibtissem Lafon" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dado Perrin" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jaufre Godard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Lubin Levy" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marjorie Comte" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Johanna Grand" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Kyle Chauveau" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chainez Allard" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Franck Lavigne" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Bénédicte Lelievre" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Sebastian Andrieu" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lydie Ricard" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maissa Valentin" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Harold Collet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Willem Thiebaut" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Lenny Rossi" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Loreen Hebert" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tulay Marchal" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Eray Levy" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Robin Guibert" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Emilio Marchand" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Adriane Durand" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Margot Clerc" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lauriane Bertin" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Marcus Cohen" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Amy Philippe" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-chantal Rossi" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jean-antoine Lebon" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Giuseppe Gros" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Meggy Lemaitre" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ferdinand Foucher" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dorine Lacour" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierric Hernandez" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-camille Grenier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Chaimaa Adam" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gatien Chapuis" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Saskia Besse" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Valeriane Lelong" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Louane Dupuy" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Oceanne Dumoulin" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Gaylord Dupuis" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Illyes Blanc" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Silvain Schmidt" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Oceana Brault" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Liliane Andrieu" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Audric Sauvage" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Blandine Elisabeth" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Hafid Adam" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Joao-Luca Perrot" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Johanne Prevost" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Messaouda Pichon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-luce Morvan" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maryne Pottier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Badre Verdier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Brandy Petit" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Joe Gomez" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Idriss Marques" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Kenzi Rousset" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Moriba Buisson" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nethanel Hubert" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nassim Brault" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Kimberley Walter" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Camila Payet" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marie-louise Dupont" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Rached Lebon" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Alhassane Bailly" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Priscille Delmas" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Haris Levy" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Matthias Couturier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Elarif Bernier" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Edgard Rodriguez" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Azilis Colin" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Francisco Etienne" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tessa Ollivier" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Kerrian Neveu" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anne-claire Rousseau" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ines Thomas" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Wail Besson" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Ikrame Perrier" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Aimée Royer" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Montaine Labbe" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Ilane Sabine" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Milan Geoffroy" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "El Delage" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lehna Deschamps" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Bamba Pichon" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mallaury Seguin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Alec Guillaume" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Juan Leger" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Virgile Laurent" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Youna Bataille" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Suleyman Charpentier" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lena Guillou" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Massimo Prat" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Alice Verdier" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Nourdine Bouvet" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Lisa-marie Lelong" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Dalla Marin" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Houssine Alexandre" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Georges Pons" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anne-charlotte Herve" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Yasmeen Sanchez" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Maika Maire" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Mailis Collin" , 18 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Shauna Grandjean" , 26 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Tanya Vidal" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Samanta Lacoste" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Iker Pages" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Trystan Carpentier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anne-cecile Meunier" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Naim Lamy" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Felicia Lavigne" , 19 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Timothe Guillon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Pierre-luc Rossi" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Said Martineau" , 22 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Achraf Bourdon" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Meziane Jacob" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "M" , "Jordi Diallo" , 23 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Anne-sophie Laval" , 27 from iut order by rand() limit 1);
insert into etudiant (noIut, sexe, nom, age) (select noIut , "F" , "Marnie Boutin" , 26 from iut order by rand() limit 1);
insert into participe (numMan, numEpreuve, noEtudiant, resultat) select distinct numMan, numEpreuve, noEtudiant, round(100 * rand()) from manifestation, epreuve, etudiant order by rand() limit 2000 ;
insert into contenu (numMan, numepreuve) select distinct numMan, numEpreuve from participe;
