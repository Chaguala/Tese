
<%@ page import="org.chaguala.sigem.localizacaogeografica.LocalizacaoGeografica" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="localizacaoGeografica.list" default="LocalizacaoGeografica List" /></title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="localizacaoGeografica.new" default="New LocalizacaoGeografica" /></g:link></span>
</div>
<div class="body">
    <h1><g:message code="localizacaoGeografica.list" default="LocalizacaoGeografica List" /></h1>
    <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" titleKey="localizacaoGeografica.id" />

                <g:sortableColumn property="obs" title="Obs" titleKey="localizacaoGeografica.obs" />

                <th><g:message code="localizacaoGeografica.pedido" default="Pedido" /></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${localizacaoGeograficaInstanceList}" status="i" var="localizacaoGeograficaInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${localizacaoGeograficaInstance.id}">${fieldValue(bean: localizacaoGeograficaInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: localizacaoGeograficaInstance, field: "obs")}</td>

                    <td>${fieldValue(bean: localizacaoGeograficaInstance, field: "pedido")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${localizacaoGeograficaInstanceTotal}" />
    </div>
</div>
</body>
</html>
