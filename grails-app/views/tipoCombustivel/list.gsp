
<%@ page import="org.chaguala.sigem.tipocombustivel.TipoCombustivel" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'tipocombustivel.label', default: 'TipoCombustivel')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="TipoCombustivel"/>
    </div>

    <div id="list-tipocombustivel" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="TipoCombustivel"
                               titleKey="fp.tag.filterPane.titleText"/>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'tipocombustivel.id.label', default: 'Id')}"/>

                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'tipocombustivel.designacao.label', default: 'Designacao')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${tipocombustivelList}" status="i" var="tipocombustivelInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${tipocombustivelInstance.id}">${fieldValue(bean: tipocombustivelInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${tipocombustivelInstance.id}">${fieldValue(bean: tipocombustivelInstance, field: "designacao")}</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${tipocombustivelInstanceTotal}"/>
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
