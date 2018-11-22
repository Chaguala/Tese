
<%@ page import="org.chaguala.sigem.despachopresidente.DespachoPresidente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="despachoPresidente.list" default="List de despachos" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            %{--<span class="menuButton"><g:link class="create" action="create"><g:message code="despachoPresidente.new" default="Criar" /></g:link></span>--}%
        </div>
        <div class="body">
            <h4><g:message code="despachoPresidente.list" default="List de despachos" /></h4>

            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                   	    <g:sortableColumn property="id" title="Id" titleKey="despachoPresidente.id" />

                        <g:sortableColumn property="numero" title="Numero" titleKey="despachoPresidente.numero" />

                            <th><g:message code="despachoPresidente.pedido" default="Pedido" /></th>

                            %{--<g:sortableColumn property="aprovado" title="Aprovado" titleKey="despachoPresidente.aprovado" />--}%

                   	    <th><g:message code="despachoPresidente.despacho" default="Despacho" /></th>

                   	    <g:sortableColumn property="obs" title="Obs" titleKey="despachoPresidente.obs" />


                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${despachoPresidenteInstanceList}" status="i" var="despachoPresidenteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${despachoPresidenteInstance.id}">${fieldValue(bean: despachoPresidenteInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: despachoPresidenteInstance, field: "numero")}</td>

                            <td>${fieldValue(bean: despachoPresidenteInstance, field: "pedido")}</td>

                            %{--<td>${fieldValue(bean: despachoPresidenteInstance, field: "aprovado")}</td>--}%

                            <td>${fieldValue(bean: despachoPresidenteInstance, field: "despacho")}</td>

                            <td>${fieldValue(bean: despachoPresidenteInstance, field: "obs")}</td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${despachoPresidenteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
