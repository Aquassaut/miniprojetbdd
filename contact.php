<?php

require_once "include/pageTemplate.php";

/**
 *  printContact
 *
 *  Prints all the necessary contact info
 */

function printContact() {
    echo ('
                    <article class="ym-content">
                        <h3>Auteurs</h3>
                        <ul>
                            <li>Jeremy Autran <i>(S3A1)</i></li>
                            <li>Anthony Ruhier <i>(S3A1)</i></li>
                        </ul>
                        <p>Pour toute question ou rapport de bug, veuillez nous contacter sur nos adresses e-mail de l\'IUT (non publiées ici pour éviter tout spam).</p>
                    </article>
    ');
}

pheader("Contact");
printContact();
pfooter();

?>
