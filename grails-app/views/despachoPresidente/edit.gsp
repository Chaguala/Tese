
<%@ page import="org.chaguala.sigem.despachopresidente.DespachoPresidente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="despachoPresidente.edit" default="Edit DespachoPresidente" /></title>
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
            <h4><g:message code="despachoPresidente.edit" default="Actualizar dados" /></h4>
            <fieldset>
                <legend title=""/>
            </fieldset>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${despachoPresidenteInstance}">
            <div class="errors">
                <g:renderErrors bean="${despachoPresidenteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${despachoPresidenteInstance?.id}" />
                <g:hiddenField name="version" value="${despachoPresidenteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="despacho"><g:message code="despachoPresidente.despacho" default="Despacho" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'despacho', 'errors')}">
                                    <g:select name="despacho.id" from="${org.chaguala.sigem.despacho.Despacho.list()}" optionKey="id" value="${despachoPresidenteInstance?.despacho?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="despachoPresidente.numero" default="Numero" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: despachoPresidenteInstance, field: 'numero')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obs"><g:message code="despachoPresidente.obs" default="Obs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'obs', 'errors')}">
                                    <g:textField name="obs" value="${fieldValue(bean: despachoPresidenteInstance, field: 'obs')}" />

                                </td>
                            </tr>
                        
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                    %{--<label for="pedido"><g:message code="despachoPresidente.pedido" default="Pedido" />:</label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: despachoPresidenteInstance, field: 'pedido', 'errors')}">--}%
                                    %{--<g:select name="pedido.id" from="${org.chaguala.sigem.pedido.Pedido.list()}" optionKey="id" value="${despachoPresidenteInstance?.pedido?.id}"  />--}%

                                %{--</td>--}%
                            %{--</tr>--}%
                        
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
                <fieldset>
                    <legend title=""/>
                </fieldset>

            </g:form>
        </div>
    </body>
</html>
