
<%@ page import="org.chaguala.sigem.pedido.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="pedido.show" default="Detalhes do Pedido" /></title>
    </head>
    <body>

    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="pedido.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="pedido.new" default="Criar Novo" /></g:link></span>
        </div>

    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="pedido.show" default="Detalhes do Pedido" /></h4>

            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${pedidoInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.numero" default="Numero" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "numero")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.numparcela" default="Numparcela" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "numparcela")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.dimessoes" default="Dimessoes" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "dimessoes")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.latitude" default="Latitude" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "latitude")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.localidade" default="Localidade" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="localidade" action="show" id="${pedidoInstance?.localidade?.id}">${pedidoInstance?.localidade?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.longitude" default="Longitude" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "longitude")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.obs" default="Obs" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "obs")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.posto" default="Posto" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="postoAdministrativo" action="show" id="${pedidoInstance?.posto?.id}">${pedidoInstance?.posto?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.prepedido" default="Prepedido" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="prePedido" action="show" id="${pedidoInstance?.prepedido?.id}">${pedidoInstance?.prepedido?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.u" default="U" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "u")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.w" default="W" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "w")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pedido.z" default="Z" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: pedidoInstance, field: "z")}</td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>

                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Editar', 'default': 'Editar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
