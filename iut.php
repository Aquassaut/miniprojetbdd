<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/**
 *  selectAllIUT
 *
 *  @return 2-dimensional array containing all stored IUT
 */

function selectAllIUT() {
    $q = 'select * from iut order by nomIut;';
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
                    <script src="scriptIUT.js"></script>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Adresse</th>
                                    <th>Nombre d\'étudiants</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="0">
                                    <td colspan="4">
                                        <center>
                                            <button class="ym-button ym-add" onclick="popForm(0);">Ajouter</button>
                                        </center>
                                    </td>
                                </tr>
    ');
    foreach( $array as $activ)
    {
        echo('
                                <tr id="'.$activ[0].'">
                                    <td>'.$activ[1].'</td>
                                    <td>'.$activ[2].'</td>
                                    <td>'.$activ[3].'</td>
                                    <td><button class="ym-ico-btn ym-button ym-delete"></button> <button class="ym-ico-btn ym-button ym-edit" onclick="popForm('.$activ[0].');">Mod</button></td>
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
