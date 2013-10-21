<?php

require_once "view/manifsByEpreuveView.php";
require_once "include/pageTemplate.php";


function testEpreuve($eprQuery)
{
    if (count($eprQuery) === 0) {
        pheader("Épreuve introuvable");
        echo('
                <div class="box error">Aucune épreuve existante pour cet identifiant</div>
        ');
        return false;
    }

    return true;
}


function printManif($numEpr, $manif)
{
    $etudiants = selectAllEtuByEpreuve($numEpr, $manif[0]);
    echo('
                    <div class="center">
                        <h3><a href="epreuveDetail.php?epr='.$numEpr.'&manif='.$manif[0].'" >'.$manif[1].'</a></h3>
                    </div>
                    <div class="box info">
                        A l\'IUT de '.$manif[3].' <br />
                        Le '.$manif[2].'
                    </div>
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
