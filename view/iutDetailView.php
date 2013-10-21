<?php

require_once "include/queryUtil.php";

/*
 * selectIut
 *
 * Retourne l'IUT correspondant à l'identifiant envoyé
 * @param $noIut : identifiant de l'Iut
 * @return query($q)
 */

function selectIut($noIut) {
    $q = 'select noIut, nomIut, adresse, nbEtudiants from iut
          where noIut = '.$noIut.';';
    return query($q);
}


/*
 * selectAllEtu
 *
 * Recherche les étudiants inscrit à l'iut demandé
 * @param $numIut : identifiant de l'iut
 * @return query($q)
 */

function selectAllEtu($noIut) {
    $q = 'select noEtudiant, nom, age, sexe from etudiant
          where noIut = '.$noIut.'
          order by nom;';
    return query($q);
}

?>
