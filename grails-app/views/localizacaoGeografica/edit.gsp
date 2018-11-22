
<%@ page import="org.chaguala.sigem.localizacaogeografica.LocalizacaoGeografica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="localizacaoGeografica.edit" default="Edit LocalizacaoGeografica" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="localizacaoGeografica.list" default="LocalizacaoGeografica List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="localizacaoGeografica.new" default="New LocalizacaoGeografica" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="localizacaoGeografica.edit" default="Edit LocalizacaoGeografica" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${localizacaoGeograficaInstance}">
            <div class="errors">
                <g:renderErrors bean="${localizacaoGeograficaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${localizacaoGeograficaInstance?.id}" />
                <g:hiddenField name="version" value="${localizacaoGeograficaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs"><g:message code="localizacaoGeografica.obs" default="Obs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localizacaoGeograficaInstance, field: 'obs', 'errors')}">
                                    <g:textField name="obs" value="${fieldValue(bean: localizacaoGeograficaInstance, field: 'obs')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pedido"><g:message code="localizacaoGeografica.pedido" default="Pedido" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localizacaoGeograficaInstance, field: 'pedido', 'errors')}">
                                    <g:select name="pedido.id" from="${org.chaguala.sigem.pedido.Pedido.list()}" optionKey="id" value="${localizacaoGeograficaInstance?.pedido?.id}"  />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
