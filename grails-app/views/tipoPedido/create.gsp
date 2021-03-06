
<%@ page import="org.chaguala.sigem.tipopedido.TipoPedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="tipoPedido.create" default="Criar novo tipo de pedido" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="tipoPedido.list" default="Listar" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="tipoPedido.create" default="Criar novo tipo de pedido" /></h4>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${tipoPedidoInstance}">
            <div class="errors">
                <g:renderErrors bean="${tipoPedidoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="tipoPedido.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tipoPedidoInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" size="50"
                                                 placeholder="Designacao do tipo de pedido"
                                                 maxlength="200" value="${fieldValue(bean: tipoPedidoInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="tipoPedido.estado" default="Estado" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tipoPedidoInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${tipoPedidoInstance.constraints.estado.inList}" value="${tipoPedidoInstance.estado}" valueMessagePrefix="tipoPedido.estado"  />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Criar', 'default': 'Criar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
