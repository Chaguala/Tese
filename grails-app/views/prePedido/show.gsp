
<%@ page import="org.chaguala.sigem.pedido.PrePedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="prePedido.show" default="Show PrePedido" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="prePedido.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="prePedido.new" default="Criar Novo" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <fieldset>
                <legend title="Detalhes"/>
                <h4><g:message code="prePedido.show" default="Detalhes" /></h4>
            </fieldset>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${prePedidoInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: prePedidoInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.tipoproprietario" default="Tipoproprietario" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: prePedidoInstance, field: "tipoproprietario")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.actidade" default="Actidade" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="actividade" action="show" id="${prePedidoInstance?.actidade?.id}">${prePedidoInstance?.actidade?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.bairro" default="Bairro" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="bairro" action="show" id="${prePedidoInstance?.bairro?.id}">${prePedidoInstance?.bairro?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.datapedido" default="Datapedido" />:</td>
                                
                                <td valign="top" class="value"><g:formatDate date="${prePedidoInstance?.datapedido}" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.distrito" default="Distrito" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="distrito" action="show" id="${prePedidoInstance?.distrito?.id}">${prePedidoInstance?.distrito?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.provincia" default="Provincia" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="provincia" action="show" id="${prePedidoInstance?.provincia?.id}">${prePedidoInstance?.provincia?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.requerente" default="Requerente" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="requerente" action="show" id="${prePedidoInstance?.requerente?.id}">${prePedidoInstance?.requerente?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.tipodocumento" default="Tipodocumento" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="tipoDocumento" action="show" id="${prePedidoInstance?.tipodocumento?.id}">${prePedidoInstance?.tipodocumento?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="prePedido.tipopedido" default="Tipopedido" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="tipoPedido" action="show" id="${prePedidoInstance?.tipopedido?.id}">${prePedidoInstance?.tipopedido?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <legend title="Opcoes com registos"/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Editar', 'default': 'Editar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Tem certeza de que pretende apagar esse registo?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
