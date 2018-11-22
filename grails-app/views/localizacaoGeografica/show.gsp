
<%@ page import="org.chaguala.sigem.localizacaogeografica.LocalizacaoGeografica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="localizacaoGeografica.show" default="Show LocalizacaoGeografica" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="localizacaoGeografica.list" default="LocalizacaoGeografica List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="localizacaoGeografica.new" default="New LocalizacaoGeografica" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="localizacaoGeografica.show" default="Show LocalizacaoGeografica" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${localizacaoGeograficaInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localizacaoGeografica.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: localizacaoGeograficaInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localizacaoGeografica.obs" default="Obs" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: localizacaoGeograficaInstance, field: "obs")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="localizacaoGeografica.pedido" default="Pedido" />:</td>
                                
                                <td valign="top" class="value"><g:link controller="pedido" action="show" id="${localizacaoGeograficaInstance?.pedido?.id}">${localizacaoGeograficaInstance?.pedido?.encodeAsHTML()}</g:link></td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
