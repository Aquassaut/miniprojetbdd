<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

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

function selectAllEtu() {
    $q = 'select noEtudiant, noIut, nom from etudiant order by nom';
    return query($q);
}
function selectAllIUT() {
    $q = 'select noIut, nomIut from iut order by nomIut;';
    return query($q);
}

/*
 * selectEpreuves
 *
 * Recherche les épreuves faisant partie de la manifestation
 * @param $numMan : identifiant de la manifestation
 * @param $numEpr : identifiant de l'épreuve
 * @return query($q)
 */

function selectEpreuve($numEpr) {
    $q = 'select numEpreuve, intitule from epreuve
          where numEpreuve = '.$numEpr.'
          order by intitule;';
    return query($q);
}


function selectAllEtudiants($numEpr, $numMan)
{
    //$q = 'select resultat, nom, age, sexe, nomIut, etu.noEtudiant
    $q = 'select etu.noEtudiant, nomIut, nom, resultat
	  from participe as p
          inner join etudiant etu on p.noEtudiant = etu.noEtudiant
          inner join iut on etu.noIut = iut.noIut
          where numEpreuve='.$numEpr.'
          and numMan = '.$numMan.'
          order by resultat desc;';
    return query($q);
}


function testManifestation($manifQuery)
{
    if (count($manifQuery) === 0) {
        pheader("Epreuve introuvable");
        echo('
                <div style="padding-top: 40px;">
                <center><h3>Aucune manifestation existante pour cet identifiant</h3></center>
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
                <div style="padding-top: 40px;">
                <center><h3>Aucune épreuve existante pour cet identifiant</h3></center>
                </div>
        ');
        return false;
    }

    return true;
}


function printResumeManifestation($manif)
{
    echo('
        <h2>À la manifestation '.$manif[1].', le '.$manif[2].' à l\'IUT de '.$manif[3].'</h2>
    ');
}


function printEpreuve($numEpr, $numManif)
{
    $etudiants = selectAllEtudiants($numEpr, $numManif);
    echo('
	    	<script src="scriptEpreuveDetail.js"></script>
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
						<form id="form-iut-'.$etudiant[0].'" method="post" action="">
						<input type="hidden" name="action" value="delete">
						<input type="hidden" name="id" value="'.$etudiant[0].'">
						</form>
						<button class="ym-button ym-edit ym-ico-btn" onclick="popForm('.$etudiant[0].');"></button>
						<button type="submit" class="ym-button ym-delete ym-ico-btn" onclick="document.getElementById(\'form-iut-'.$etudiant[0].'\').submit();"></button>
					</td>
                                    </tr>
                 ');
        }
    }

    echo('
                            </tbody>
                        </table>
                    </article>
		    <span id="manId" style="display : none;">'.$numEpr.'</span>
		    <span id="eprId" style="display : none;">'.$numManif.'</span>
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
        printResumeManifestation($manif);
        printEpreuve($numEpr, $numMan);
    }
}

else
{
    pheader("Manifestation introuvable");
}

pfooter();

?>
