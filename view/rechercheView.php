<?php

require_once "include/queryUtil.php";

/**
 * searchInManif
 *
 * @param $string2search String to search in all "Manifestations" columns
 * @return query
 */

function searchInManif($string2search)
{
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          where nomMan like "%'.$string2search.'%"
          or dateMan like "%'.$string2search.'%"
          or nomIUT like "%'.$string2search.'%";';
    return query($q);
}


/**
 * searchInEpreuves
 *
 * @param $string2search String to search in all "Epreuves" columns
 * @return query
 */

function searchInEpreuves($string2search) {
    $q = 'select * from epreuve
        where intitule like "%'.$string2search.'%"
        order by intitule;';
    return query($q);
}


/**
 * searchInIUT
 *
 * @param $string2search String to search in all "IUT" columns
 * @return query
 */

function searchInIUT($string2search) {
    $q = 'select * from iut
        where nomIut like "%'.$string2search.'%"
        or adresse like "%'.$string2search.'%"
        or nbEtudiants like "%'.$string2search.'%"
        order by nomIut;';
    return query($q);
}

?>
