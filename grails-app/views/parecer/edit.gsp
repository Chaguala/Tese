
<%@ page import="org.chaguala.sigem.parecer.Parecer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="parecer.edit" default="Edit Parecer" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="parecer.list" default="Listar" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="parecer.new" default="Criar Novo" /></g:link></span>
        </div>
        <div class="body">
            <h4><g:message code="parecer.edit" default="Actualizar dados" /></h4>

            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${parecerInstance}">
            <div class="errors">
                <g:renderErrors bean="${parecerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${parecerInstance?.id}" />
                <g:hiddenField name="version" value="${parecerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nivel"><g:message code="parecer.nivel" default="Nivel" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'nivel', 'errors')}">
                                    <g:select name="nivel.id" from="${org.chaguala.sigem.nivel.Nivel.list()}" optionKey="id" value="${parecerInstance?.nivel?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="parecer.numero" default="Numero" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: parecerInstance, field: 'numero')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs"><g:message code="parecer.obs" default="Obs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'obs', 'errors')}">
                                    <g:textField name="obs" value="${fieldValue(bean: parecerInstance, field: 'obs')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parecer"><g:message code="parecer.parecer" default="Parecer" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'parecer', 'errors')}">
                                    <g:textField name="parecer" value="${fieldValue(bean: parecerInstance, field: 'parecer')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pedido"><g:message code="parecer.pedido" default="Pedido" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: parecerInstance, field: 'pedido', 'errors')}">
                                    <g:select name="pedido.id" from="${org.chaguala.sigem.pedido.Pedido.list()}" optionKey="id" value="${parecerInstance?.pedido?.id}"  />

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
