<?php

require_once "include/queryUtil.php";
require_once "include/pageTemplate.php";

/**
 *  printWelcome
 *
 *  Prints a nice and warm welcoming message for people who come to this website
 */

function printWelcome() {
    echo ('
                    <article class="ym-content">
                        <h3>Bienvenue sur le site de gestion de manifestations sportives des IUT</h3>

                        <p>Ce site vous permet de gérer facilement les manifestations sportives des IUT de France, via différentes pages offrant une gestion des étudiants inscrits ainsi que des épreuves prévues pour chaque manifestations. <br>
                        La page "Manifestations" affiche les manifestations prévues à partir de la date du jour, "Épreuves" affiche les épreuves programmées pour chaque manifestation et "IUT" liste les IUT inscrits à ce programme.</p>

                        <p>Il s\'agit d\'un projet étudiant de l\'IUT de Belfort-Montbéliard, dans le cadre du module Base de Données, 3ème semestre.</p>

                        <h3>Configuration</h3>

                        <p>Modifier le fichier <b>config.php</b> à la racine du projet pour associer le site à votre base de donnée MySQL.</p>
                    </article>
    ');
}

pheader("index.php");
printWelcome();
pfooter();

?>
