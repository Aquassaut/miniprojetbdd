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

# Requete 1
#prn(selectAllEpreuves());
# Requete 2
#prn(selectAllEtudiants());
# Requete 3
#prn(selectAllEtudiantsByIut(1));
# Requete 4
#prn(selectNbEtudiantsByIut(1));
# Requete 5
#prn(selectAllEtudiantsByIut(1));
# Requete 6
#prn(selectEtudiantBySameAgeAs(5));
# Requete 7
prn(selectCountEpreuves());
# Requete 8
prn(selectCountEtudiantsByManifestation());
# Requete 9
prn(selectManifestationByTotosParticipation(4));


?>

</body>
</html>
