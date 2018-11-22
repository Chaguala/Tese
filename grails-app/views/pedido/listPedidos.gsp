<%@ page import="org.chaguala.sigem.pedido.PrePedido" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'prePedido.label', default: 'PrePedido')}"/>
    <title><g:message code="PrePedido" args="[entityName]"/></title>
</head>

<body>
<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"
                                                                title="${message(encodeAs: 'JavaScript',code: 'Lista de Pre-pedido', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>
    <div class="nav">
        <nav:render group="PrePedido"/>
    </div>

    <div id="list-prePedido" class="content scaffold-list" role="main">

        <h4 id="titulo"><g:message code="Listagem de Pre - pedidos submetidos" args="[entityName]"/></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="PrePedido"
                               titleKey="fp.tag.filterPane.titleText"/>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" titleKey="prePedido.id" />

                <th><g:message code="prePedido.requerente" default="Requerente" /></th>

                <g:sortableColumn property="tipoproprietario" title="Tipoproprietario" titleKey="prePedido.tipoproprietario" />

                <th><g:message code="prePedido.actidade" default="Actidade" /></th>

                <th><g:message code="prePedido.bairro" default="Bairro" /></th>

                <g:sortableColumn property="datapedido" title="Datapedido" titleKey="prePedido.datapedido" />

                <th><g:message code="prePedido.distrito" default="Distrito" /></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${prePedidoInstanceList}" status="i" var="prePedidoInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="create" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "id")}</g:link></td>
                    <td><g:link action="create" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "requerente")}</g:link></td>
                    <td><g:link action="create" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "tipoproprietario")}</g:link></td>
                    <td><g:link action="create" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "actidade")}</g:link></td>
                    <td><g:link action="create" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "bairro")}</g:link></td>
                    <td><g:link action="create" id="${prePedidoInstance.id}"><g:formatDate date="${prePedidoInstance.datapedido}"/></g:link></td>
                    <td><g:link action="create" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "distrito")}</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <div class="paginateButtons">
            <br>
            <table>
                <tr>
                    <td class="cell">
                        <filterpane:paginate params="${params}" total="${prePedidoInstanceTotal}"/>
                        <filterpane:filterButton textKey="fp.tag.filterButton.text"
                                                 appliedTextKey="fp.tag.filterButton.appliedText"
                                                 text="Filtro de Pesquisa" appliedText="Alterar Resultados de Pesquisa"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</richui:tabContent></richui:tabContents></richui:tabView>
</body>
</html>
