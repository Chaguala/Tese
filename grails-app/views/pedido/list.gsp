
<%@ page import="org.chaguala.sigem.pedido.Pedido" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(encodeAs: 'JavaScript',code: 'pedido.label', default: 'Pedido')}"/>
    <title><g:message code="Pedido" args="[entityName]"/></title>
</head>

<body>
%{--<richui:tabView id="tabView"><richui:tabLabels><richui:tabLabel selected="true"--}%
                                                                %{--title="${message(encodeAs: 'JavaScript',code: 'Pedido', args: [entityName])}"/></richui:tabLabels><richui:tabContents><richui:tabContent>--}%
    <div class="nav">
        <nav:render group="Pedido"/>
    </div>

    <div id="list-pedido" class="content scaffold-list" role="main">

        <h4 id="titulo"><g:message code="Listagem de Pedidos" args="[entityName]"/></h4>
        <fieldset>
            <legend title=""/>
        </fieldset>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <filterpane:filterPane domain="Pedido"
                               titleKey="fp.tag.filterPane.titleText"/>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" titleKey="pedido.id" />
                %{--<th><g:message code="prepedido.requerente" default="Requerente" /></th>--}%
                <g:sortableColumn property="id" title="Num. Pedido" titleKey="pedido.numero" />
                %{--<g:sortableColumn property="id" title="Requerente" titleKey="prePedido.requerente" />--}%
                <g:sortableColumn property="id" title="Dimessoes" titleKey="pedido.dimessoes" />
                <g:sortableColumn property="id" title="Num. Parcela" titleKey="pedido.numparcela" />
                <g:sortableColumn property="id" title="Latitude" titleKey="pedido.latitude" />
                <g:sortableColumn property="id" title="Longitude" titleKey="pedido.longitude" />
                <g:sortableColumn property="id" title="U" titleKey="pedido.u" />
                <g:sortableColumn property="id" title="W" titleKey="pedido.w" />
                <g:sortableColumn property="id" title="Z" titleKey="pedido.z" />
                <g:sortableColumn property="id" title="Posto" titleKey="pedido.posto" />
                <g:sortableColumn property="id" title="Localidade" titleKey="pedido.localidade" />
                <g:sortableColumn property="id" title="Observacao" titleKey="pedido.obs" />

                %{--<th><g:message code="pedido.requerente" default="Requerente" /></th>--}%

                %{--<th><g:message code="pedido.actidade" default="Actidade" /></th>--}%

                %{--<th><g:message code="pedido.bairro" default="Bairro" /></th>--}%

                %{--<th><g:message code="pedido.distrito" default="Distrito" /></th>--}%

            </tr>
            </thead>
            <tbody>
            <g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "id")}</g:link></td>
                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "requerente")}</g:link></td>--}%
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "numero")}</g:link></td>
                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "requerente")}</g:link></td>--}%
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "dimessoes")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "numparcela")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "latitude")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "longitude")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "u")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "w")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "z")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "posto")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "localidade")}</g:link></td>
                    <td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "obs")}</g:link></td>

                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "requerente")}</g:link></td>--}%

                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "actidade")}</g:link></td>--}%

                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "bairro")}</g:link></td>--}%

                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "distrito")}</g:link></td>--}%

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
                        <filterpane:paginate params="${params}" total="${pedidoInstanceTotal}"/>
                        <filterpane:filterButton textKey="fp.tag.filterButton.text"
                                                 appliedTextKey="fp.tag.filterButton.appliedText"
                                                 text="Filtro de Pesquisa" appliedText="Alterar Resultados de Pesquisa"/>
                    </td>
                </tr>
            </table>

        </div>
    </div>
%{--</richui:tabContent></richui:tabContents></richui:tabView>--}%
</body>
</html>
