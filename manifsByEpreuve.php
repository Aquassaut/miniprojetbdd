<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/*
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


function selectAllManifs($numEpr)
{
    $q = 'select m.numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          inner join contenu c on m.numMan = c.numMan
          where numEpreuve = '.$numEpr.';';
    return query($q);
}


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


function testEpreuve($eprQuery)
{
    if (count($eprQuery) === 0) {
        pheader("Épreuve introuvable");
        echo('
                <div style="padding-top: 40px;">
                <center><h3>Aucune épreuve existante pour cet identifiant</h3></center>
                </div>
        ');
        return false;
    }

    return true;
}


function printManif($numEpr, $manif)
{
    $etudiants = selectAllEtuByEpreuve($numEpr, $manif[0]);
    echo('
                    <center><h3><a href="epreuveDetail.php?epr='.$numEpr.'&manif='.$manif[0].'" >'.$manif[1].'</a></h3>
                    <h4><b>IUT :</b> '.$manif[3].'<br>
                        <b>Date :</b> '.$manif[2].'</h4>
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


function printAllManifs($numEpr)
{
    $manifs = selectAllManifs($numEpr);

    echo('<center><div style="padding-top: 40px;><br>"');
    foreach($manifs as $manif)
        printManif($numEpr, $manif);
    echo('</div></center>');
}


if (isset($_GET['num']))
{
    $numEpr = $_GET['num'];
    $epreuveQuery = selectEpreuve($numEpr);

    if(testEpreuve($epreuveQuery))
    {
        $epreuve = $epreuveQuery[0];
        pheader($epreuve[1]);
        printAllManifs($numEpr);
    }
}

else
{
    pheader("Epreuve introuvable");
}

pfooter();

?>
