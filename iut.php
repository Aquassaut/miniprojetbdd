<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/**
 *  selectAllIUT
 *
 *  @return 2-dimensional array containing all stored IUT
 */

function selectAllIUT() {
    $q = 'select * from iut;';
    return query($q);
}


/**
 * printAllIUT
 *
 * Print the IUT database
 */

function printAllIUT()
{
    $array = selectAllIUT();

    echo ('
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
    foreach( $array as $activ)
    {
        echo('
                                <tr>
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

pheader("iut.php");
printAllIUT();
pfooter();
