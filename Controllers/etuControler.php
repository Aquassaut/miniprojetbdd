<?php

/**
 *  Etudiant CRUD operations interface. Requires queryUtils to fire queries.
 */

require_once('queryUtil.php');

/**
 *  Add a new etudiant to the database
 *  
 *  @param $nom string : name of the new etudiant
 *  @param $age integer : age of the new etudiant
 *  @param $sexe enum ("M" or "F") : gender of the new etudiant
 *  @param $noIut number : id of the IUT the new etudiant goes to
 *  @return boolean : false if failure, true otherwise
 */


function addToEtu($nom, $age, $sexe, $noIut) {
    $q = 'insert into etudiant (nom, age, sexe, noIut) values';
    $q .=   '("'.$nom.'", '.$age.', "'.$sexe.'", '.$noIut.');';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Deletes a etudiant from the database
 *  
 *  @param $id number : id of the etudiant to delete
 *  @return boolean : false if failure, true otherwise
 */

function deleteEtu($id) {
    $q = 'delete from etudiant where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Change an etudiant in the database
 *  
 *  @param $id integer : id of the etudiant
 *  @param $nom string : new name of the etudiant
 *  @param $age integer : new age of the etudiant
 *  @param $sexe enum ("M" or "F") : new gender of the etudiant
 *  @param $noIut number : id of the IUT the etudiant goes to
 *  @return boolean : false if failure, true otherwise
 */


function changeEtu($id, $nom, $age, $sexe, $noIut) {
    $q = 'update etudiant set nom = "'.$nom.'", age = '.$age.', sexe = "'.$sexe.'", noIut = '.$noIut.' ';
    $q .= 'where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}


/**
 *  Change an etudiant in the database
 *  
 *  @param $id integer : id of the etudiant
 *  @param $nom string : new name of the etudiant
 *  @param $age integer : new age of the etudiant
 *  @param $sexe enum ("M" or "F") : new gender of the etudiant
 *  @param $noIut number : id of the IUT the etudiant goes to
 *  @return boolean : false if failure, true otherwise
 */


function changeEtuNameAgeSex($id, $nom, $age, $sexe) {
    $q = 'update etudiant set nom = "'.$nom.'", age = '.$age.', sexe = "'.$sexe.'" ';
    $q .= 'where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}
/**
 *  Changes a etudiant gender (very unlikely to be useful though) in the database
 *  
 *  @param $id number : id of the etudiant to operate on
 *  @return boolean : false if failure, true otherwise
 */


/**
 *  Changes a etudiant gender (very unlikely to be useful though) in the database
 *  
 *  @param $id number : id of the etudiant to operate on
 *  @return boolean : false if failure, true otherwise
 */

function changeEtuSexe($id) {
    $q = 'update etudiant set sexe = IF (sexe = "M", "F", "M") where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes a etudiant age in the database
 *  
 *  @param $id number : id of the etudiant to operate on
 *  @param $newAge : the etudiant's new age
 *  @return boolean : false if failure, true otherwise
 */

function changeEtuAge($id, $newAge) {
    $q = 'update etudiant set age = '.$newAge.' where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes a etudiant's IUT in the database
 *  
 *  @param $id number : id of the etudiant to operate on
 *  @param $newIut : the etudiant's new IUT
 *  @return boolean : false if failure, true otherwise
 */

function changeEtuIut($id, $newIut) {
    $q = 'update etudiant set noIut = '.$newIut.' where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

/**
 *  Changes a etudiant's name in the database
 *  
 *  @param $id number : id of the etudiant to operate on
 *  @param $newNom : the etudiant's new nom
 *  @return boolean : false if failure, true otherwise
 */


function changeEtuNom($id, $newNom) {
    $q = 'update etudiant set nom = '.$newNom.' where noEtudiant = '.$id.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}

?>
