
<?php

require_once "include/queryUtil.php";

/**
 *  selectAllIUT
 *
 *  @return 2-dimensional array containing all stored IUT
 */

function selectAllIUT() {
    $q = 'select * from iut order by nomIut;';
    return query($q);
}

?>
