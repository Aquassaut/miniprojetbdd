<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/**
 *  selectAllEpreuves
 *
 *  @return 2-dimensional array containing all stored epreuves
 */

function selectAllEpreuves() {
    $q = 'select * from epreuve order by intitule;';
    return query($q);
}


/**
 * printAllEpreuves
 *
 * Print the Epreuve datas
 */

function printAllEpreuves()
{
    $array = selectAllEpreuves();

    echo ('
                    <script src="scriptEpreuves.js"></script>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Intitulé</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="0">
                                    <td colspan="2">
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
                                    <td>
                                        <button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$activ[0].');"></button>
                                        <button class="ym-button ym-delete ym-ico-btn"> </button></td>
                                </tr>

        ');
    }
    echo ('
                            </tbody>
                        </table>
                    </article>
    ');
}

pheader("epreuves.php");
printAllEpreuves();
pfooter();
