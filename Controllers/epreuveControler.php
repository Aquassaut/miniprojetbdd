<?php

/**
 *  Epreuve CRUD operations interface. Requires queryUtils to fire queries.
 */

require_once('queryUtil.php');

/**
 *  Add a new epreuve to the database
 *  
 *  @param $intitule string : name of the new epreuve
 *  @return boolean : false if failure, true otherwise
 */

function addToEpreuve($intitule) {
    $q = 'insert into epreuve (intitule) values ("'.$intitule.'");';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Deletes am epreuve from the database
 *  
 *  @param $id number : id of the epreuve to delete
 *  @return boolean : false if failure, true otherwise
 */

function deleteEtu($id) {
    $q = 'delete from epreuve where numEpreuve = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes an epreuve intitule in the database
 *  
 *  @param $id number : id of the epreuve to rename
 *  @param $newIntitule : the epreuve new intitule
 *  @return boolean : false if failure, true otherwise
 */

function changeEpreuveIntitule($id, $newIntitule) {
    $q = 'update epreuve set intitule = "'.$newIntitule.'" where numEpreuve = '.$id.';';
        $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}