
<%@ page import="org.chaguala.sigem.actividade.Actividade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="actividade.edit" default="Edit Actividade" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="actividade.list" default="Actividade List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="actividade.new" default="New Actividade" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="actividade.edit" default="Actualizar dados" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${actividadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${actividadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${actividadeInstance?.id}" />
                <g:hiddenField name="version" value="${actividadeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="actividade.estado" default="Estado" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actividadeInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${actividadeInstance.constraints.estado.inList}" value="${actividadeInstance.estado}" valueMessagePrefix="actividade.estado"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designacao"><g:message code="actividade.designacao" default="Designacao" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actividadeInstance, field: 'designacao', 'errors')}">
                                    <g:textField name="designacao" size="50"
                                                 placeholder="Designacao da actividade" maxlength="200" value="${fieldValue(bean: actividadeInstance, field: 'designacao')}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>

                <fieldset>
                    <legend title=""/>
                </fieldset>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Actualizar', 'default': 'Actualizar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Apagar', 'default': 'Apagar')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
