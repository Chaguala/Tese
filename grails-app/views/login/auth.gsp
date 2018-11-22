<!DOCTYPE html>
<html lang="en">
<head>
    <!--

      Felizardo Chaguala

    -->
    <meta charset="utf-8">
    <title>SIGEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-cerulean.min.css')}" type="text/css">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'charisma-app.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bower_components/fullcalendar/dist', file: 'fullcalendar.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bower_components/fullcalendar/dist', file: 'fullcalendar.print.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bower_components/chosen', file: 'chosen.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bower_components/colorbox/example3', file: 'colorbox.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bower_components/responsive-tables', file: 'responsive-tables.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bower_components/bootstrap-tour/build/css/', file: 'bootstrap-tour.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.noty.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'noty_theme_default.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'elfinder.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'elfinder.theme.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.iphone.toggle.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'uploadify.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'animate.min.css')}" type="text/css">
    <link rel="javascript" href="${resource(dir: 'bower_components/jquery', file: 'jquery.min.js')}" type="text/js">
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="icon" sizes="114x114" href="${resource(dir: 'img', file: 'favicon.ico')}">
</head>

<body>
<div class="ch-container">
    <div class="row">

        <div class="row">
            <div class="col-md-12 center login-header">
                %{--<h2>Bem vindo ao SiGEM</h2>--}%
            </div>
            <!--/span-->
        </div><!--/row-->

        <div class="row">
            <div class="well col-md-5 center login-box">
                <div class="alert alert-info">
                    Digite o <n></n>ome do utilizador e a senha a iniciar.
                </div>
                    <fieldset>
                        <div align="center">
                            <div id="massage">
                                <g:if test='${flash.message}'>
                                    <div class='login_message'>${flash.message}</div>
                                </g:if>
                            </div>

                            <div id="login-box">

                                <div class='inner'>

                                    <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p>
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon"><i class=ut"glyphicon glyphicon-user red"></i></span>
                                                <input type='text' style="width: 480px;margin-right:30px"
                                                       class="form-control" name='j_username'
                                                       id='j_username'
                                                       align="left"
                                                       size="150"
                                                       placeholder="Nome do Utilizador"
                                                       maxlength="2048"/>
                                            </div>
                                        </p>
                                        <p>

                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                                            <input style="width: 460px;margin-right: 30px" name="j_password" type="password"
                                                   class="form-control" title="Password"
                                                   size="150"
                                                    width="100"
                                                    height="100"
                                                   align="left"
                                                   placeholder="Senha do Utilizador"
                                                   maxlength="2048"/>
                                            </div>
                                        </p>
                                        <p>
                                            <input type='submit' value='Login'
                                                   class="btn btn-primary"
                                                   align="left"/>
                                            <br/>
                                        </p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </fieldset>
            </div>
            <!--/span-->
        </div><!--/row-->
    </div><!--/fluid-row-->

</div><!--/.fluid-container-->
<!-- external javascript -->
<!--By: Felizardo Chaguala-->
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>

<!-- external javascript -->
<link rel="javascript" href="${resource(dir: 'bower_components/bootstrap/dist/js', file: 'bootstrap.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.cookie.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'bower_components/moment/min/', file: 'moment.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'bower_components/fullcalendar/dist', file: 'fullcalendar.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'bower_components/chosen/', file: 'chosen.jquery.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'bower_components/colorbox/', file: 'jquery.colorbox-min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.noty.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'bower_components/responsive-tables', file: 'responsive-tables.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'bower_components/bootstrap-tour/build/js', file: 'bootstrap-tour.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.raty.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.iphone.toggle.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.autogrow-textarea.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.uploadify-3.1.min.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'jquery.history.js')}" type="text/js">
<link rel="javascript" href="${resource(dir: 'js', file: 'charisma.js')}" type="text/js">
</body>
</html>
