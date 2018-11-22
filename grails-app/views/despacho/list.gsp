<%@ page import="org.chaguala.sigem.despacho.Despacho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'despacho.label', default: 'Despacho')}"/>
    <title><g:message code="Despacho" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Despacho', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Despacho"/>
    </div>

    <div id="list-despacho" class="content scaffold-list" role="main">

        <h4 id="titulo"><g:message code="Listagem de tipos de despacho" args="[entityName]"/></h4>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Despacho"
                               titleKey="fp.tag.filterPane.titleText"/>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'despacho.id.label', default: 'Id')}"/>

                <g:sortableColumn property="designacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'despacho.designacao.label', default: 'Designacao')}"/>

                <g:sortableColumn property="estado"
                                  title="${message(encodeAs: 'JavaScript',code: 'despacho.estado.label', default: 'Estado')}"/>



            </tr>
            </thead>
            <tbody>
            <g:each in="${despachoInstanceList}" status="i" var="despachoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${despachoInstance.id}">${fieldValue(bean: despachoInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${despachoInstance.id}">${fieldValue(bean: despachoInstance, field: "designacao")}</g:link></td>

                    <td><g:link action="show"
                                id="${despachoInstance.id}">${fieldValue(bean: despachoInstance, field: "estado")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${despachoInstanceTotal}"/>
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
