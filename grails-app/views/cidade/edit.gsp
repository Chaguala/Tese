
<%@ page import="org.chaguala.sigem.distibuicaoAdministrativa.Cidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="cidade.edit" default="Edit Cidade" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="cidade.list" default="Cidade List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="cidade.new" default="New Cidade" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="cidade.edit" default="Edit Cidade" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${cidadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${cidadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cidadeInstance?.id}" />
                <g:hiddenField name="version" value="${cidadeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="cidade.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cidadeInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" maxlength="200" value="${fieldValue(bean: cidadeInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="cidade.descricao" default="Descricao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cidadeInstance, field: 'descricao', 'errors')}">
                                    <g:textArea name="descricao" rows="5" cols="40" value="${fieldValue(bean: cidadeInstance, field: 'descricao')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distrito"><g:message code="cidade.distrito" default="Distrito" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cidadeInstance, field: 'distrito', 'errors')}">
                                    <g:select name="distrito.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Distrito.list()}" optionKey="id" value="${cidadeInstance?.distrito?.id}" noSelection="['null': '']" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="cidade.provincia" default="Provincia" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cidadeInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" from="${org.chaguala.sigem.distibuicaoAdministrativa.Provincia.list()}" optionKey="id" value="${cidadeInstance?.provincia?.id}"  />

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
