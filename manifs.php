<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

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
                            <li><a href="?date=01/'.($m + 1).'/'.$y.'">'.$monthToString[$m].' '.$y.'</a></li>
        ');
    }
    echo('
                        </ul>
                    </aside>
    ');
}

function selectAllManifestationsInMonth($date) {
    $arrayDate = explode("/", $date);
    $m = $arrayDate[1];
    $y = $arrayDate[2];
    $q = 'select nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut from manifestation as m
          inner join iut as i on m.noIut = i.noIut
          where month(dateMan) = '.$m.' and year(dateMan) = '.$y.' order by dateMan;';
    return query($q);
}

function printManifestations($date) {
    $manifs = selectAllManifestationsInMonth($date);
    if (count($manifs) === 0) {
        echo('
                    <article class="ym-g80 ym-gr ym-content">
                        <p>Pas de manifestation ce mois</p>
                    </article>
        ');
        return;    
    }
    echo('
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
    ');
    foreach($manifs as $manif) {
        echo('
                                <tr>
                                    <td>'.$manif[0].'</td>
                                    <td>'.$manif[1].'</td>
                                    <td>'.$manif[2].'</td>
                                    <td><a href="#">Sup</a> <a href="#">Mod</a></td>
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
if (isset($_GET['date'])) {
    $date = $_GET['date'];
}
surroundingMonths($date);
printManifestations($date);
pfooter();


?>
