<!DOCTYPE html>
<html lang="fr">
<head>
    <meta lang="fr" content="text/html" charset="utf-8">
</head>

<body>
<?php

require "queries.php";

/**
 * printAllEpreuves
 *
 * Print the "Epreuves" database
 */

function printAllManifestationsAfter()
{
    $array = selectAllManifestationsAfter("2012-03-01");

    ?>
        <table border="3">
        <tr>
        <th>Nom</th>
        <th>Date</th>
        <th>Nom de l'IUT</th>
        </tr>
    <?php

    foreach( $array as $activ)
    {
        echo("<tr>
                <td>".$activ[0]."</td>
                <td>".$activ[1]."</td>
                <td>".$activ[2]."</td>
             </tr>"
            );
    }
}


echo("<h2>Manifestations après le 01/03/12 :</h2>");
printAllManifestationsAfter();

?>
</body>
</html>
