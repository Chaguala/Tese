
<%@ page import="org.chaguala.sigem.seguranca.ClassificacaoEntidade" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(encodeAs: 'JavaScript', code: 'classificacaoEntidade.label', default: 'ClassificacaoEntidade')}"/>
    <title><g:message code="Classificacao Entidade" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript', code: 'Classificacao Entidade', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="ClassificacaoEntidade"/>
    </div>
%{--<a href="#list-classificacaoEntidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--default="Skip to content&hellip;"/></a>--}%


%{--<div id="nav" class="nav" role="navigation">--}%
%{--<nav:render group="ClassificacaoEntidade"/>--}%
%{--</div>--}%

    <div id="titulo">
        <h4><g:message code="Listagem de Classificacao Entidade" args="[entityName]"/></h4>
    </div>

    <div id="list-classificacaoEntidade" class="content scaffold-list" role="main">
        %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div>
            %{--<b>${message(encodeAs: 'JavaScript', code: 'listagem.label', default: 'Listagem')}</b>--}%
            <hr class="thin"/>
        </div>

        <filterpane:filterPane domain="ClassificacaoEntidade"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript', code: 'classificacaoEntidade.designacao.label', default: 'Designacao')}"/>
                
                <g:sortableColumn property="descricao"
                                  title="${message(encodeAs: 'JavaScript', code: 'classificacaoEntidade.descricao.label', default: 'Descricao')}"/>
                
            </tr>
            </thead>
            <tbody>
            <g:each in="${classificacaoEntidadeInstanceList}" status="i" var="classificacaoEntidadeInstance">
                <tr class="${(i % 2) == 0 ? 'dbodd' : 'dbeven'}" onMouseOver="this.className = 'dbhover';" onMouseOut="this.className = '${(i % 2) == 0 ? 'dbodd' : 'dbeven'}';">
                    <td><g:link action="show"
                                id="${classificacaoEntidadeInstance.id}">${fieldValue(bean: classificacaoEntidadeInstance, field: "designacao")}</g:link></td>
                    
                    <td>${fieldValue(bean: classificacaoEntidadeInstance, field: "descricao")}</td>
                    
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        %{--<g:if test="${combatenteInstanceTotal>10}">--}%
                        <filterpane:filterButton text="Pesquisa" />
                        %{--</g:if>--}%
                        <filterpane:paginate params="${params}" total="${classificacaoEntidadeInstanceTotal}"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
