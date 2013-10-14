<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/*
 * selectManifestations
 *
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


function printManifestation($manif) {
    echo('
                    <h3>Test</h3>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Date</th>
                                    <th>Nom de l\'IUT</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="'.$manif[0].'">
                                    <td><a href="manifDetail.php?num='.$manif[0].'" >'.$manif[1].'</a></td>
                                    <td>'.$manif[2].'</td>
                                    <td>'.$manif[3].'</td>
                                </tr>
                            </tbody>
                        </table>
                    </article>
    ');
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
        printManifestation($manif);
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
