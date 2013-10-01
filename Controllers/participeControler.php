<?php

/**
 *  participation CRUD operations interface. Requires queryUtils to fire queries.
 */

require_once('queryUtil.php');

/**
 *  Add a new partitipation to the database
 *  
 *  @param $idMan integer : Manifestation id
 *  @param $idEpreuve integer : Epreuve id
 *  @param $idEtu integer : Etudiant id
 *  @param $resultat integer : Result of the etudiant on this epreuve in this manifestation
 *  @return boolean : false if failure, true otherwise
 */

function addToParticipe($idMan, $idEpreuve, $idEtu, $resultat) {
    $q = 'insert into participe (numMan, numEpreuve, noEtudiant, resultat) values ';
    $q .=   '('.$idMan.', '.$idEpreuve.', '.$idEtu.', '.$resultat.');';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Deletes a participation from the database
 *  
 *  @param $idMan integer : Manifestation id
 *  @param $idEpreuve integer : Epreuve id
 *  @param $idEtu integer : Etudiant id
 *  @return boolean : false if failure, true otherwise
 */

function deleteParticipe($idMan, $idEpreuve, $idEtu) {
    $q = 'delete from participe where ';
    $q .=   'idMan = '.$numMan.', numEpreuve = '.$idEpreuve.', noEtudiant = '.$idEtu.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Deletes a participation from the database
 *  
 *  @param $idMan integer : Manifestation id
 *  @param $idEpreuve integer : Epreuve id
 *  @param $idEtu integer : Etudiant id
 *  @param $newResultat integer : Updated resultat
 *  @return boolean : false if failure, true otherwise
 */

function changePartResult($idMan, $idEpreuve, $idEtu, $newResultat) {
    $q = 'update participe set resultat = '.$newResultat.' where ';    
    $q .=   'idMan = '.$numMan.', numEpreuve = '.$idEpreuve.', noEtudiant = '.$idEtu.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}
