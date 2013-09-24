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
