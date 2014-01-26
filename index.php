<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.10.2.min.js" ></script>
        <link rel="stylesheet" href="style/styleMyTraining.css" />
        <link rel="stylesheet" href="style/styleMenu.css" />

        <!-- LIB EXCEL STYLE -->
        <script src="http://handsontable.com/lib/jquery.min.js"></script>
        <script src="http://handsontable.com/dist/jquery.handsontable.full.js"></script>
        <link rel="stylesheet" media="screen" href="http://handsontable.com/dist/jquery.handsontable.full.css">
        <link rel="stylesheet" media="screen" href="http://handsontable.com/demo/css/samples.css">
        <!-- END LIB EXCEL STYLE -->

        <!-- DATA PICKER -->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <!-- END DATA PICKER -->

        <script src="js/menuActivity.js" ></script>
        <title>My Training</title>
    </head>
    <body>
        <script>
            $('body').css('background', 'black url(images/T.jpg) no-repeat 0 0');
            $(document).ready(function() {
                $('#nav li').hover(
                        function() {
                            //mostra sottomenu
                            $('ul', this).stop(true, true).delay(50).slideDown(100);
                        },
                        function() {
                            //nascondi sottomenu
                            $('ul', this).stop(true, true).slideUp(200);
                        }
                );
            });

        </script>

        <header>
            <ul id="nav">
                <li class="first" id="home"><a >HOME</a></li>
                <li><a class="selected">GYM TRAINING</a>
                    <ul>
                        <!--<li><a href="#">INSERT WORKOUT</a></li>-->
                        <li class="last" id="insertWorkout"><a >INSERT WORKOUT</a></li>
                    </ul>
                    <div class="clear"></div>
                </li>
                <li><a href="#">AEROBICS</a>
                    <ul>
                        <!--<li><a href="#">Sottovoce Menu Numero 04</a></li>-->
                        <li id="spinningTRaining"><a>INSERT SPINNING TRAINING</a></li>
                        <li id="runningTraining" class="last"><a>INSERT RUNNING TRAINING</a></li>
                    </ul>			
                    <div class="clear"></div>
                </li>
                <li class="last"><a href="#">STATISTICS</a></li>
            </ul>
        </header>

        <nav>
        </nav>

        <?php
        // put your code here
        include './InitSession.php';
        $initSession = new InitSession();
        $initSession->init();
        ?>
        <div id="center">
            
            <!-- deprecated login
            <div>LOGIN</div>
            Username = <input type="text" id="username1" /><br/>
            Password = <input type="text" id="password1" /><br/>
            <input type="button" id="button_idq" value="SIGN IN" />
            -->

            <section class="login">
                <div class="titulo">User Login</div>
                <form>
                    <input type="text" id="username" required title="Username required" placeholder="Username" data-icon="U">
                    <input type="password" id="password" required title="Password required" placeholder="Password" data-icon="x">
                    <div class="olvido">
                        <div class="col"><a href="#" title="Ver Carásteres">Register</a></div>
                        <div class="col"><a href="#" title="Recuperar Password">Fotgot Password?</a></div>
                    </div>
                    <a id="button_id" class="enviar">Sign in</a>
                </form>
            </section>

            <script>
                $('[id=button_id]').click(function() {
                    doLogin($('[id=username]').val(), $('[id=password]').val());
                });

                $('[id=insertWorkout]').click(function() {
                    toInsertWorkout();
                });

                $('[id=home]').click(function() {
                    toHOME();
                });
                
                $('[id=runningTraining]').click(function (){
                    toInsertRunningTraining();
                });
                
                $('[id=spinningTRaining]').click(function (){
                    toInsertSpinningTraining();
                });
            </script>
        </div>

        <footer>
            FOOTER
        </footer>

    </body>
</html>
