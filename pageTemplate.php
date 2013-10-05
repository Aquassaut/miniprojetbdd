<?php

function pheader($pageName) {

    $pages = [
        ["accueil.php", "Accueil"],
        ["manifs.php", "Les manifestations"],
        ["epreuves.php", "Les épreuves"],
        ["iut.php", "Les IUT"],
        ["contact.php", "Nous contacter"]
    ];

    $caller = -1;
    for($i = 0; $i < count($pages); $i += 1) {
        if ($pageName === $pages[$i][0]) {
            $caller = $i;
            break;
        }
    }
    $title = '';
    if ($caller === -1) {
        $title .= $pageName;
    } else {
        $title .= $pages[$caller][1];
    }

    echo ('
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Site des manifestations inter-IUT</title>
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/core/base.css">
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/forms/gray-theme.css">
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/navigation/hlist.css">
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/navigation/vlist.css">
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/screen/screen-FULLPAGE-layout.css">
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/screen/typography.css">
    <link rel="stylesheet" type="text/css" href="lib/yaml/yaml/modifs.css">
</head>
<body>

    <!-- Header -->
    <header>
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <hgroup>
                    <h1> Rencontre des IUT </h1>
                </hgroup>
            </div>
        </div>
    </header>
    <!-- Navigation bar -->
    <nav id="nav">
        <div class="ym-wrapper">
            <div class= "ym-hlist">
                <ul>
    ');
    foreach($pages as $page) {
        if ($pageName === $page[0]) {
            echo('
                    <li class="active"><a href="'.$page[0].'">'.$page[1].'</a></li>
            ');
        } else {
            echo('
                    <li><a href="'.$page[0].'">'.$page[1].'</a></li>
            ');
        }
    }
    echo('
                </ul>
                <form class="ym-searchform">
                    <input class="ym-searchfield" type="search" placeholder="Rechercher...">
                    <input class="ym-searchbutton" type="submit" value="Aller">
                </form>
            </div>
        </div>
    </nav>
    <!-- Main site -->
    <main>
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <h1>'.$title.'</h1>
                <section class="ym-grid linearize-level-1">
    ');
}

function pfooter() {
    echo ('
                </section>
            </div>
        </div>
    </main>
    <!-- Footer -->
    <footer>

    </footer>
</body>
</html>
    ');

}