
<%@ page import="org.chaguala.sigem.tipopedido.TipoPedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="tipoPedido.list" default="TipoPedido List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="tipoPedido.new" default="Criar" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="tipoPedido.list" default="Lista de tipo de pedido" /></h4>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="tipoPedido.id" />
                        
                   	    <g:sortableColumn property="designacao" title="Designacao" titleKey="tipoPedido.designacao" />
                        
                   	    <g:sortableColumn property="estado" title="Estado" titleKey="tipoPedido.estado" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tipoPedidoInstanceList}" status="i" var="tipoPedidoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tipoPedidoInstance.id}">${fieldValue(bean: tipoPedidoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tipoPedidoInstance, field: "designacao")}</td>
                        
                            <td>${fieldValue(bean: tipoPedidoInstance, field: "estado")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tipoPedidoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
