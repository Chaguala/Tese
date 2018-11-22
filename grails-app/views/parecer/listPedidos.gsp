
<%@ page import="org.chaguala.sigem.pedido.Pedido" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="pedido.list" default="Pedido List" /></title>
    <g:javascript library="application" />
    <modalbox:modalIncludes />
</head>
<body>

<div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    %{--<span class="menuButton"><g:link class="create" action="create"><g:message code="pedido.new" default="New Pedido" /></g:link></span>--}%
</div>

<fieldset>
    <legend title=""/>
</fieldset>

<div class="body">
    <h4><g:message code="pedido.list" default="List pedido" /></h4>

    <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>

    <fieldset>
        <legend title=""/>
    </fieldset>

%{--<modalbox:createLink controller=""book" action=""show" id=""${book.id}" title=""Show book!" width=""500">Book Lorem ipsum</modalbox:createLink>modalbox:createLink></modalbox:createLink>--}%

    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" titleKey="pedido.id" />
                %{--<th><g:message code="prepedido.requerente" default="Requerente" /></th>--}%
                <g:sortableColumn property="id" title="Num. Pedido" titleKey="pedido.numero" />
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
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "id")}</g:link></td>
                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "requerente")}</g:link></td>--}%
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "numero")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "dimessoes")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "numparcela")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "latitude")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "longitude")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "u")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "w")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "z")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "posto")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "localidade")}</g:link></td>
                    <td><g:link action="create" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "obs")}</g:link></td>

                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "requerente")}</g:link></td>--}%
                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "actidade")}</g:link></td>--}%
                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "bairro")}</g:link></td>--}%
                    %{--<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "distrito")}</g:link></td>--}%

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <fieldset>
        <legend title=""/>
    </fieldset>

    <div class="paginateButtons">
        <g:paginate total="${pedidoInstanceTotal}" />
    </div>
</div>
</body>
</html>
