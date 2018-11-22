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

    <jqui:resources/>
    <r:require module="filterpane"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <g:javascript library="jquery"/>
    <r:require module="jquery"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

    <![endif]-->

    <link rel="icon" sizes="114x114" href="${resource(dir: 'img', file: 'favicon.ico')}">

    %{--for google mapping--}%

    <style>
    /* Always set the map height explicitly to define the size of the div
     * element that contains the map. */
    #map {
        height: 100%;
    }
    /* Optional: Makes the sample page fill the window. */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    </style>

</head>

<body>
<!-- topbar starts -->
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-inner">
        <button type="button" class="navbar-toggle pull-left animated flip">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"> <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/>
            <span>SIGEM</span></a>

        <!-- user dropdown starts -->
        <div class="btn-group pull-right">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                %{--<li><a href="#">Perfil</a></li>--}%
                <li>
                    %{--<a href="#">Perfil</a>--}%
                    <g:link>
                        <g:message code="default.user.logged.label" default="Perfil do ["/> <sec:loggedInUserInfo field="username"/>]
                    </g:link>
                </li>
                <li class="divider"></li>
                %{--<li><a href="http://localhost:8081/SIGEM/login/auth">Logout</a></li>--}%
                <li>
                    <sec:ifLoggedIn>
                        <g:link controller="logout"><g:message code="login.logout.label" default="Logout"/></g:link>
                    </sec:ifLoggedIn>
                </li>
            </ul>
        </div>
        <!-- user dropdown ends -->

        <!-- theme selector starts -->
        <div class="btn-group pull-right theme-container animated tada">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-tint"></i><span
                    class="hidden-sm hidden-xs"> Selecionar Temas</span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" id="themes">
                <li><a data-value="classic" href=""><i class="whitespace"></i> Classic</a></li>
                <li><a data-value="cerulean" href=""><i class="whitespace"></i> Cerulean</a></li>
                <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
            </ul>
        </div>
        <!-- theme selector ends -->

        <ul class="collapse navbar-collapse nav navbar-nav top-menu">
        %{--<li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visitantes</a></li>--}%
        %{--<li class="dropdown">--}%
        %{--<a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i> Menus <span--}%
        %{--class="caret"></span></a>--}%
        %{--<ul class="dropdown-menu" role="menu">--}%
        %{--<li><a href="#">Action</a></li>--}%
        %{--<li><a href="#">Another action</a></li>--}%
        %{--<li><a href="#">Something else here</a></li>--}%
        %{--<li class="divider"></li>--}%
        %{--<li><a href="#">Separated link</a></li>--}%
        %{--<li class="divider"></li>--}%
        %{--<li><a href="#">One more separated link</a></li>--}%
        %{--</ul>--}%
        %{--</li>--}%
            <sec:ifAllGranted roles="ROLE_CADASTRO">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i>Parametros de Localizacao<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            %{--<a href="#">Pais</a>--}%
                            <g:link controller="pais"><g:message code="menu.registo.q.label"
                                                                 default="Pais"/></g:link>
                        </li>
                        <li>
                            <g:link controller="provincia"><g:message code="menu.registo.q.label"
                                                                      default="Provincia"/></g:link>
                            %{--<a href="#">Provincia</li>--}%
                        </li>
                        <li class="divider"></li>

                        <li>
                            %{--<a href="#">Distrito</a>--}%
                            <g:link controller="distrito"><g:message code="menu.registo.q.label"
                                                                     default="Distrito"/></g:link>
                        </li>
                        <li>
                            %{--<a href="#">Cidade</a>--}%
                            <g:link controller="cidade"><g:message code="menu.registo.q.label"
                                                                   default="Cidade"/></g:link>
                        </li>
                        <li class="divider"></li>
                        <li>
                            %{--<a href="#">Posto Administrativo</a>--}%
                            <g:link controller="postoAdministrativo"><g:message code="menu.registo.q.label"
                                                                                default="Posto Administrativo"/></g:link>
                        </li>
                        <li class="divider"></li>
                        <li>
                            %{--<a href="#">Bairro</a>--}%
                            <g:link controller="bairro"><g:message code="menu.registo.q.label"
                                                                   default="Bairro"/></g:link>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i>Cadastro<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            %{--<a href="#">Actividade</a>--}%
                            <g:link controller="actividade"><g:message code="menu.registo.q.label"
                                                                       default="Actividade"/></g:link>
                        </li>
                        <li class="divider"></li>

                        <li>
                            <g:link controller="tipoPedido"><g:message code="menu.registo.q.label"
                                                                       default="Tipo de Pedido"/></g:link>
                        </li>
                        <li>
                            <g:link controller="despacho"><g:message code="menu.registo.q.label"
                                                                     default="Tipo de Despacho"/></g:link>
                        </li>
                        <li>
                            <g:link controller="tipoDocumento"><g:message code="menu.registo.q.label"
                                                                          default="Tipo de Documento"/></g:link>
                        </li>

                        <li class="divider"></li>
                        <li>
                            <g:link controller="nivel"><g:message code="menu.registo.q.label"
                                                                  default="Nivel de Parecer"/></g:link>
                        </li>
                    </ul>
                </li>
            </sec:ifAllGranted>

            <sec:ifAllGranted roles="ROLE_REQUERENTE">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i>Outros pedido<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Atestado de Residencia</a></li>
                        <li><a href="#">Declaracao de Bairro</li>
                        <li class="divider"></li>
                        <li><a href="#">Localizacao do DUAT</a></li>
                    </ul>
                </li>
            </sec:ifAllGranted>

        <sec:ifAllGranted roles="ROLE_FISCAL_CAMPO">
            <li class="dropdown">
                <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i>Relatorios<span
                        class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <g:link controller="pedido" action="list"><g:message code="menu.registo.q.label"
                                                          default="Lista de pedidos registados"/></g:link>
                    </li>
                    <li class="divider"></li>

                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats com despacho positivo"/></g:link>
                    </li>
                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats com despacho negativo"/></g:link>
                    </li>
                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats que completaram dois anos"/></g:link>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats revogados"/></g:link>
                    </li>
                </ul>
            </li>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_DESPACHO">
            <li class="dropdown">
                <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i>Relatorios<span
                        class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <g:link controller="pedido" action="list"><g:message code="menu.registo.q.label"
                                                                             default="Lista de pedidos registados"/></g:link>
                    </li>
                    <li class="divider"></li>

                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats com despacho positivo"/></g:link>
                    </li>
                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats com despacho negativo"/></g:link>
                    </li>
                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats que completaram dois anos"/></g:link>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <g:link controller="#"><g:message code="menu.registo.q.label"
                                                          default="Lista de duats revogados"/></g:link>
                    </li>
                </ul>
            </li>
        </sec:ifAllGranted>

            <li>
                <form class="navbar-search pull-left">
                    <input placeholder="Pesquisar" size="32" class="search-query form-control col-md-10" name="query"
                           type="text">
                </form>
            </li>
        </ul>

    </div>
