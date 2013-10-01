<?php

/**
 *  Manifestation CRUD operations interface. Requires queryUtils to fire queries.
 */

require_once('queryUtil.php');

/**
 *  Add a new manifestation to the database
 *  
 *  @param $nom string : name of the new manifestation
 *  @param $date date : date of the new manifestation 
 *  @param $noIut number : id of the IUT where the new manifestation will take place
 *  @return boolean : false if failure, true otherwise
 */


function addToManif($nom, $date, $noIut) {
    $q = 'insert into manifestation (nomMan, dateMan, noIut) values';
    $q .=   '("'.$nom.'", date("'.$date.'"), "'.$noIut.');';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Deletes a manifestation from the database
 *  
 *  @param $id number : id of the manifestation to delete
 *  @return boolean : false if failure, true otherwise
 */

function deleteManif($id) {
    $q = 'delete from manifestation where numMan = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes a manifestation name in the database
 *  
 *  @param $id number : id of the manifestation to rename
 *  @param $newName string : manifestation new name  
 *  @return boolean : false if failure, true otherwise
 */

function changeManNom($id, $newName) {
    $q = 'update manifestation set nomMan = "'.$newName.'"  where numMan = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes a manifestation date in the database
 *  
 *  @param $id number : id of the manifestation to operate on
 *  @param $newDate date : the manifestation new age
 *  @return boolean : false if failure, true otherwise
 */

function changeManDate($id, $newDate) {
    $q = 'update manifestation set dateMan = date("'.$newDate.'") where numMan = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes a manifestation's organizing IUT in the database
 *  
 *  @param $id number : id of the manifestation to modify
 *  @param $newIut number : the manifestation's new IUT
 *  @return boolean : false if failure, true otherwise
 */

function changeManIut($id, $newIut) {
    $q = 'update manifestation set noIut = '.$newIut.' where numMan = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}
