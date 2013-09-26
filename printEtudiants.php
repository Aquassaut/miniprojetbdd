<!DOCTYPE html>
<html lang="fr">
<head>
    <meta lang="fr" content="text/html" charset="utf-8">
</head>

<body>
<?php

require "queries.php";

/**
 * printAllEtudiants
 *
 * Print the "Etudiants" database
 */

function printAllEtudiants()
{
    $array = selectAllEtudiants();

    ?>
        <table border="1">
        <tr>
        <th>Nom</th>
        <th>Age</th>
        <th>Sexe</th>
        <th>IUT</th>
        </tr>
    <?php

    foreach( $array as $activ)
    {
        echo("<tr>
                <td>".$activ[0]."</td>
                <td>".$activ[1]."</td>
                <td>".$activ[2]."</td>
                <td>".$activ[3]."</td>
             </tr>"
            );
    }
}


echo("<h2>Étudiants :</h2>");
printAllEtudiants();

?>
</body>
</html>
