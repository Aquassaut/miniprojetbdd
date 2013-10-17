<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";
require_once "Controllers/etuControler.php";

/*
 * selectIut
 *
 * Retourne l'IUT correspondant à l'identifiant envoyé
 * @param $noIut : identifiant de l'Iut
 * @return query($q)
 */

function selectIut($noIut) {
    $q = 'select noIut, nomIut, adresse, nbEtudiants from iut
          where noIut = '.$noIut.';';
    return query($q);
}


/*
 * selectAllEtu
 *
 * Recherche les étudiants inscrit à l'iut demandé
 * @param $numIut : identifiant de l'iut
 * @return query($q)
 */

function selectAllEtu($noIut) {
    $q = 'select noEtudiant, nom, age, sexe from etudiant
          where noIut = '.$noIut.'
          order by nom;';
    return query($q);
}


function testIut($iutQuery)
{
    if (count($iutQuery) === 0) {
        pheader("IUT introuvable");
        echo('
                <div class="box error">Aucun IUT existant pour cet identifiant</div>
        ');
        return false;
    }

    return true;
}


function printResumeIut($iut)
{
    echo('
        <div class="box info">
            Adresse '.$iut[2].'<br />
            Nombre d\'étudiants : '.$iut[3].'
        </div>
    ');
}


function printAllEtudiants($numIut)
{
    $etudiants = selectAllEtu($numIut);
    echo('
                    <script src="scriptIutDetail.js"></script>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Age</th>
                                    <th>Sexe</th>
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

    if (count($etudiants) === 0)
    {
        echo('
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
             ');
    }

    else
    {
        foreach($etudiants as $etudiant)
        {
            echo('
                                    <tr id="'.$etudiant[0].'">
                                        <td id="etu-nom-'.$etudiant[0].'">'.$etudiant[1].'</td>
                                        <td id="etu-age-'.$etudiant[0].'">'.$etudiant[2].'</td>
                                        <td id="etu-sexe-'.$etudiant[0].'">'.$etudiant[3].'</td>
                                        <td>
                                            <form id="form-detEtu-'.$etudiant[0].'" method="post" action="">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="'.$etudiant[0].'">
                                            </form>
                                            <button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$etudiant[0].');"></button>
                                            <button type="submit" class="ym-button ym-delete ym-ico-btn" onclick="document.getElementById(\'form-detEtu-'.$etudiant[0].'\').submit();"></button>
                                        </td>
                                    </tr>
                 ');
        }
    }

    echo('
                            </tbody>
                        </table>
                    </article>
                    <span id="etu-noiut" style="display : none;">'.$numIut.'</span>
         ');
}

if (isset($_POST['action'])) {
    switch($_POST['action']) {
    //$nom, $age, $sexe, $noIut, $id
    case "delete" :
        if (isset($_POST['id'])) {
            deleteEtu($_POST['id']) ;
        }
        break;
    case "modify" :
        if (isset($_POST['id']) && isset($_POST['newNom']) && isset($_POST['newAge']) && isset($_POST['newSexe'])) {
            changeEtuNameAgeSex($_POST['id'], $_POST['newNom'], $_POST['newAge'], $_POST['newSexe']);
        }
        break;
    case "add" :
        if (isset($_POST['newNom']) && isset($_POST['newAge']) && isset($_POST['newSexe']) && isset($_POST['numIut'])) {
            addToEtu($_POST['newNom'], $_POST['newAge'], $_POST['newSexe'], $_POST['numIut']);
        }
        break;
    }
}

if (isset($_GET['num']))
{
    $noIut = $_GET['num'];
    $iutQuery = selectIut($noIut);

    if(testIut($iutQuery))
    {
        $iut = $iutQuery[0];
        pheader($iut[1]);
        printResumeIut($iut);
        printAllEtudiants($noIut);
    }
}

else
{
    pheader("Iut introuvable");
}

pfooter();

?>
