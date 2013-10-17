<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

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


function testIut($iutQuery)
{
    if (count($iutQuery) === 0) {
        pheader("IUT introuvable");
        echo('
                <div style="padding-top: 40px;">
                <center><h3>Aucun IUT existant pour cet identifiant</h3></center>
                </div>
        ');
        return false;
    }

    return true;
}


function printResumeIut($iut)
{
    echo('
        <h3>Adresse '.$iut[2].'<br>
            Nombre d\'étudiants : '.$iut[3].'</h3>
    ');
}


function printAllEtudiants($numIut)
{
    $etudiants = selectAllEtu($numIut);
    echo('
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Age</th>
                                    <th>Sexe</th>
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
                                </tr>
             ');
    }

    else
    {
        foreach($etudiants as $etudiant)
        {
            echo('
                                    <tr>
                                        <td>'.$etudiant[1].'</td>
                                        <td>'.$etudiant[2].'</td>
                                        <td>'.$etudiant[3].'</td>
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


if (isset($_GET['num']))
{
    $noIut = $_GET['num'];
    $iutQuery = selectIut($noIut);

    if(testIut($iutQuery))
    {
        $iut = $iutQuery[0];
        pheader($iut[1]);
        printResumeIut($iut);
        printAllEtudiants($noIut);
    }
}

else
{
    pheader("Iut introuvable");
}

pfooter();

?>
