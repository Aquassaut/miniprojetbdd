<?php

/**
 *  Query processing function
 *  @param $query String containing the query to send to the server
 *  @return 2-dimensional array, or simple array, depending on the query, FALSE in case of error (must be tested with === )
 */

function query($query) {
    $bdd = mysqli_connect('aquassaut.pwnz.org','proje','tbdd','projet');
    $result = mysqli_query($bdd, $query);
    if ($result === true || $result === false) {
        return $result;
    }
    //Mise en array a deux dimmensions
    $array_sultat = [];
    $compteur = 0;
    while($row = $result->fetch_row()) {
        $array_sultat[$compteur] = $row;
        $compteur += 1;
    }   
    return $array_sultat;
}

?>
