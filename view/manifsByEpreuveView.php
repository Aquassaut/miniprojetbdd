<?php

require_once "include/queryUtil.php";

/**
 * selectEpreuve
 *
 * Retourne l'épreuve correspondant à l'identifiant envoyé
 * @param $numEpr : identifiant de l'épreuve
 * @return query($q)
 */

function selectEpreuve($numEpr) {
    $q = 'select numEpreuve, intitule from epreuve
          where numEpreuve = '.$numEpr.';';
    return query($q);
}

/**
 * selectAllManifs
 *
 * retourne toutes les manifestations proposant l'épreuve donnée
 * @param $numEpr : identifiant de l'épreuve
 * @return query($q)
 */

function selectAllManifs($numEpr)
{
    $q = 'select m.numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          inner join contenu c on m.numMan = c.numMan
          where numEpreuve = '.$numEpr.'
          order by dateMan desc;';
    return query($q);
}

/**
 * selectAllEtuByEpreuve
 *
 * retourne tous les étudiants participant à une épreuve d'une manifestation
 * @param $numEpr : identifiant de l'épreuve
 * @param $numMan : identifiant de la manifestation
 * @return query($q)
 */

function selectAllEtuByEpreuve($numEpr, $numMan)
{
    $q = 'select resultat, nom, age, sexe, nomIut from participe as p
          inner join etudiant etu on p.noEtudiant = etu.noEtudiant
          inner join iut on etu.noIut = iut.noIut
          where numEpreuve='.$numEpr.'
          and numMan = '.$numMan.'
          order by resultat desc
          limit 3;';
    return query($q);
}

?>
