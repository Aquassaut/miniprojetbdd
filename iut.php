<?php

require_once "include/pageTemplate.php";
require_once "controllers/iutController.php";
require_once "view/iutView.php";


/**
 * printAllIUT
 *
 * Print the IUT database
 */

function printAllIUT()
{
    $array = selectAllIUT();

    echo ('
                    <script src="include/scriptIUT.js"></script>
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
    foreach($array as $iut)
    {
        echo('
                                <tr id="'.$iut[0].'">
                                    <td><a id="iut-nom-'.$iut[0].'" href="iutDetail.php?num='.$iut[0].'" >'.$iut[1].'</a></td>
                                    <td id="iut-addr-'.$iut[0].'">'.$iut[2].'</td>
                                    <td id="iut-nbEtu-'.$iut[0].'">'.$iut[3].'</td>
                                    <td>
                                        <form id="form-iut-'.$iut[0].'" method="post" action="">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="'.$iut[0].'">
                                        </form>
                                        <button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$iut[0].');"></button>
                                        <button type="submit" class="ym-button ym-delete ym-ico-btn" onclick="document.getElementById(\'form-iut-'.$iut[0].'\').submit();"></button>
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
            deleteIut($_POST['id']);
        }
        break;
    case "modify" :
        if (isset($_POST['id']) && isset($_POST['newNom']) && isset($_POST['newAdresse']) && isset($_POST['newCount'])) {
            changeIut($_POST['id'], $_POST['newNom'], $_POST['newAdresse'], $_POST['newCount']);
        }
        break;
    case "add" :
        if (isset($_POST['newNom']) && isset($_POST['newAdresse']) && isset($_POST['newCount'])) {
            addToIut($_POST['newNom'], $_POST['newAdresse'], $_POST['newCount']);
        }
        break;
    }
}



pheader("iut.php");
printAllIUT();
pfooter();
