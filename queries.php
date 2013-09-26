<?php


/**
 *  Query processing function
 *  @param $query String containing the query to send to the server
 *  @return 2-dimensional array, or simple array, depending on the query, FALSE in case of error (must be tested with === )
 */

function query($query) {
    $bdd = mysqli_connect('aquassaut.pwnz.org','proje','tbdd','projet');
    $result = mysqli_query($bdd, $query);
    if ($result === true || $result === false) {
        return $result;
    }
    return mysqli_fetch_all($result);
}


/* TODO : déplacer tout ça dans la vue */

/**
 *  Requête #1.
 *
 *  @return 2-dimensional array containing all stored epreuves
 */

function selectAllEpreuves() {
    $q = 'select intitule from epreuve;';
    return query($q);
}

/**
 *  Requête #2.
 *
 *  @return 2-dimensional array containing all stored etudiants
 */

function selectAllEtudiants() {
    $q = 'select nom, age, sexe, nomIut from etudiant as e inner join iut as
          i on e.noIut = i.noIut;';
    return query($q);
}

/**
 *  Requête #3.
 *
 *  Bon, ici j'ai pas les données encore je peux pas trop les tester et
 *  j'ai la flemme d'en créer ce soir (il est tard et je veux avancer).
 *  Dans l'idée, on a envie de vérifier la date comme des fils de putes
 *  (surtout le 31 février parce que le prof teste toujours ça en premier)
 *  et aussi pas avoir de souci de format parce que sinon ça va être la merde.
 *
 *  @param $date the date after which we want the manifestations list
 *  @return 2-dimensional array containing all stored manifestations after $date
 */

function selectAllManifestationsAfter($date) {
    //TODO : Vérifier la date
    $q = 'select nomMan, dateMan, nomIut from manifestation as m
          inner join iut as i on m.noIut = i.noIut
          where dateMan > date(\''.$date.'\');';
    return query($q);
}

/**
 *  Requête #4.
 *
 *  Bah voilà, ici, on s'en branle de l'iut de Belfort, ce qu'on veut
 *  c'est afficher le nombre étudiants d'une IUT arbitraire.
 *
 *  Aussi, comme je vois le truc, dans la base on a la liste des
 *  étudiants qui participent aux manifestations, pas la liste de TOUS
 *  les étudiants des IUTs, c'est pour ça que je fais pas un count
 *  mais que je récupère juste la colonne dans la table iut
 *
 *  @param $IUTid the primary key of the iut table we want the etudiant count of
 *  @return number of etudiants in the iut, or FALSE if $IUTid doesn't exist in the database
 */

function selectNbEtudiantsByIut($IUTid) {
    //TODO : Vérifier que le nombre est safe avant le traitement
    $q = 'select nbEtudiants from iut ';
    $q .=   'where noIut = '.$IUTid.';';
    return query($q);
}

/**
 *  Requête #5.
 *
 *  Même remarque que pour le 4
 *
 *  @param $IUTid the primary key of the iut table we want the etudiant list of
 *  @return 2-dimensional array containing all etudiants in the iut, or FALSE if $IUTid doesn't exist in the database
 */


function selectAllEtudiantsByIut($IUTid) {
    //TODO : Vérifier que le nombre est safe avant le traitement
    $q = 'select noEtudiant, nom, age, sexe from etudiant ';
    $q .=   'where noIut = '.$IUTid.';';
    return query($q);
}

/**
 *  Requête #6
 *
 *  Liste des étudiants ayant le même age que toto
 *
 *  @param $totoid : Toto's noEtudiant
 *  @return 2-dimensional array containing all etudiants that have the same age as toto
 */

function selectEtudiantBySameAgeAs($totoid) {
    $q = 'select noEtudiant, nom, sexe from etudiant ';
    $q .=   'where age = (select age from etudiant ';
    $q .=       'where noEtudiant = '. $totoid .');';
    return query($q);
}

/**
 *  Requête #7
 *  
 *  Nombre d'épreuve par manifestation
 *
 *  @return 2 dimensional array containing all manifestations fields plus the count of associated epreuves
 */

function selectCountEpreuves() {
    $q = 'select M.numMan, nomMan, count(numEpreuve) as cEpreuves ';
    $q .=   'from contenu as C ';
    $q .=       'inner join manifestation as M on M.numMan = C.numMan ';
    $q .=   'group by M.numMan;';
    return query($q);
}

/**
 *  Requête #8
 *
 *  Nombre d'étudiants par IUT qui ont participé a une manifestation
 *
 *  @return 2 dimensional array containing the number and name of all IUTs that have student who participated in epreuves and the amount thereof
 */

function selectCountEtudiantsByManifestation() {
    $q = 'select i.noIut, nomIut, count(distinct p.noEtudiant) ';
    $q .=   'from etudiant as e ';
    $q .=       'inner join participe as p on e.noEtudiant = p.noEtudiant ';
    $q .=           'inner join iut as i on e.noIut = i.noIut ';
    $q .=   'group by i.noIut;';
    return query($q);
}


/**
 *  Requête #9
 *
 *  Liste des manifestations auxquelles Toto a participé
 *
 *  @param  $totoid ; Toto's noEtudiant
 *  @return 2 dimensional array containing manifestations toto participated in
 */

function selectManifestationByTotosParticipation($totoid) {
    $q = 'select m.numMan, m.nomMan from participe as p ';
    $q .=   'inner join manifestation as m on p.numMan = m.numMan ';
    $q .=       'inner join etudiant as e on e.noEtudiant = p.noEtudiant ';
    $q .=   'where p.noEtudiant = '.$totoid.';';
    return query($q);
}


?>
