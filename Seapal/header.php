<html>

	<head profile="http://www.w3.org/2005/10/profile">

		<meta name="keywords" content="sailing, app, navigation, sea map, boat, skipper"/>
		<meta name="description" content="SeaPal is a mobile app for sailors to do navigation, tracking and more."/>
		<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
		<title>SeaPal</title>
		<link rel="icon"
		type="image/png"
		href="images/Icon-32.png">
		<link href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet" type="text/css"/>
		<link href="./include/style.css" rel="stylesheet" type="text/css" media="screen"/>

		<!-- Google Analytics code -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-34885997-1']);
			_gaq.push(['_gat._anonymizeIp']);
			_gaq.push(['_setDomainName', 'seapad.org']);
			_gaq.push(['_setAllowLinker', true]);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();

		</script>
	</head>

	<body>

		<div id="main-wrapper-outer">

			<div id="main-wrapper">

				<div id="header-wrapper">
					<div id="header" class="container">
						<div id="logo">
							<h1><a href="index.php" name="top">
								<img id="icon" src="images/Icon-Small-50.png" alt="Icon-Small-50" width="50" height="50" />
								<img src="images/image001.png" alt="SeaPal" width="400" height="120" />
							</a></h1>
						</div>
						<div id="menu">
							<ul>
								<li <?php echo ($navsection == 'index') ? ' class="current_page_item"' : 'class="index"'; ?>> 
									<a href=index.php>Homepage</a>
								</li>
								<li <?php echo ($navsection == 'userguide') ? ' class="current_page_item"' : 'class="userguide"'; ?>>
									<a href=userguide.php>User Guide</a>
								</li>
								<li <?php echo ($navsection == 'screenshots') ? ' class="current_page_item"' : 'class="screenshots"'; ?>>
									<a href=screenshots.php>Screenshots</a>
								</li>
								<li <?php echo ($navsection == 'about') ? ' class="current_page_item"' : 'class="about"'; ?>>
									<a href=about.php>About</a>
								</li>
								<li <?php echo ($navsection == 'contact') ? ' class="current_page_item"' : 'class="contact"'; ?>>
									<a href=contact.php>Contact</a>
								</li>
								<li <?php echo ($navsection == 'map') ? ' class="current_page_item"' : 'class="map"'; ?>>
									<a href=map.php>Map</a>
								</li>
							</ul>
						</div>
					</div>
					<div id="banner" class="container">
						<div class="image-style">
							<img src="images/SeaPal-Screen-Horiz01.jpg" width="860" height="250" alt=""/>
						</div>
					</div>
				</div>

</html>