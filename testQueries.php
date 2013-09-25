<?php

include 'queries.php';
function prn($qres, $separator='<br />') {
    if(gettype($qres) === 'boolean') {
        echo('Nothing to display'.$separator);
        return;
    }

    if (gettype($qres) === 'string') {
        echo ($qres);
        echo($separator);
        return;
    }

    if (gettype($qres) === 'array') {
        foreach ($qres as $dim) {
            prn($dim, ' ');
            echo ($separator);
        }
        echo($separator);
        return;
    }

    # Cas pas envisagés
    echo($qres);
}

?>

<html>
<head>
    <meta charset="utf8">
    <title>Page de test du controlleur</title>
</head>
<body>


<?php

#prn(selectAllEpreuves());
#prn(selectAllEtudiants());
prn(selectAllStudentFromIut(1));


?>

</body>
</html>