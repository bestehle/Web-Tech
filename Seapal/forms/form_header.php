<head profile="http://www.w3.org/2005/10/profile">

    <meta name="keywords" content="sailing, app, navigation, sea map, boat, skipper"/>
    <meta name="description" content="SeaPal is a mobile app for sailors to do navigation, tracking and more."/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title><?php echo $title?></title>
    <link rel="icon"
    type="image/png"
    href="../images/Icon-32.png">
    <link href="../include/form_style.css" rel="stylesheet" type="text/css" media="screen"/>
</head>
<body>
    <div id="content">
        <a href="../index.php" class="button" id="home"> <img id="icon" src="../images/Icon-Small-50.png" alt="HOME" width="40" height="44" /> </a>
        <ul id="breadcrumbs-freebie">
            <li>
                <!-- Start Freebie -->
                <ul id="breadcrumbs">
                    <?php

                    foreach ($pages as $key => $value) {
                        echo "<li> <a href=\"$value\"> <span>$key</span> <span class=\"arrow\"></span> </a> </li>";
                    }
                    ?>
                </ul>
                <!-- End Freebie -->
            </li>
        </ul>
        <a class="button_rechts" href="../Map/map.php">Map</a>
        <?php
        if (isset($buttons)) {
            foreach ($buttons as $key => $value) {
                if (isset($value["href"])) {
                    echo "<a class=\"button_rechts\" href=\"" .$value["href"] . "\">$key</a>";
                }
                if (isset($value["id"])) {
                    echo "<a class=\"button_rechts\" id=\"" .$value["id"] . "\">$key</a>";
                }
            }
        }
    ?>
    </div>

