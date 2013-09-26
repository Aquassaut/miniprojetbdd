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

function printAllEpreuves()
{
    $array = selectAllEpreuves();

    ?>
        <table border="1">
        <tr>
        <th>Intitulé</th>
        </tr>
    <?php

    foreach( $array as $activ)
    {
        echo("<tr>
                <td>".$activ[0]."</td>
             </tr>"
            );
    }
}


echo("<h2>Épreuves :</h2>");
printAllEpreuves();

?>
</body>
</html>
