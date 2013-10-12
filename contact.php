<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/**
 *  printContact
 *
 *  Prints all the necessary contact info
 */

function printContact() {
    echo ('
                    <article class="ym-content">
                        <p> Pour toute questions veuillez nous envoyer un mail à l\'adresse que je ne publierai pas par peur du spam.<br />Cette page sert surtout à éviter de faire 404 le lien.</p>
                    </article>
    ');
}

pheader("contact");
printContact();
pfooter();

?>
