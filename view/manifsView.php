<?php

require_once "include/queryUtil.php";

/**
 *  Requête #3.
 *
 *  @param $date the date after which we want the manifestations list
 *  @return 2-dimensional array containing all stored manifestations after $date
 */

function selectAllManifestationsAfter($date) {
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut, m.noIUT
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          where dateMan > date("'.$date.'")
          order by dateMan desc;';
    return query($q);
}


function selectAllManifestationsInMonth($date) {
    $arrayDate = explode("-", $date);
    $m = $arrayDate[1];
    $y = $arrayDate[0];
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut, m.noIut
          from manifestation as m
          inner join iut as i on m.noIut = i.noIut
          where month(dateMan) = '.$m.' and year(dateMan) = '.$y.'
          order by dateMan desc;';
    return query($q);
}

function selectIUTLabelAndId() {
    $q = 'select noIut, nomIut from iut order by nomIut;';
    return query($q);
}

?>
