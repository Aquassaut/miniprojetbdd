<?php

require_once "include/pageTemplate.php";
require_once "view/rechercheView.php";


/**
 * printSearchManif
 *
 * @param $string2search String to search in all "Manifestations" columns
 */

function printSearchManif($string2search)
{
    $manifs = searchInManif($string2search);
    echo('<h2>Manifestations</h2>');
    if (count($manifs) === 0) {
        echo('
                    <article class="ym-content">
                        <p>Aucune manifestation ne correspond à votre recherche.</p>
                    </article>
        ');
        return;
    }
    echo('
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
    ');
    foreach($manifs as $manif) {
        echo('
                                <tr>
                                    <td>'.$manif[1].'</td>
                                    <td>'.$manif[2].'</td>
                                    <td>'.$manif[3].'</td>
                                </tr>
        ');
    }
    echo('
                            </tbody>
                        </table>
                    </article>
    ');
}


/**
 * printSearchIUT
 *
 * @param $string2search String to search in all "IUT" columns
 */

function printSearchIUT($string2search)
{
    $iut = searchInIUT($string2search);
    echo('<h2>IUT</h2>');
    if (count($iut) === 0) {
        echo('
                    <article class="ym-content">
                        <p>Aucun IUT ne correspond à votre recherche.</p>
                    </article>
        ');
        return;
    }
    echo ('
                    <script src="include/scriptIUT.js"></script>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Adresse</th>
                                    <th>Nombre d\'étudiants</th>
                                </tr>
                            </thead>
                            <tbody>
    ');
    foreach( $iut as $activ)
    {
        echo('
                                <tr id="'.$activ[0].'">
                                    <td>'.$activ[1].'</td>
                                    <td>'.$activ[2].'</td>
                                    <td>'.$activ[3].'</td>
                                </tr>
        ');
    }
    echo ('
                            </tbody>
                        </table>
                    </article>
    ');

}


/**
 * printSearchEpreuves
 *
 * @param $string2search String to search in all "Epreuves" columns
 */

function printSearchEpreuves($string2search)
{
    $epreuves = searchInEpreuves($string2search);
    echo('<h2>Épreuves</h2>');
    if (count($epreuves) === 0) {
        echo('
                    <article class="ym-content">
                        <p>Aucune épreuve ne correspond à votre recherche.</p>
                    </article>
        ');
        return;
    }

    echo ('
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Intitulé</th>
                                </tr>
                            </thead>
                            <tbody>
    ');
    foreach( $epreuves as $activ)
    {
        echo('
                                <tr id="'.$activ[0].'">
                                    <td>'.$activ[1].'</td>
                                </tr>

        ');
    }
    echo ('
                            </tbody>
                        </table>
                    </article>
    ');
}


pheader("Recherche");
$string2search = "";
if (isset($_GET['recherche'])) {
    $string2search = $_GET['recherche'];
}
printSearchManif($string2search);
printSearchEpreuves($string2search);
printSearchIUT($string2search);
pfooter();

?>
