
<%@ page import="org.chaguala.sigem.tipoveiculo.TipoVeiculo" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'tipoveiculo.label', default: 'TipoVeiculo')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="TipoVeiculo"/>
    </div>

    <div id="list-tipoveiculo" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="TipoVeiculo"
                               titleKey="fp.tag.filterPane.titleText"/>
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'tipoveiculo.id.label', default: 'Id')}"/>

                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'tipoveiculo.designacao.label', default: 'Designacao')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${tipoveiculoInstanceList}" status="i" var="tipoveiculoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${tipoveiculoInstance.id}">${fieldValue(bean: tipoveiculoInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${tipoveiculoInstance.id}">${fieldValue(bean: tipoveiculoInstance, field: "designacao")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${tipoveiculoInstanceTotal}"/>
                        <filterpane:filterButton textKey="fp.tag.filterButton.text"
                                                 appliedTextKey="fp.tag.filterButton.appliedText"
                                                 text="Filtro de Pesquisa" appliedText="Alterar Resultados de Pesquisa"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView></body>
</html>
