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
                    // $pages = array("Boot Info" => "logbuch.php", "Trips" => "trips.php", "Trip Info" => "trip_info.php", "Entry Info" => "entry_info.php");

                    foreach ($pages as $key => $value) {
                        echo "<li> <a href=\"$value\"> <span>$key</span> <span class=\"arrow\"></span> </a> </li>";
                    }
                    ?>
                </ul>
                <!-- End Freebie -->
            </li>
        </ul>
        <a id="rechts" class="button">Map</a>
    </div>
