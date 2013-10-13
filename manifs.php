<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";
require_once "Controllers/manifControler.php";

function surroundingMonths($date) {
    echo('
                    <aside class="ym-g18 ym-gl ym-vlist">
                        <ul>
    ');

    $monthToString = [
        "Janvier",
        "Février",
        "Mars",
        "Avril",
        "Mai",
        "Juin",
        "Juillet",
        "Août",
        "Septembre",
        "Octobre",
        "Novembre",
        "Décembre"
    ];

    $arrayDate = explode("/", $date);
    $month = $arrayDate[1] - 1;

   /**
    * This part was previously known as selectDate()
    *
    * Select a date. Manifestations after this date will be shawn by
    * printAllmanifestationsAfter()
    */

    echo('
                            <form id="formDate"  onsubmit="return checkDate();">
                                <li>
                                    <div class="ym-form ym-full">
                                        <div class="ym-fbox">
                                            <label for="Date ">Manifestations après le</label>
                                            <input id="date" type="text" name="date" value="'.$date.'" placeholder="jj/mm/aaaa" />
                                            <button type="submit" class="ym-button ym-next ym-small" name="Afficher" onClick="checkDate();" >Afficher</button>
                                        </div>
                                    </div>
                                </li>
                            </form>
                            <li>
                                <span id="errorDate"></span>
                            </li>
    ');

    for ($i = 3; $i >= -3; $i -= 1) {
        $m = $month + $i;
        $y = $arrayDate[2];
        if ($m < 0) {
            $y -= 1;
            $m += 12;
        } elseif ($m > 11) {
            $y += 1;
            $m -= 12;
        } elseif($i === 0) {
            echo ('
                            <li class="active"><strong>'.$monthToString[$m].' '.$y.'</strong></li>
            ');
            continue;
        }
        echo ('
                            <li><a href="?date=01/'.($m + 1).'/'.$y.'&month=true">'.$monthToString[$m].' '.$y.'</a></li>
        ');
    }
    echo('
                        </ul>
                    </aside>
    ');
}


/**
 *  Requête #3.
 *
 *  Bon, ici j'ai pas les données encore je peux pas trop les tester et
 *  j'ai la flemme d'en créer ce soir (il est tard et je veux avancer).
 *  Dans l'idée, on a envie de vérifier la date comme des fils de putes
 *  (surtout le 31 février parce que le prof teste toujours ça en premier)
 *  et aussi pas avoir de souci de format parce que sinon ça va être la merde.
 *
 *  @param $date the date after which we want the manifestations list
 *  @return 2-dimensional array containing all stored manifestations after $date
 */

function selectAllManifestationsAfter($date) {
    //TODO : Vérifier la date
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          where dateMan > date("'.$date.'");';
    return query($q);
}


function selectAllManifestationsInMonth($date) {
    $arrayDate = explode("-", $date);
    $m = $arrayDate[1];
    $y = $arrayDate[0];
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut as i on m.noIut = i.noIut
          where month(dateMan) = '.$m.' and year(dateMan) = '.$y.' order by dateMan;';
    return query($q);
}

function printManifestations($date, $bymonth) {
    list($jj,$mm,$yy) = explode("/",$date);

    if($bymonth)
        $manifs = selectAllManifestationsInMonth($yy."-".$mm."-".$jj);
    else
        $manifs = selectAllManifestationsAfter($yy."-".$mm."-".$jj);

    if (count($manifs) === 0) {
        echo('
                    <article class="ym-g80 ym-gr ym-content">
                        <p>Pas de manifestation ce mois</p>
                    </article>
        ');
        return;
    }
    echo('
                    <script src="scriptManifs.js"></script>
                    <article class="ym-g80 ym-gr ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Date</th>
                                    <th>Nom de l\'IUT</th>
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
    foreach($manifs as $manif) {
        echo('
                                <tr id="'.$manif[0].'">
                                    <td>'.$manif[1].'</td>
                                    <td>'.$manif[2].'</td>
                                    <td>'.$manif[3].'</td>
                                    <td>
                                        <form id="form-manif-'.$manif[0].'" method="post" action="">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="'.$manif[0].'">
                                        </form>
                                        <button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$manif[0].');"></button>
                                        <button class="ym-button ym-delete ym-ico-btn" onclick="document.getElementById(\'form-manif-'.$manif[0].'\').submit();"> </button>
                                    </td>
                                </tr>
        ');
    }
    echo('
                            </tbody>
                        </table>
                    </article>
    ');
}

pheader("manifs.php");
date_default_timezone_set("CET");
$date = date("d/m/Y");
$bymonth = false;

if (isset($_GET['date'])) {
    $date = $_GET['date'];
}

if (isset($_GET['month'])) {
    $bymonth = $_GET['month'];
}

if (isset($_POST['action'])) {
    switch($_POST['action']) {
    case "delete" :
        if (isset($_POST['id'])) {
            deleteManif($_POST['id']);
        }
        break;
    }
}

surroundingMonths($date);
printManifestations($date, $bymonth);
pfooter();


?>
