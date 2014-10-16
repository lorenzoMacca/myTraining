<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Picturesque 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20131223

-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>My Training</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />

        <!-- Bootstrap -->
        <link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- end Bootstrap -->

        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
        <link href="style/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="style/fonts.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="style/styleMyTraining.css" />
        <link rel="stylesheet" href="style/styleMenu.css" />

        <script src="js/menuActivity.js" ></script>
        <script src="http://code.jquery.com/jquery-1.10.2.min.js" ></script>
        <link href="style/homepage.css" rel="stylesheet" type="text/css" media="all" />

        <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

    </head>
    <body>
        <div id="header-wrapper">
            <div id="header" class="container">
                <div id="logo">
                    <h1><a href="#">My Training</a></h1>
                </div>
            </div>
            <div id="menu-wrapper">
                <div id="menu" class="container">
                    <ul>
                        <li id="homePageLink" class="current_page_item MT_border_bottom_default"><a accesskey="1" title="">Homepage</a></li>
                        <li id="profileLink"><a accesskey="3" title="">Profile</a></li>
                        <li id="statisticsLink"><a accesskey="4" title="">Statistics</a></li>
                        <li id="contactLink"><a accesskey="5" title="">Contact Us</a></li>
                        <!--<li>
                                <input type="text" placeholder="username" id="username" />
                                <input type="password" placeholder="password" id="password" />
                                <button id="logInButton" >Log in</button>
                        </li>-->
                    </ul>
                </div>
            </div>
        </div>
        <div id="banner">

            <?php
            // put your code here
            include './InitSession.php';
            $initSession = new InitSession();
            $initSession->init();
            ?>
            <div id="center">

                <form role="form" class="loginForm">
                    <div class="form-group">	
                        <input type="text" class="form-control input-lg" placeholder="Username" id="username">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" id="password" placeholder="Password">
                    </div>
                    <button type="button" id="logInButton" class="btn btn-lg btn-success MT_signInButton">Sign in</button>
                </form>
            </div>
        </div>
        <script>
            $('[id=logInButton]').click(function() {
                doLogin($('[id=username]').val(), $('[id=password]').val());
            });

            $('[id=insertWorkout]').click(function() {
                toInsertWorkout();
            });

            $('[id=home]').click(function() {
                toHOME();
            });

            $('[id=runningTraining]').click(function() {
                toInsertRunningTraining();
            });

            $('[id=spinningTRaining]').click(function() {
                toInsertSpinningTraining();
            });

            $("[id=homePageLink]").mouseover(function() {
                $("[id=homePageLink]").addClass("MT_border_bottom");
            }).mouseout(function() {
                $("[id=homePageLink]").removeClass("MT_border_bottom");
            });

            $("[id=profileLink]").mouseover(function() {
                $("[id=profileLink]").addClass("MT_border_bottom");
            }).mouseout(function() {
                $("[id=profileLink]").removeClass("MT_border_bottom");
            });

            $("[id=statisticsLink]").mouseover(function() {
                $("[id=statisticsLink]").addClass("MT_border_bottom");
            }).mouseout(function() {
                $("[id=statisticsLink]").removeClass("MT_border_bottom");
            });

            $("[id=contactLink]").mouseover(function() {
                $("[id=contactLink]").addClass("MT_border_bottom");
            }).mouseout(function() {
                $("[id=contactLink]").removeClass("MT_border_bottom");
            });


        </script>

        <div id="wrapper2">
            <div id="portfolio" class="container MT_container_wrapper_left">
                <div class="title">
                    <h2>The best athletes</h2>
                    <span class="byline">Mattis libero eget urna</span>
                </div>
                <div class="column1">
                    <div class="box"> <a href="http://www.lazarangelov.com/"><img src="images/homepage/lazar_menu.jpg" alt="" class="image image-full" /></a>
                        <h3>Lazar Angelov</h3>
                        <p>Did I sculpt my body and attained such aesthetic physique? Some say I took the easy route, but trust me, I made many mistakes along the long road to success. I learned from those mistakes and now I am trying to help others avoid them. There are no shortcuts, my friend, the only way is through hard work and dedication. .</p>
                        <!--<a href="#" class="button button-small">Etiam posuere</a> -->
                    </div>
                </div>
                <div class="column2">
                    <div class="box"> <a href="#"><img src="images/scr02.jpg" alt="" class="image image-full" /></a>
                        <h3>Praesent scelerisque</h3>
                        <p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
                        <a href="#" class="button button-small">Etiam posuere</a> </div>
                </div>
                <div class="column3">
                    <div class="box"> <a href="#"><img src="images/scr03.jpg" alt="" class="image image-full" /></a>
                        <h3>Donec dictum metus</h3>
                        <p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
                        <a href="#" class="button button-small">Etiam posuere</a> </div>
                </div>
            </div>
            <div class="MT_container_wrapper_right">
				<!-- https://dev.twitter.com/web/embedded-timelines#available-timelines -->
				<a class="twitter-timeline"  href="https://twitter.com/search?q=%23lazar" data-widget-id="522686107440279552">Tweet su "#lazar "</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
            </div>
        </div>
        <div class="wrapper">
            <div id="three-column" class="container">
                <div><span class="arrow-down"></span></div>
                <div id="tbox1">
                    <div class="title">
                        <h2>Maecenas luctus</h2>
                        <span class="byline">Proin suscipit nulla suscipit </span>
                    </div>
                    <p>Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac suscipit mauris. Proin eu wisi suscipit nulla suscipit interdum.</p>
                    <a href="#" class="button">Learn More</a> </div>
                <div id="tbox2">
                    <div class="title">
                        <h2>Integer gravida</h2>
                        <span class="byline">Mattis libero eget urna</span>
                    </div>
                    <p>Proin eu wisi suscipit nulla suscipit interdum. Nullam non wisi a sem semper suscipit eleifend. Donec mattis libero eget urna. Duis  velit ac mauris.</p>
                    <a href="#" class="button">Learn More</a> </div>
                <div id="tbox3">
                    <div class="title">
                        <h2>Praesent mauris</h2>
                        <span class="byline">Donec mattis libero eget</span>
                    </div>
                    <p>Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Nullam non wisi a sem suscipit  eleifend.</p>
                    <a href="#" class="button">Learn More</a> </div>
            </div>
        </div>
        <div id="page-wrapper">
            <div id="page" class="container">
                <div class="title">
                    <h2>Welcome to our website</h2>
                </div>
                <p>This is <strong>Picturesque</strong>, a free, fully standards-compliant CSS template designed by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>. The photos in this template are from <a href="http://fotogrph.com/"> Fotogrph</a>. This free template is released under a <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attributions 3.0</a> license, so you are pretty much free to do whatever you want with it (even use it commercially) provided you keep the links in the footer intact. Aside from that, have fun with it :) </p>
            </div>
        </div>
        <div id="copyright" class="container">
            <p>Copyright (c) 2013 Sitename.com. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
            <ul class="contact">
                <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
                <li><a href="#" class="icon icon-facebook"><span></span></a></li>
                <li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
                <li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
                <li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
            </ul>
        </div>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="style/bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>
