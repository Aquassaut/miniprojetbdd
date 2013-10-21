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


/*
 * selectEpreuves
 *
 * Recherche les épreuves faisant partie de la manifestation
 * @param $numMan : identifiant de la manifestation
 * @return query($q)
 */

function selectAllEpreuves($numMan) {
    $q = 'select c.numEpreuve, intitule from contenu as c
          inner join epreuve e on c.numEpreuve = e.numEpreuve
          where numMan = '.$numMan.'
          order by intitule;';
    return query($q);
}


/*
 * selectRemainingEpreuves
 *
 * Recherche les épreuves ne faisant pas partie de la manifestation
 * @param $numMan : identifiant de la manifestation
 * @return query($q)
 */

function selectRemainingEpreuves($numMan) {
    $q =    'select numEpreuve, intitule 
            from epreuve
            where numEpreuve not in (
                select numEpreuve
                from contenu
                where numMan = '.$numMan.');';
    return query($q);
}

/* 
 * selectAllEtuByEpreuve
 *
 * Recherche les étudiants inscrits à une épreuve dans une manifestation
 * @param $numMan : identifiant de la manifestation
 * @param $numEpr : identifiant de l'épreuve
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
