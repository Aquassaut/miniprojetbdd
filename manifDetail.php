<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";
require_once "Controllers/contenuControler.php";

/*
 * selectManifestations
 *
 * Retourne la manifestation correspondant à l'identifiant envoyé
 * @param $numMan : identifiant de la manifestation
 * @return query($q)
 */

function selectManifestation($numMan) {
    $q = 'select numMan, nomMan, date_format(dateMan, "%d/%m/%Y"), nomIut
          from manifestation as m
          inner join iut i on m.noIut = i.noIut
          where numMan = '.$numMan.';';
    return query($q);
}


/*
 * selectEpreuves
 *
 * Recherche les épreuves faisant partie de la manifestation
 * @param $numMan : identifiant de la manifestation
 * @return query($q)
 */

function selectAllEpreuves($numMan) {
    $q = 'select c.numEpreuve, intitule from contenu as c
          inner join epreuve e on c.numEpreuve = e.numEpreuve
          where numMan = '.$numMan.'
          order by intitule;';
    return query($q);
}

function selectRemainingEpreuves($numMan) {
    $q =    'select numEpreuve, intitule 
            from epreuve
            where numEpreuve not in (
                select numEpreuve
                from contenu
                where numMan = '.$numMan.');';
    return query($q);
}


function selectAllEtuByEpreuve($numEpr, $numMan)
{
    $q = 'select resultat, nom, age, sexe, nomIut from participe as p
          inner join etudiant etu on p.noEtudiant = etu.noEtudiant
          inner join iut on etu.noIut = iut.noIut
          where numEpreuve='.$numEpr.'
          and numMan = '.$numMan.'
          order by resultat desc
          limit 3;';
    return query($q);
}


function testManifestation($manifQuery)
{
    if (count($manifQuery) === 0) {
        pheader("Manifestation introuvable");
        echo('
                <div class="box error">
                    Aucune manifestation existante pour cet identifiant
                </div>
        ');
        return false;
    }

    return true;
}


function printResumeManifestation($manif)
{
    echo('
        <div class="box info">Le '.$manif[2].' à l\'IUT de '.$manif[3].'</div>
    ');
}

function printEpreuveAdder($manif) {
    $epreuves = selectRemainingEpreuves($manif[0]);
    if (count($epreuves) === 0) {
        return;
    }
    echo ('
            <button id="boutEpreuve" class="ym-button ym-add" onclick="document.getElementById(\'addEpreuve\').style.display = \'block\'; document.getElementById(\'boutEpreuve\').style.display = \'none\'">Ajouter une épreuve</button>
            <div id="addEpreuve" class="ym-form" style="display : none;">
                <form method="POST" class="ym-fbox" action="">
                    <input type="hidden" name="action" value="addEpreuve" />
                    <input type="hidden" name="manif" value="'.$manif[0].'" />
                    <label for="epreuveSelect">Quelle epreuve ajouter ?</label>
                    <select name="epreuve" id="epreuveSelect">
    ');

    foreach ($epreuves as $epreuve) {
        echo('
                        <option value="'.$epreuve[0].'">'.$epreuve[1].'</option>
        ');
    }

    echo ('
                    </select> <br />
                    <button type="submit" class="ym-button ym-save">Ajouter</button>
                    <button type="button" class="ym-button ym-close" onclick="document.getElementById(\'addEpreuve\').style.display = \'none\'; document.getElementById(\'boutEpreuve\').style.display = \'block\'">Annuler</button>
                </form>
            </div>
    ');
}

function printEpreuve($epreuve, $numManif)
{
    $etudiants = selectAllEtuByEpreuve($epreuve[0], $numManif);
    echo('
                    <div class="center"><h3><a href="epreuveDetail.php?epr='.$epreuve[0].'&manif='.$numManif.'" >'.$epreuve[1].'</a></h3></div>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Résultat</th>
                                    <th>Nom</th>
                                    <th>Age</th>
                                    <th>Sexe</th>
                                    <th>IUT</th>
                                </tr>
                            </thead>
                            <tbody>
        ');

    if (count($etudiants) === 0)
    {
        echo('
                                <tr>
                                    <td colspan="5">
                                        <div class="ym-form ym-full">
                                            <form action="" method="post" class="ym-fbox center">
                                                <input type="hidden" name="action" value="removeEpreuve" />
                                                <input type="hidden" name="manif" value="'.$numManif.'" />
                                                <input type="hidden" name="epreuve" value="'.$epreuve[0].'" />
                                                <button> Supprimer cette épreuve</button>
                                            </form>
                                        </div>

                                    </td>
                                </tr>
             ');
    }

    else
    {
        foreach($etudiants as $etudiant)
        {
            echo('
                                    <tr>
                                        <td>'.$etudiant[0].'</td>
                                        <td>'.$etudiant[1].'</td>
                                        <td>'.$etudiant[2].'</td>
                                        <td>'.$etudiant[3].'</td>
                                        <td>'.$etudiant[4].'</td>
                                    </tr>
                 ');
        }
    }

    echo('
                            </tbody>
                        </table>
                    </article>
         ');
}


function printAllEpreuves($manif)
{
    $epreuves = selectAllEpreuves($manif[0]);

    echo('<center><div style="padding-top: 40px;><br>"');
    foreach($epreuves as $epreuve)
        printEpreuve($epreuve, $manif[0]);
    echo('</div></center>');
}


if (isset($_POST['action'])) {
    switch ($_POST['action']) {
    case "addEpreuve" :
        if (isset($_POST['manif']) && isset($_POST['epreuve'])) {
            addToContenu($_POST['epreuve'], $_POST['manif']);
        }
        break;
    case "removeEpreuve" :
        if (isset($_POST['manif']) && isset($_POST['epreuve'])) {
            removeFromContenu($_POST['epreuve'], $_POST['manif']);
        }
        break;
    }
}


if (isset($_GET['num']))
{
    $numMan = $_GET['num'];
    $manifQuery = selectManifestation($numMan);

    if(testManifestation($manifQuery))
    {
        $manif = $manifQuery[0];
        pheader($manif[1]);
        printResumeManifestation($manif);
        printEpreuveAdder($manif);
        printAllEpreuves($manif);
    }
}

else
{
    pheader("Manifestation introuvable");
}

pfooter();

?>
