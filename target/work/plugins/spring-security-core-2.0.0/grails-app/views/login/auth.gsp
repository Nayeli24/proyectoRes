
<!--author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenido Mesa de Ayuda</title>
        <!-- metatags-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Magnificent login form a Flat Responsive Widget,Login form widgets, Sign up Web 	forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
            <!-- Meta tag Keywords -->
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/><!--stylesheet-css-->
        <link rel="stylesheet" href="../css/font-awesome.css"><!--fontawesome-->
        <link href="..///fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet"><!--online fonts-->
        <link href="..///fonts.googleapis.com/css?family=Raleway" rel="stylesheet"><!--online fonts-->
    </head>
    <body>
        <div class="w3ls-main">
            <div class="wthree-heading">
                <h1>Bienvenido</h1>
            </div>
            <div class="wthree-container">
                <div class="wthree-form">
                    <div class="agileits-2">
                        <h2>login</h2>
                    </div>
                    <g:if test='${flash.message}'>
                        <div style="color: #ffffff" class='login_message'>${flash.message}</div>
                    </g:if>

                    <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                        <div class="w3-user">
                            <span><i class="fa fa-user-o" aria-hidden="true"></i></span>
                            <input type='text' class='text_' name='j_username' id='username' placeholder="Username"/>

                        </div>
                        <div class="clear"></div>
                        <div class="w3-psw">
                            <span><i class="fa fa-key" aria-hidden="true"></i></span>
                            <input type='password' class='text_' name='j_password' id='password' placeholder="Password" required=""/>

                        </div>

                        <div class="clear"></div>
                        <div class="w3l">
                            <p id="remember_me_holder">
                                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                <label style="color: #ffffff" for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                            </p>
                            <p>
                            </p>
                        </div>
                        <div class="clear"></div>
                        <div class="w3l-submit">
                            <input type="submit" id="submit" value='${message(code: "springSecurity.login.button")}'/>
                        </div>
                        <div class="clear"></div>
                    </form>
                </div>
            </div>
        </div>
        <div class="agileits-footer">
                <p>&copy; Mesa Ayuda. All Rights Reserved </p>
        </div>
    </body>
</html>