</div>
<!-- topbar ends -->
<div class="ch-container">
    <div class="row">

        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">Principal</li>
                        <li>
                            <a class="ajax-link" href="#"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
                        </li>

                    <sec:ifAllGranted roles="ROLE_REQUERENTE">
                    %{--<li><a href="#">Requerente</a>--}%
                        <ul class="nav nav-pills nav-stacked main-menu">
                            <!-- Requerente -->
                            <li>
                                <g:link controller="requerente"><g:message code="menu.registo.q.label"
                                                                           default="Registar Requerente"/></g:link>
                            </li>

                            <li>
                                <g:link controller="prePedido" action="listRequerentes"><g:message code="menu.registo.q.label"
                                                                                                   default="Submeter Pedido"/></g:link>
                            </li>

                            %{--<li>--}%
                                %{--<g:link controller="prePedido"><g:message code="menu.registo.q.label"--}%
                                                                          %{--default="Lista de pedidos"/></g:link>--}%
                            %{--</li>--}%
                            %{--<li><a href="#">Outros pedidos</a>--}%
                            %{--<ul class="nav nav-pills nav-stacked main-menu">--}%
                            %{--<li>--}%
                            %{--<g:link controller="#" action="#"><g:message code="menu.registo.q.label"--}%
                            %{--default="Atestado de Residencia"/></g:link>--}%
                            %{--</li>--}%

                            %{--<li>--}%
                            %{--<g:link controller="#" action="#"><g:message code="menu.registo.q.label"--}%
                            %{--default="Declaracao de Bairro"/></g:link>--}%
                            %{--</li>--}%
                            %{--</ul>--}%
                            %{--</li>--}%
                        </ul>

                    %{--<li>--}%
                    %{--<a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>--}%
                    %{--</li>--}%
                    %{--</li>--}%
                    </sec:ifAllGranted>
                %{--ROLE_CADASTRO--}%
                    <sec:ifAllGranted roles="ROLE_CADASTRO">
                        <!-- Sistema de Atribuicao de DUATs -->
                        %{--<li><a href="#">Cadastro</a>--}%
                            <ul class="nav nav-pills nav-stacked main-menu">
                                <li>
                                    <g:link controller="actividade"><g:message code="menu.registo.q.label"
                                                                               default="Actividade"/></g:link>
                                </li>
                                %{--<li>--}%
                                %{--<g:link controller="tipoPedido"><g:message code="menu.registo.q.label"--}%
                                %{--default="Tipo de Pedido"/></g:link>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                %{--<g:link controller="despacho"><g:message code="menu.registo.q.label"--}%
                                %{--default="Tipos de Despacho"/></g:link>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                %{--<g:link controller="tipoDocumento"><g:message code="menu.registo.q.label"--}%
                                %{--default="Tipo de Documento"/></g:link>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                %{--<g:link controller="nivel"><g:message code="menu.registo.q.label"--}%
                                %{--default="Nivel de Parecer"/></g:link>--}%
                                %{--</li>--}%
                            </ul>
                        %{--</li>--}%

                    %{--<li><a href="#">Par&acirc;metros de Localiza&ccedil;&atilde;o</a>--}%
                        <ul class="nav nav-pills nav-stacked main-menu">
                            %{--<li>--}%
                            %{--<g:link controller="pais"><g:message code="menu.parametros.localizacao.Pais.label"--}%
                            %{--default="País"/></g:link>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                            %{--<g:link controller="provincia"><g:message code="menu.parametros.localizacao.provincia.label"--}%
                            %{--default="Província"/></g:link>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                            %{--<g:link controller="distrito"><g:message code="menu.parametros.localizacao.distrito.label"--}%
                            %{--default="Distrito"/></g:link>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                            %{--<g:link controller="cidade"><g:message code="menu.parametros.localizacao.cidade.label"--}%
                            %{--default="Cidade"/></g:link>--}%
                            %{--</li>--}%

                            <li>
                                <g:link controller="postoAdministrativo"><g:message
                                        code="menu.parametros.localizacao.postoAdministrativo.label"
                                        default="Posto Administrativo"/></g:link>
                            </li>
                            <li>
                                <g:link controller="localidade"><g:message code="menu.parametros.localizacao.localidade.label"
                                                                           default="Localidade"/></g:link>
                            </li>
                            <li>
                                <g:link controller="bairro"><g:message code="menu.parametros.localizacao.bairro.label"
                                                                       default="Bairro"/></g:link>
                            </li>
                        </ul>
                    %{--</li>--}%
                    </sec:ifAllGranted>

                %{--,ROLE_FISCAL_CAMPO--}%
                    <sec:ifAllGranted roles="ROLE_FISCAL_CAMPO">
                    %{--<li><a href="#">Requerente</a>--}%
                    %{--<ul class="nav nav-pills nav-stacked main-menu">--}%
                    %{--<!-- Requerente -->--}%
                    %{--<li>--}%
                    %{--<g:link controller="requerente"><g:message code="menu.registo.q.label"--}%
                    %{--default="Registar Requerente"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                    %{--<g:link controller="prePedido"><g:message code="menu.registo.q.label"--}%
                    %{--default="Submeter Pedido"/></g:link>--}%
                    %{--</li>--}%
                    %{--</ul>--}%
                    %{--</li>--}%
                        <li><a href="#">Pedidos</a>
                            <ul class="nav nav-pills nav-stacked main-menu">
                                <li>
                                    <g:link controller="pedido"><g:message code="menu.registo.q.label"
                                                                           default="Lista de Pedido Confirmados"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="pedido" action="listPedidos"><g:message code="menu.registo.q.label"
                                                                                                default="Adicionar Novos Pedidos"/></g:link>
                                </li>
                                <li>
                                    <a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>
                                </li>
                            </ul>
                        </li>
                    </sec:ifAllGranted>
                %{--,ROLE_PARECER--}%
                    <sec:ifAllGranted roles="ROLE_PARECER">
                        <li><a href="#">Registar Parecer</a>
                            <ul class="nav nav-pills nav-stacked main-menu">
                                <li>
                                    <g:link controller="parecer"><g:message code="menu.registo.q.label"
                                                                            default="Lista de Pareceres"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="parecer" action="listPedidos"><g:message code="menu.registo.q.label"
                                                                                                 default="Adicionar Parecer"/></g:link>
                                </li>

                                <li>
                                    %{--<g:link controller="localizacaoGeografica"><g:message code="menu.registo.q.label"--}%
                                    %{--default="Visualizar Maps"/></g:link>--}%

                                    <a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>
                                </li>
                            </ul>
                        </li>
                    </sec:ifAllGranted>

                %{--ROLE_DESPACHO--}%
                    <sec:ifAllGranted roles="ROLE_DESPACHO">
                        <li><a href="#">Despacho</a>
                            <ul class="nav nav-pills nav-stacked main-menu">
                                <li>
                                    <g:link controller="despachoPresidente"><g:message code="menu.registo.q.label"
                                                                                       default="Lista de Despacho"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="despachoPresidente" action="listPedidosComPareceres"><g:message code="menu.registo.q.label"
                                                                                                                        default="Novo Despacho"/></g:link>
                                </li>
                                <li>
                                    <a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>
                                </li>
                            </ul>
                        </li>

                    </sec:ifAllGranted>

                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li><a href="#">Gest&atilde;o de Utilizadores</a>
                            <ul class="nav nav-pills nav-stacked main-menu">
                                <li>
                                    <g:link controller="SecRole"><g:message code="menu.gestao.utilizadores.grupo.label"
                                                                            default="Grupo de Utilizador"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="classificacaoEntidade"><g:message
                                            code="menu.gestao.utilizadores.classificacao.label"
                                            default="Classificação de Entidades"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="requestmap"><g:message
                                            code="menu.gestao.utilizadores.permissoes.label"
                                            default="Premissões"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="SecUser"><g:message code="menu.gestao.utilizadores.usuarios.label"
                                                                            default="Usuarios"/></g:link>
                                </li>
                                <li>
                                    <g:link controller="auditLogEvent"><g:message
                                            code="menu.gestao.utilizadores.auditoria.label"
                                            default="Auditoria"/></g:link>
                                </li>
                            </ul>
                        </li>
                        </ul>
                    </sec:ifAllGranted>

                    </ul>
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#">Dashboard</a>
                    </li>
                </ul>
            </div>

            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well">
                            <h2><i class="glyphicon glyphicon-info-sign"></i> Sistema de Gestao Municipal</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-setting btn-round btn-default"><i
                                        class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                        class="glyphicon glyphicon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round btn-default"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                            </div>
                        </div>

                        <div id="yui-main">
                            <div class="yui-b">
                                <div class="yui-g">
                                    <g:layoutBody/>
                                </div>
                            </div>
                        </div>


                        <div class="box-content row">
                            <div class="col-lg-5 col-md-12 hidden-xs center-text">
                                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                <!-- Charisma Demo 4 -->
                                <ins class="adsbygoogle"
                                     style="display:inline-block;width:336px;height:280px"
                                     data-ad-client="ca-pub-5108790028230107"
                                     data-ad-slot="9467443105"></ins>
                                <script>
                                    (adsbygoogle = window.adsbygoogle || []).push({});
                                </script>
                            </div>

                            <div class="col-lg-5 col-md-12 visible-xs center-text">
                                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                <!-- Charisma Demo 5 -->
                                <ins class="adsbygoogle"
                                     style="display:inline-block;width:250px;height:250px"
                                     data-ad-client="ca-pub-5108790028230107"
                                     data-ad-slot="8957582309"></ins>
                                <script>
                                    (adsbygoogle = window.adsbygoogle || []).push({});
                                </script>
                            </div>
                            <!-- Ads end -->

                            %{--For rending google maps--}%
                            <div id="map"></div>
                            <script>

                                // This example displays a marker at the center of Australia.
                                // When the user clicks the marker, an info window opens.
                                // The maximum width of the info window is set to 200 pixels.

                                function initMap() {
                                    var uluru = {lat:-25.9655300, lng: 32.5832200};
                                    var map = new google.maps.Map(document.getElementById('map'), {
                                        zoom: 4,
                                        center: uluru
                                    });

                                    var contentString = '<div id="content">'+
                                        '<div id="siteNotice">'+
                                        '</div>'+
                                        '<h1 id="firstHeading" class="firstHeading">Cidade de Maputo</h1>'+
                                        '<div id="bodyContent">'+
                                        '<p>Desenvolvido por Felizardo Lucas Abedenego Chaguala</p>'+
                                        '</div>'+
                                        '</div>';

                                    var infowindow = new google.maps.InfoWindow({
                                        content: contentString,
                                        maxWidth: 200
                                    });

                                    var marker = new google.maps.Marker({
                                        position: uluru,
                                        map: map,
                                        title: 'Uluru (Ayers Rock)'
                                    });
                                    marker.addListener('click', function() {
                                        infowindow.open(map, marker);
                                    });
                                }
                            </script>
                            <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYOXNShEY7WIAafykS9ShKcUtnETR0khA&callback=initMap">
                            </script>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->

</div><!--/fluid-row-->

<!-- Ad, you can remove it -->
<div class="row">
    <div class="col-md-9 col-lg-9 col-xs-9 hidden-xs">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- Charisma Demo 2 -->
        <ins class="adsbygoogle"
             style="display:inline-block;width:728px;height:90px"
             data-ad-client="ca-pub-5108790028230107"
             data-ad-slot="3193373905"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
</div>
<!-- Ad ends -->

<hr>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3>Settings</h3>
            </div>
            <div class="modal-body">
                <p>Here settings can be configured...</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
            </div>
        </div>
    </div>
</div>
</div><!--/.fluid-container-->
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

<div id="footer">
    <g:render template="/rodape"/>
</div>

</body>
</html>
