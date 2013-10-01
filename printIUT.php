<!DOCTYPE html>
<html lang="fr">
<head>
    <meta lang="fr" content="text/html" charset="utf-8">
</head>

<body>
<?php

require "queries.php";

/**
 *  selectAllIUT
 *
 *  @return 2-dimensional array containing all stored IUT
 */

function selectAllIUT() {
    $q = 'select * from iut;';
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

    ?>
        <table border="1">
        <tr>
        <th>Nom de l'IUT</th>
        <th>Adresse</th>
        <th>Nombre de l'étudiants</th>
        </tr>
    <?php

    foreach( $array as $activ)
    {
        echo("<tr>
                <td>".$activ[1]."</td>
                <td>".$activ[2]."</td>
                <td>".$activ[3]."</td>
             </tr>"
            );
    }
}

?>

echo("<h2>IUT :</h2>");


<?php
printAllIUT();

?>
</body>
</html>
