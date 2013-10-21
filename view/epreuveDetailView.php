<?php

require_once "include/queryUtil.php";

/*
 * selectManifestations
 *
 * Retourne la manifestation correspondant à l'identifiant envoyé
 * @param $numMan : identifiant de la manifestation
 * @return query($q)
 */

function selectManifestation($numMan) {
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          where numMan = '.$numMan.';';
    return query($q);
}

function selectAllEtu() {
    $q = 'select noEtudiant, noIut, nom from etudiant order by nom';
    return query($q);
}
function selectAllIUT() {
    $q = 'select noIut, nomIut from iut order by nomIut;';
    return query($q);
}

/*
 * selectEpreuves
 *
 * Recherche les épreuves faisant partie de la manifestation
 * @param $numMan : identifiant de la manifestation
 * @param $numEpr : identifiant de l'épreuve
 * @return query($q)
 */

function selectEpreuve($numEpr) {
    $q = 'select numEpreuve, intitule from epreuve
          where numEpreuve = '.$numEpr.'
          order by intitule;';
    return query($q);
}


function selectAllEtudiants($numEpr, $numMan)
{
    $q = 'select etu.noEtudiant, nomIut, nom, resultat
	  from participe as p
          inner join etudiant etu on p.noEtudiant = etu.noEtudiant
          inner join iut on etu.noIut = iut.noIut
          where numEpreuve='.$numEpr.'
          and numMan = '.$numMan.'
          order by resultat desc;';
    return query($q);
}

?>
