<?php

require_once "include/queryUtil.php";

/**
 *  selectAllEpreuves
 *
 *  @return 2-dimensional array containing all stored epreuves
 */

function selectAllEpreuves() {
    $q = 'select * from epreuve order by intitule;';
    return query($q);
}


?>
