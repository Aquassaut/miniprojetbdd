<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";
require_once "Controllers/epreuveControler.php";

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
                                        <form id="form-epreuve-'.$activ[0].'" method="post" action="">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="'.$activ[0].'">
                                        </form>
                                        <button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$activ[0].');"></button>
                                        <button class="ym-button ym-delete ym-ico-btn" onclick="document.getElementById(\'form-epreuve-'.$activ[0].'\').submit();"> </button>
                                    </td>
                                </tr>
        ');
    }
    echo ('
                            </tbody>
                        </table>
                    </article>
    ');
}

if (isset($_POST['action'])) {
    switch($_POST['action']) {
    case "delete" :
        if (isset($_POST['id'])) {
            deleteEpreuve($_POST['id']);
        }
        break;
    }
}


pheader("epreuves.php");
printAllEpreuves();
pfooter();
