
<%@ page import="org.chaguala.sigem.taxaipa.TaxaIPA" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'taxaipa.label', default: 'Pedido')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'default.list.label', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="Pedido"/>
    </div>

    <div id="list-taxaipa" class="content scaffold-list" role="main">

        <h3 id="titulo"><g:message code="default.list.label" args="[entityName]"/></h3>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Pedido"
                               titleKey="fp.tag.filterPane.titleText"/>

        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id"
                                  title="${message(encodeAs: 'JavaScript',code: 'taxaipa.id.label', default: 'ID')}"/>

                <g:sortableColumn property="numero"
                                  title="${message(encodeAs: 'JavaScript',code: 'taxaipa.deidadex.label', default: 'De Idade X')}"/>

                <g:sortableColumn property="aidadey"
                                  title="${message(encodeAs: 'JavaScript',code: 'taxaipa.aidadey.label', default: 'A Idade Y')}"/>

                <g:sortableColumn property="valor"
                                  title="${message(encodeAs: 'JavaScript',code: 'taxaipa.valor.label', default: 'Valor')}"/>

                <g:sortableColumn property="observacao"
                                  title="${message(encodeAs: 'JavaScript',code: 'taxaipa.observacao.label', default: 'Observacao')}"/>


            </tr>
            </thead>
            <tbody>
            <g:each in="${taxaipaInstanceList}" status="i" var="taxaipaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${taxaipaInstance.id}">${fieldValue(bean: taxaipaInstance, field: "id")}</g:link></td>

                    <td><g:link action="show"
                                id="${taxaipaInstance.id}">${fieldValue(bean: taxaipaInstance, field: "deidadex")}</g:link></td>

                    <td><g:link action="show"
                                id="${taxaipaInstance.id}">${fieldValue(bean: taxaipaInstance, field: "aidadey")}</g:link></td>

                    <td><g:link action="show"
                                id="${taxaipaInstance.id}">${fieldValue(bean: taxaipaInstance, field: "valor")}</g:link></td>

                    <td><g:link action="show"
                                id="${taxaipaInstance.id}">${fieldValue(bean: taxaipaInstance, field: "observacao")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${taxaipaInstanceTotal}"/>
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
