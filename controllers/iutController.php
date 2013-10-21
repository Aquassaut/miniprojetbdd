<?php

/**
 *  IUT CRUD operations interface. Requires queryUtils to fire queries.
 */

require_once('include/queryUtil.php');

/**
 *  Add a new IUT to the database
 *  
 *  @param $nom string : name of the new IUT
 *  @param $adresse integer : adress of the new iut
 *  @param $nbEtu number : Number of etudiants who attend classes in the IUT
 *  @return boolean : false if failure, true otherwise
 */


function addToIut($nom, $adresse, $nbEtu) {
    $q = 'insert into iut (nomIut, adresse, nbEtudiants) values ';
    $q .=   '("'.$nom.'", "'.$adresse.'", '.$nbEtu.');';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Deletes an IUT from the database
 *  
 *  @param $id number : id of the IUT to delete
 *  @return boolean : false if failure, true otherwise
 */

function deleteIut($id) {
    $q = 'delete from iut where noIut = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes all IUT fields in the database
 *  
 *  @param $id number : id of the iut to relocate
 *  @param $newNom : the IUT new address
 *  @param $newAdresse : the IUT new address
 *  @param $newCount : the IUT new address
 *  @return boolean : false if failure, true otherwise
 */

function changeIut($id, $newNom, $newAdresse, $newCount) {
    $q = 'update iut set nomIut = "'.$newNom.'", adresse = "'.$newAdresse.'", nbEtudiants = '.$newCount.' ';
    $q .='where noIut = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}


/**
 *  Changes an IUT name in the database
 *  
 *  @param $id number : id of the iut to relocate
 *  @param $newNom : the IUT new address
 *  @return boolean : false if failure, true otherwise
 */

function changeIutNom($id, $newNom) {
    $q = 'update iut set nomIut = "'.$newNom.'" where noIut = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes an IUT address in the database
 *  
 *  @param $id number : id of the iut to relocate
 *  @param $newAdresse : the IUT new address
 *  @return boolean : false if failure, true otherwise
 */

function changeIutAddresse($id, $newAdresse) {
    $q = 'update iut set adresse = "'.$newAdresse.'" where noIut = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes am IUT number of attending etudiant in the database
 *  
 *  @param $id number : id of the IUT to pupulate
 *  @param $newCount : the IUT new etudiant count
 *  @return boolean : false if failure, true otherwise
 */

function changeIutEtuCompte($id, $newCount) {
    $q = 'update iut set nbEtudiants = '.$newCount.' where noIut = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}
