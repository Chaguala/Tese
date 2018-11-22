
<%@ page import="org.chaguala.sigem.nivel.Nivel" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="nivel.edit" default="Edit Nivel" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="nivel.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="nivel.new" default="Criar Novo" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="nivel.edit" default="Actualizar nivel" /></h4>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${nivelInstance}">
            <div class="errors">
                <g:renderErrors bean="${nivelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${nivelInstance?.id}" />
                <g:hiddenField name="version" value="${nivelInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nivel"><g:message code="nivel.nivel" default="Nivel" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nivelInstance, field: 'nivel', 'errors')}">
                                    <g:textField name="nivel" maxlength="200" value="${fieldValue(bean: nivelInstance, field: 'nivel')}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Actualizar', 'default': 'Actualizar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
