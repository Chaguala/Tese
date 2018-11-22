
<%@ page import="org.chaguala.sigem.pedido.PrePedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="prePedido.list" default="PrePedido List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="prePedido.new" default="Criar" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="prePedido.list" default="Lista de Pre-pedidos registados" /></h4>
            <fieldset>
                <legend title="">
                </legend>
            </fieldset>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="prePedido.id" />
                        
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
                        
                            <td><g:link action="show" id="${prePedidoInstance.id}">${fieldValue(bean: prePedidoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: prePedidoInstance, field: "tipoproprietario")}</td>
                        
                            <td>${fieldValue(bean: prePedidoInstance, field: "actidade")}</td>
                        
                            <td>${fieldValue(bean: prePedidoInstance, field: "bairro")}</td>
                        
                            <td><g:formatDate date="${prePedidoInstance.datapedido}" /></td>
                        
                            <td>${fieldValue(bean: prePedidoInstance, field: "distrito")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${prePedidoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
