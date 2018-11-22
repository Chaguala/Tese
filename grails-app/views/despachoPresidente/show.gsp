
<%@ page import="org.chaguala.sigem.despachopresidente.DespachoPresidente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="despachoPresidente.show" default="Detalhes do Despacho" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="despachoPresidente.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="despachoPresidente.new" default="Criar" /></g:link></span>
        </div>
    <fieldset>
        <legend title=""/>
    </fieldset>

        <div class="body">
            <h4><g:message code="despachoPresidente.show" default="Detalhes do despacho" /></h4>

            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${despachoPresidenteInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="despachoPresidente.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: despachoPresidenteInstance, field: "id")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="despachoPresidente.despacho" default="Despacho" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="despacho" action="show" id="${despachoPresidenteInstance?.despacho?.id}">${despachoPresidenteInstance?.despacho?.encodeAsHTML()}</g:link></td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="despachoPresidente.numero" default="Numero" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: despachoPresidenteInstance, field: "numero")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="despachoPresidente.obs" default="Obs" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: despachoPresidenteInstance, field: "obs")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="despachoPresidente.pedido" default="Pedido" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="pedido" action="show" id="${despachoPresidenteInstance?.pedido?.id}">${despachoPresidenteInstance?.pedido?.encodeAsHTML()}</g:link></td>
                                
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

                <fieldset>
                    <legend title=""/>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
