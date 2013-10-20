<?php

/**
 *  Contenu CRUD operations interface. Requires queryUtils to fire queries.
 */

require_once('queryUtil.php');

/**
 *  Add a new epreuve to a manifestation
 *
 *  @param $numMan number : the manifestation ID
 *  @param $numEpreuve number : the epreuve ID
 *  @return boolean : false if failure, true otherwise
 */

function addToContenu ($numEpreuve, $numMan) {
    $q = 'insert into contenu (numEpreuve, numMan) values ';
    $q .=' ('.$numEpreuve.', '.$numMan.');';
    $res = query($q);
    if ($res === false) {
        echo ('<h2>'.$q.'</h2>');
        return $res;
    }
    return true;
}

/**
 *  deletes an epreuve from a manifestation
 *
 *  @param $numMan number : the manifestation ID
 *  @param $numEpreuve number : the epreuve ID
 *  @return boolean : false if failure, true otherwise
 */

function removeFromContenu ($numEpreuve, $numMan) {
    $q = 'delete from contenu ';
    $q .='where numEpreuve = '.$numEpreuve.' and numMan = '.$numMan.';';
    $res = query($q);
    if ($res === false) {
        return $res;
    }
    return true;
}