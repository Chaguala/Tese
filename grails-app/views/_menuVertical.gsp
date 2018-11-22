%{--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">--}%
%{--<html>--}%
%{--<head>--}%
    %{--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--}%
    %{--<title>Vertical submenu</title>--}%
    %{--<g:javascript src="jquery.js"/>--}%

    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'menucss.css')}"/>--}%
    %{--<g:javascript src="jqanimation.js"/>--}%
    %{--<g:javascript src="MenuJquery.js"/>--}%

    %{--<script language="JavaScript">--}%
        %{--$(document).ready(function () {--}%
            %{--$('#vmenu').vmenu();--}%
        %{--});--}%
    %{--</script>--}%

%{--</head>--}%

%{--<body>--}%

%{--<div id="all">--}%

    %{--<ul id="navegation">--}%

        %{--<div id="MenuHeader"><label class="menuh1">Menu</label></div>--}%

        %{--<!-- Registo Geral -->--}%
        %{--<li><g:link controller="login"><g:message code="menu.inicio.label" default="Inicio"/></g:link></li>--}%
        %{--ROLE_REQUERENTE--}%
        %{--<sec:ifAllGranted roles="ROLE_REQUERENTE">--}%
        %{--<li><a href="#">Requerente</a>--}%
            %{--<ul>--}%
                %{--<!-- Requerente -->--}%
                    %{--<li>--}%
                        %{--<g:link controller="requerente"><g:message code="menu.registo.q.label"--}%
                                                                   %{--default="Registar Requerente"/></g:link>--}%
                    %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="prePedido"><g:message code="menu.registo.q.label"--}%
                                                               %{--default="Submeter Pedido"/></g:link>--}%
                %{--</li>--}%

                %{--<li>--}%
                    %{--<g:link controller="prePedido" action="listRequerentes"><g:message code="menu.registo.q.label"--}%
                                                               %{--default="Lista de Requerentes"/></g:link>--}%
                %{--</li>--}%

                %{--<li>--}%
                    %{--<g:link controller="localizacaoGeografica" action="index"><g:message code="menu.registo.q.label"--}%
                                                                                         %{--default="Localizacao do DUAT"/></g:link>--}%
                    %{--<a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>--}%
                %{--</li>--}%

                %{--<li><a href="#">Outros pedidos</a>--}%
                    %{--<ul>--}%
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
            %{--</ul>--}%
        %{--</li>--}%
        %{--</sec:ifAllGranted>--}%
        %{--,ROLE_CADASTRO--}%
        %{--<sec:ifAllGranted roles="ROLE_CADASTRO">--}%
        %{--<li>--}%
            %{--<g:link controller="municipe"><g:message code="menu.registo.q.label"--}%
                                                     %{--default="Municipe"/></g:link>--}%
        %{--</li>--}%

    %{--<!-- Sistema de Atribuicao de DUATs -->--}%
        %{--<li><a href="#">Atribuicao de DUAT's</a>--}%
            %{--<ul>--}%
                %{--<li>--}%
                    %{--<g:link controller="actividade"><g:message code="menu.registo.q.label"--}%
                                                               %{--default="Actividade"/></g:link>--}%
                %{--</li>--}%
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
                    %{--<g:link controller="proprietario"><g:message code="menu.registo.q.label"--}%
                                                            %{--default="Proprietario"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="nivel"><g:message code="menu.registo.q.label"--}%
                                                                 %{--default="Nivel de Parecer"/></g:link>--}%
                %{--</li>--}%
            %{--</ul>--}%
        %{--</li>--}%

            %{--<li><a href="#">Par&acirc;metros de Localiza&ccedil;&atilde;o</a>--}%
                %{--<ul>--}%
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

                    %{--<li>--}%
                        %{--<g:link controller="postoAdministrativo"><g:message--}%
                                %{--code="menu.parametros.localizacao.postoAdministrativo.label"--}%
                                %{--default="Posto Administrativo"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="localidade"><g:message code="menu.parametros.localizacao.localidade.label"--}%
                                                                   %{--default="Localidade"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="bairro"><g:message code="menu.parametros.localizacao.bairro.label"--}%
                                                               %{--default="Bairro"/></g:link>--}%
                    %{--</li>--}%
                %{--</ul>--}%
            %{--</li>--}%
        %{--</sec:ifAllGranted>--}%
        %{--,ROLE_FISCAL_CAMPO--}%
        %{--<sec:ifAllGranted roles="ROLE_FISCAL_CAMPO">--}%
            %{--<li><a href="#">Requerente</a>--}%
                %{--<ul>--}%
                    %{--<!-- Requerente -->--}%
                    %{--<li>--}%
                        %{--<g:link controller="requerente"><g:message code="menu.registo.q.label"--}%
                                                                   %{--default="Registar Requerente"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                    %{--<g:link controller="prePedido"><g:message code="menu.registo.q.label"--}%
                    %{--default="Submeter Pedido"/></g:link>--}%
                    %{--</li>--}%

                    %{--<li>--}%
                        %{--<g:link controller="prePedido" action="listRequerentes"><g:message code="menu.registo.q.label"--}%
                                                                                           %{--default="Lista de Requerentes"/></g:link>--}%
                    %{--</li>--}%

                    %{--<li>--}%
                        %{--<g:link controller="localizacaoGeografica" action="index"><g:message code="menu.registo.q.label"--}%
                        %{--default="Localizacao do DUAT"/></g:link>--}%
                        %{--<a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>--}%
                    %{--</li>--}%

                    %{--<li><a href="#">Outros pedidos</a>--}%
                        %{--<ul>--}%
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
                %{--</ul>--}%
            %{--</li>--}%
                    %{--<li><a href="#">Pedidos</a>--}%
                        %{--<ul>--}%
                            %{--<li>--}%
                                %{--<g:link controller="pedido"><g:message code="menu.registo.q.label"--}%
                                                                        %{--default="Lista de Pedido Confirmados"/></g:link>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<g:link controller="pedido" action="listPedidos"><g:message code="menu.registo.q.label"--}%
                                                                                             %{--default="Adicionar Novos Pedidos"/></g:link>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<g:link controller="localizacaoGeografica"><g:message code="menu.registo.q.label"--}%
                                                                                             %{--default="Visualizar Maps"/></g:link>--}%

                                %{--<a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>--}%
                            %{--</li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
        %{--</sec:ifAllGranted>--}%
        %{--,ROLE_PARECER--}%
        %{--<sec:ifAllGranted roles="ROLE_PARECER">--}%
                %{--<li><a href="#">Registar Parecer</a>--}%
                    %{--<ul>--}%
                        %{--<li>--}%
                            %{--<g:link controller="parecer"><g:message code="menu.registo.q.label"--}%
                                                                    %{--default="Lista de Pareceres"/></g:link>--}%
                        %{--</li>--}%
                        %{--<li>--}%
                            %{--<g:link controller="parecer" action="listPedidos"><g:message code="menu.registo.q.label"--}%
                                                                                         %{--default="Adicionar Parecer"/></g:link>--}%
                        %{--</li>--}%

                        %{--<li>--}%
                            %{--<g:link controller="localizacaoGeografica"><g:message code="menu.registo.q.label"--}%
                            %{--default="Visualizar Maps"/></g:link>--}%

                            %{--<a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>--}%
                        %{--</li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
        %{--</sec:ifAllGranted>--}%

        %{--ROLE_DESPACHO--}%
        %{--<sec:ifAllGranted roles="ROLE_DESPACHO">--}%
            %{--<li><a href="#">Despacho</a>--}%
                %{--<ul>--}%
                    %{--<li>--}%
                        %{--<g:link controller="despachoPresidente"><g:message code="menu.registo.q.label"--}%
                                                               %{--default="Lista de Despacho"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="despachoPresidente" action="listPedidosComPareceres"><g:message code="menu.registo.q.label"--}%
                                                                                    %{--default="Novo Despacho"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="localizacaoGeografica"><g:message code="menu.registo.q.label"--}%
                        %{--default="Visualizar Maps"/></g:link>--}%

                        %{--<a href="http://localhost/SIGEM.requerente/geo.php">Localizacao do DUAT</a>--}%
                    %{--</li>--}%
                %{--</ul>--}%
            %{--</li>--}%

        %{--</sec:ifAllGranted>--}%

        %{--<!-- Sistema de Pagamento de IPA -->--}%
        %{--<li><a href="#">Pagamento de IPA</a>--}%
            %{--<ul>--}%
                %{--<li>--}%
                    %{--<g:link controller="pagamentoipa"><g:message code="menu.registo.2.label"--}%
                                                              %{--default="Pagamento de IPA"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="taxaIPA"><g:message code="menu.registo.3.label"--}%
                                                             %{--default="Taxa do IPA"/></g:link>--}%
                %{--</li>--}%
            %{--</ul>--}%
        %{--</li>--}%

        %{--<!-- Sistema de Pagamento de IPRA -->--}%
        %{--<li><a href="#">Pagamento de IPRA</a>--}%
            %{--<ul>--}%
                %{--<li>--}%
                    %{--<g:link controller="imovel"><g:message code="menu.registo.q.label"--}%
                                                               %{--default="Imovel"/></g:link>--}%
                %{--</li>--}%

                %{--<li>--}%
                    %{--<g:link controller="pagamentoipra"><g:message code="menu.registo.2.label"--}%
                                                              %{--default="Pagamento de IPRA"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="taxaipra"><g:message code="menu.registo.3.label"--}%
                                                             %{--default="Taxa do IPRA"/></g:link>--}%
                %{--</li>--}%
            %{--</ul>--}%
        %{--</li>--}%

        %{--<!-- Sistema de Pagamento de TAI -->--}%
        %{--<li><a href="#">Pagamento da TAI</a>--}%
            %{--<ul>--}%
                %{--<li>--}%
                    %{--<g:link controller="pagamentotai"><g:message code="menu.registo.2.label"--}%
                                                              %{--default="Pagamento da TAI"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="taxatai"><g:message code="menu.registo.3.label"--}%
                                                             %{--default="Taxa TAI"/></g:link>--}%
                %{--</li>--}%
            %{--</ul>--}%
        %{--</li>--}%

        %{--<!-- Sistema de Impostos Sobre Veiculos -->--}%
        %{--<li><a href="#">Impostos Sobre Veiculos</a>--}%
            %{--<ul>--}%
                %{--<li>--}%
                    %{--<g:link controller="veiculo"><g:message code="menu.registo.q.label"--}%
                                                               %{--default="Veiculo"/></g:link>--}%
                %{--</li>--}%

                %{--<li>--}%
                    %{--<g:link controller="marca"><g:message code="menu.registo.2.label"--}%
                                                              %{--default="Marca"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="modelo"><g:message code="menu.registo.3.label"--}%
                                                             %{--default="Modelo"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="tipoVeiculo"><g:message code="menu.registo.3.label"--}%
                                                           %{--default="Tipo de Veiculos"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="tipoTrassao"><g:message code="menu.registo.3.label"--}%
                                                           %{--default="Tipo de Trassao"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="tipoCombustivel"><g:message code="menu.registo.3.label"--}%
                                                           %{--default="Tipo de Combustivel"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="tipoSeguro"><g:message code="menu.registo.3.label"--}%
                                                                    %{--default="Tipo de Seguro"/></g:link>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<g:link controller="seguradora"><g:message code="menu.registo.3.label"--}%
                                                               %{--default="Seguradora"/></g:link>--}%
                %{--</li>--}%
            %{--</ul>--}%
        %{--</li>--}%
        %{--,ROLE_DESPACHO--}%
        %{--<sec:ifAllGranted roles="ROLE_ADMIN">--}%
            %{--<li><a href="#">Estatisticas e Relatorios</a>--}%
                %{--<ul>--}%
                    %{--<li>--}%
                        %{--<g:link controller="#"><g:message--}%
                                %{--code="menu.relatorio.1.label"--}%
                                %{--default="Relatorio 1"/></g:link>--}%
                        %{--<g:link controller="#"><g:message--}%
                                %{--code="menu.relatorio.documento.imprimir.label"--}%
                                %{--default="Relatorio 2"/></g:link>--}%
                    %{--</li>--}%
                %{--</ul>--}%
            %{--</li>--}%
        %{--</sec:ifAllGranted>--}%

        %{--<sec:ifAllGranted roles="ROLE_ADMIN">--}%
            %{--<li><a href="#">Par&acirc;metros do Sistema</a>--}%
                %{--<ul>--}%

                    %{--<li>--}%
                        %{--<g:link controller="#"><g:message--}%
                                %{--code="menu.parametros.1.label"--}%
                                %{--default="Parametros X"/></g:link>--}%
                    %{--</li>--}%

                    %{--<li>--}%
                        %{--<g:link controller="#"><g:message--}%
                                %{--code="menu.parametros.2.label"--}%
                                %{--default="Parametros X"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="#"><g:message--}%
                                %{--code="menu.parametros.3.label"--}s%--}%
                                %{--default="Parametros X"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="#"><g:message--}%
                                %{--code="menu.parametros.4.label"--}%
                                %{--default="Parametros X"/></g:link>--}%
                    %{--</li>--}%
                %{--</ul>--}%
            %{--</li>--}%
            %{--<li><a href="#">Gest&atilde;o de Utilizadores</a>--}%
                %{--<ul>--}%
                    %{--<li>--}%
                        %{--<g:link controller="SecRole"><g:message code="menu.gestao.utilizadores.grupo.label"--}%
                                                                %{--default="Grupo de Utilizador"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="classificacaoEntidade"><g:message--}%
                                %{--code="menu.gestao.utilizadores.classificacao.label"--}%
                                %{--default="Classificação de Entidades"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="requestmap"><g:message--}%
                                %{--code="menu.gestao.utilizadores.permissoes.label"--}%
                                %{--default="Premissões"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="SecUser"><g:message code="menu.gestao.utilizadores.usuarios.label"--}%
                                                                %{--default="Usuarios"/></g:link>--}%
                    %{--</li>--}%
                    %{--<li>--}%
                        %{--<g:link controller="auditLogEvent"><g:message--}%
                                %{--code="menu.gestao.utilizadores.auditoria.label"--}%
                                %{--default="Auditoria"/></g:link>--}%
                    %{--</li>--}%

                %{--</ul>--}%
            %{--</li>--}%
        %{--</sec:ifAllGranted>--}%
        %{--<div id="MenuFooter"><label class="menuf1"></label></div>--}%
    %{--</ul>--}%
%{--</div>--}%

%{--</body>--}%
%{--</html>--}%

<!-- left menu starts -->
<div class="col-sm-2 col-lg-2">
    <div class="sidebar-nav">
        <div class="nav-canvas">
            <div class="nav-sm nav nav-stacked">

            </div>
            <ul class="nav nav-pills nav-stacked main-menu">
                <li class="nav-header">Principal</li>
                <li><a class="ajax-link" href="index.html"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
                </li>

                <li><a class="ajax-link" href="form.html"><i
                        class="glyphicon glyphicon-edit"></i><span> Forms</span></a></li>

                <li><a class="ajax-link" href="typography.html"><i class="glyphicon glyphicon-font"></i><span> Typography</span></a>
                </li>


                <li><a class="ajax-link" href="table.html"><i
                        class="glyphicon glyphicon-align-justify"></i><span> Tables</span></a></li>
                <li class="accordion">
                    <a href="#"><i class="glyphicon glyphicon-plus"></i><span> Localizar DUAT</span></a>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#">Por coordenadas</a></li>
                        <li><a href="#">Por Numero do Pedido</a></li>
                    </ul>
                </li>
                <li><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span> Calendar</span></a>
                </li>
                <li><a class="ajax-link" href="grid.html"><i
                        class="glyphicon glyphicon-th"></i><span> Grid</span></a></li>
            </ul>
        </div>
    </div>
</div>
<!--/span-->
<!-- left menu ends -->