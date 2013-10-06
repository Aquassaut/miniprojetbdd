<!DOCTYPE html>
<html lang="fr">
<head>
    <meta lang="fr" content="text/html" charset="utf-8">
    <script src="printManifestationsAfter.js"></script>
</head>

<body>
<?php

require "queries.php";


/**
 * checkSDate($date)
 *
 * Check if the date is correct
 * return true if date is correct, false otherwise.
 */

function checkSDate($date)
{
    if($date === "")
        return false;

    list($jj,$mm,$yy) = explode("/",$date);
    if (is_numeric($yy) && is_numeric($mm) && is_numeric($jj))
    {
        return checkdate($mm,$jj,$yy);
    }
    return false;
}


/**
 * selectDate()
 *
 * Select a date. Manifestations after this date will be shawn by
 * printAllmanifestationsAfter()
 */

function selectDate($date)
{
    echo("<form id='formDate' onsubmit='return checkDate();'>");
    ?>
        <label for="Date ">Date :</label>
    <?php
        echo("<input id='date' type='text' name='date' value='".$date."' placeholder='jj/mm/aaaa' />")
    ?>
        <input type="submit" name="Afficher" value="Afficher" onClick="checkDate();" >
        <span id="errorDate"></span>
        </form><br>
    <?php
}


/**
 * printAllEpreuves
 *
 * Print the "Epreuves" database
 */

function printAllManifestationsAfter($date = "01/01/1900")
{
    list($jj,$mm,$yy) = explode("/",$date);
    $array = selectAllManifestationsAfter($yy."-".$mm."-".$jj);

    ?>
        <table border="3">
        <tr>
        <th>Nom</th>
        <th>Date</th>
        <th>Nom de l'IUT</th>
        </tr>
    <?php

    foreach( $array as $manif)
    {
        echo("<tr>
                <td>".$manif[0]."</td>"
            );

        list($yy,$mm,$jj) = explode("-",$manif[1]);
        $dateNewFormat = $jj."/".$mm."/".$yy;

        echo("  <td>".$dateNewFormat."</td>
                <td>".$manif[2]."</td>
             </tr>"
            );
    }
}


$date = $_GET["date"];
$dateIsCorrect = checkSDate($date);

if($dateIsCorrect)
    echo("<h2>Manifestations après le ".$date." :</h2>");
else
    echo("<h2>Manifestations :</h2>");

selectDate($date);

if($dateIsCorrect)
    printAllManifestationsAfter($date);
else
    printAllManifestationsAfter();

?>
</body>
</html>
