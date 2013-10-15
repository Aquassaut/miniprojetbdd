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
    $q = 'select resultat, nom, age, sexe, nomIut from participe as p
          inner join etudiant etu on p.noEtudiant = etu.noEtudiant
          inner join iut on etu.noIut = iut.noIut
          where numEpreuve='.$numEpr.'
          and numMan = '.$numMan.'
          order by resultat;';
    return query($q);
}


function testManifestation($manifQuery)
{
    if (count($manifQuery) === 0) {
        pheader("Epreuve introuvable");
        echo('
                <div style="padding-top: 40px;">
                <center><h3>Aucune manifestation existante pour cet identifiant</h3></center>
                </div>
        ');
        return false;
    }

    return true;
}


function testEpreuve($epreuves)
{
    if (count($epreuves) === 0) {
        pheader("Epreuve introuvable");
        echo('
                <div style="padding-top: 40px;">
                <center><h3>Aucune épreuve existante pour cet identifiant</h3></center>
                </div>
        ');
        return false;
    }

    return true;
}


function printResumeManifestation($manif)
{
    echo('
        <h2>À la manifestation '.$manif[1].', le '.$manif[2].' à l\'IUT de '.$manif[3].'</h2>
    ');
}


function printEpreuve($numEpr, $numManif)
{
    $etudiants = selectAllEtudiants($numEpr, $numManif);
    echo('
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


if (isset($_GET['manif']) && isset($_GET['epr']))
{
    $numEpr = $_GET['epr'];
    $numMan = $_GET['manif'];
    $manifQuery = selectManifestation($numMan);
    $epreuveQuery = selectEpreuve($numEpr);

    if(testManifestation($manifQuery) && testEpreuve($epreuveQuery))
    {
        $manif = $manifQuery[0];
        $epreuve = $epreuveQuery[0];
        pheader($epreuve[1]);
        printResumeManifestation($manif);
        printEpreuve($numEpr, $numMan);
    }
}

else
{
    pheader("Manifestation introuvable");
}

pfooter();

?>
