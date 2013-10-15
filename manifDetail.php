<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

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


function selectAllEtuByEpreuve($numEpr, $numMan)
{
    $q = 'select resultat, nom, age, sexe, nomIut from participe as p
          inner join etudiant etu on p.noEtudiant = etu.noEtudiant
          inner join iut on etu.noIut = iut.noIut
          where numEpreuve='.$numEpr.'
          and numMan = '.$numMan.'
          order by resultat
          limit 3;';
    return query($q);
}


function testManifestation($manifQuery)
{
    if (count($manifQuery) === 0) {
        echo('
                    <article class="ym-g80 ym-gr ym-content">
                        <p>Aucune manifestation existante pour cet identifiant</p>
                    </article>
        ');
        return false;
    }

    return true;
}


function printResumeManifestation($manif)
{
    echo('
        <h2>Le '.$manif[2].' à l\'IUT de '.$manif[3].'</h2>
    ');
}


function printEpreuve($epreuve, $numManif)
{
    $etudiants = selectAllEtuByEpreuve($epreuve[0], $numManif);
    echo('
                    <center><h3>'.$epreuve[1].'</h3></center>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Résultat</th>
                                    <th>Nom</th>
                                    <th>Age</th>
                                    <th>Sexe</th>
                                    <th>IUT</th>
                                </tr>
                            </thead>
                            <tbody>
        ');

    if (count($etudiants) === 0)
    {
        echo('
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
             ');
    }

    else
    {
        foreach($etudiants as $etudiant)
        {
            echo('
                                    <tr>
                                        <td>'.$etudiant[0].'</td>
                                        <td>'.$etudiant[1].'</td>
                                        <td>'.$etudiant[2].'</td>
                                        <td>'.$etudiant[3].'</td>
                                        <td>'.$etudiant[4].'</td>
                                    </tr>
                 ');
        }
    }

    echo('
                            </tbody>
                        </table>
                    </article>
         ');
}


function printAllEpreuves($manif)
{
    $epreuves = selectAllEpreuves($manif[0]);

    echo('<center><div style="padding-top: 40px;><br>"');
    foreach($epreuves as $epreuve)
        printEpreuve($epreuve, $manif[0]);
    echo('</div></center>');
}


if (isset($_GET['num']))
{
    $numMan = $_GET['num'];
    $manifQuery = selectManifestation($numMan);

    if(testManifestation($manifQuery))
    {
        $manif = $manifQuery[0];
        pheader($manif[1]);
        printResumeManifestation($manif);
        printAllEpreuves($manif);
    }
    else
    {
        pheader("Manifestation introuvable");
    }
}

else
{
    pheader("Manifestation introuvable");
}

pfooter();

?>
