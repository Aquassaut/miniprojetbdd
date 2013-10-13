<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/**
 * searchInManif
 *
 * @param $string2search String to search in all "Manifestations" columns
 * @return query
 */

function searchInManif($string2search)
{
    //TODO : Vérifier la date
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          where nomMan like "%'.$string2search.'%"
          or dateMan like "%'.$string2search.'%"
          or nomIUT like "%'.$string2search.'%";';
    return query($q);
}


/**
 * searchInEpreuves
 *
 * @param $string2search String to search in all "Epreuves" columns
 * @return query
 */

function searchInEpreuves($string2search) {
    $q = 'select * from epreuve
        where intitule like "%'.$string2search.'%"
        order by intitule;';
    return query($q);
}


/**
 * searchInIUT
 *
 * @param $string2search String to search in all "IUT" columns
 * @return query
 */

function searchInIUT($string2search) {
    $q = 'select * from iut
        where nomIut like "%'.$string2search.'%"
        or adresse like "%'.$string2search.'%"
        or nbEtudiants like "%'.$string2search.'%"
        order by nomIut;';
    return query($q);
}


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
                    <script src="scriptIUT.js"></script>
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
