<?php

require_once "include/pageTemplate.php";
require_once "controllers/participeController.php";
require_once "view/epreuveDetailView.php";



function testManifestation($manifQuery)
{
    if (count($manifQuery) === 0) {
        pheader("Epreuve introuvable");
        echo('
                <div class="box error">
                    Aucune manifestation existante pour cet identifiant
                </div>
        ');
        return false;
    }

    return true;
}


function testEpreuve($epreuves)
{
    if (count($epreuves) === 0) {
        pheader("Epreuve introuvable");
        echo('
                <div class="box error">
                    Aucune épreuve existante pour cet identifiant
                </div>
        ');
        return false;
    }

    return true;
}


function printResumeManifestation($manif, $epreuve)
{
    echo('
        <div class="box info">
            Epreuve de <a href="manifsByEpreuve.php?num='.$epreuve[0].'">'.$epreuve[1].'</a><br />
            À la <a href="manifDetail.php?num='.$manif[0].'">manifestation '.$manif[1].'</a> <br />
            Le '.$manif[2].' à l\'IUT de '.$manif[3].'
        </div>
    ');
}


function printEpreuve($numEpr, $numManif)
{
    $etudiants = selectAllEtudiants($numEpr, $numManif);
    echo('
	    	<script src="include/scriptEpreuveDetail.js"></script>
                    <article class="ym-content">
                        <table class="bordertable">
                            <thead>
                                <tr>
                                    <th>IUT</th>
                                    <th>Nom</th>
                                    <th>Résultat</th>
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
                                    <td></td>
                                </tr>
             ');
    }

    else
    {
        foreach($etudiants as $etudiant)
	{
	// We'll use a etudiant ID to give our <TR>'s a unique ID so that the javascript 
	// side can determine which one line we're talking about 
            echo('
                                    <tr id="'.$etudiant[0].'">
                                        <td>'.$etudiant[1].'</td>
                                        <td>'.$etudiant[2].'</td>
                                        <td>'.$etudiant[3].'</td>
                                        <td>
                                            <form id="form-participe-'.$etudiant[0].'" method="post" action="">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="etu" value="'.$etudiant[0].'">
                                            <input type="hidden" name="manif" value="'.$numManif.'">
                                            <input type="hidden" name="epr" value="'.$numEpr.'">
                                            </form>
                                            <button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$etudiant[0].');"></button>
                                            <button type="submit" class="ym-button ym-delete ym-ico-btn" onclick="document.getElementById(\'form-participe-'.$etudiant[0].'\').submit();"></button>
                                        </td>
                                    </tr>
            ');
        }
    }

    echo('
                            </tbody>
                        </table>
                    </article>
                    <span id="manId" style="display : none;">'.$numManif.'</span>
                    <span id="eprId" style="display : none;">'.$numEpr.'</span>
                    <select id="selectiut" style="display: none;">
                        <option value="0">Tous les IUT</option>
         ');
    $iuts = selectAllIUT();
    foreach ($iuts as $iut) {
	echo ('
                        <option value="'.$iut[0].'">'.$iut[1].'</option>
	');
    }
    echo ('
                    </select>
                    <select id="selectetu" style="display: none;">
    ');
    $alletus = selectAllEtu();
    foreach ($alletus as $etu) {
        echo ('
                        <option value="'.$etu[0].'" class="etu-in-'.$etu[1].'">'.$etu[2].'</option>
        ');
    }
    echo ('
                    </select>
    ');
    
}


if (isset($_POST['action'])) {
    switch($_POST['action']) {
    case "delete" :
        if (isset($_POST['manif']) && isset($_POST['epr']) && isset($_POST['etu'])) {
            deleteParticipe($_POST['manif'], $_POST['epr'], $_POST['etu']);
        }
        break;
    case "modify" :
        if (isset($_POST['manif']) && isset($_POST['epr']) &&
            isset($_POST['etu']) && isset($_POST['newEtu']) && isset($_POST['newRes'])) {

            changePartResultAndEtu($_POST['manif'], $_POST['epr'], $_POST['etu'], $_POST['newEtu'], $_POST['newRes']); 
        }
        break;
    case "add" :
        if (isset($_POST['manif']) && isset($_POST['epr']) && isset($_POST['newEtu']) && $_POST['newRes']) {
            addToParticipe($_POST['manif'], $_POST['epr'], $_POST['newEtu'], $_POST['newRes']); 
        }
        break;
    }
}

if (isset($_GET['manif']) && isset($_GET['epr']))
{
    $numEpr = $_GET['epr'];
    $numMan = $_GET['manif'];
    $manifQuery = selectManifestation($numMan);
    $epreuveQuery = selectEpreuve($numEpr);

    if(testManifestation($manifQuery) && testEpreuve($epreuveQuery))
    {
        $manif = $manifQuery[0];
        $epreuve = $epreuveQuery[0];
        pheader($epreuve[1]);
        printResumeManifestation($manif, $epreuve);
        printEpreuve($numEpr, $numMan);
    }
}
else
{
    pheader("Manifestation introuvable");
}

pfooter();

?>
